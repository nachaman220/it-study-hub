import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@14.14.0?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.39.3";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2023-10-16",
  httpClient: Stripe.createFetchHttpClient(),
});

const WEBHOOK_SECRET = Deno.env.get("STRIPE_WEBHOOK_SECRET")!;

const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

/**
 * Map a Stripe price interval to our plan_interval values.
 */
function toPlanInterval(
  interval: string,
  intervalCount: number
): string | null {
  if (interval === "month" && intervalCount === 1) return "month";
  if (interval === "month" && intervalCount === 3) return "quarter";
  if (interval === "month" && intervalCount === 6) return "half_year";
  if (interval === "year" && intervalCount === 1) return "year";
  return interval;
}

/**
 * Upsert a subscription row keyed by stripe_subscription_id.
 */
async function upsertSubscription(data: Record<string, unknown>) {
  const { error } = await supabase
    .from("subscriptions")
    .upsert(data, { onConflict: "stripe_subscription_id" });

  if (error) {
    console.error("Supabase upsert error:", error);
    throw error;
  }
}

serve(async (req: Request) => {
  const signature = req.headers.get("stripe-signature");
  if (!signature) {
    return new Response("Missing stripe-signature header", { status: 400 });
  }

  const body = await req.text();

  let event: Stripe.Event;
  try {
    event = await stripe.webhooks.constructEventAsync(
      body,
      signature,
      WEBHOOK_SECRET
    );
  } catch (err) {
    console.error("Webhook signature verification failed:", err.message);
    return new Response(`Webhook Error: ${err.message}`, { status: 400 });
  }

  try {
    switch (event.type) {
      // -----------------------------------------------------------
      // checkout.session.completed
      // -----------------------------------------------------------
      case "checkout.session.completed": {
        const session = event.data.object as Stripe.Checkout.Session;
        const userId = session.metadata?.supabase_user_id;
        if (!userId) {
          console.warn("No supabase_user_id in session metadata");
          break;
        }

        // Retrieve the full subscription to get interval info
        const subscription = await stripe.subscriptions.retrieve(
          session.subscription as string
        );
        const item = subscription.items.data[0];
        const planInterval = toPlanInterval(
          item.price.recurring!.interval,
          item.price.recurring!.interval_count
        );

        await upsertSubscription({
          user_id: userId,
          stripe_customer_id: session.customer as string,
          stripe_subscription_id: subscription.id,
          status: "active",
          plan_interval: planInterval,
          current_period_start: new Date(
            subscription.current_period_start * 1000
          ).toISOString(),
          current_period_end: new Date(
            subscription.current_period_end * 1000
          ).toISOString(),
          updated_at: new Date().toISOString(),
        });
        break;
      }

      // -----------------------------------------------------------
      // customer.subscription.updated
      // -----------------------------------------------------------
      case "customer.subscription.updated": {
        const subscription = event.data.object as Stripe.Subscription;
        const userId = subscription.metadata?.supabase_user_id;
        if (!userId) break;

        const item = subscription.items.data[0];
        const planInterval = toPlanInterval(
          item.price.recurring!.interval,
          item.price.recurring!.interval_count
        );

        const status =
          subscription.status === "active"
            ? "active"
            : subscription.status === "past_due"
            ? "past_due"
            : subscription.status === "canceled"
            ? "cancelled"
            : subscription.status;

        await upsertSubscription({
          user_id: userId,
          stripe_customer_id: subscription.customer as string,
          stripe_subscription_id: subscription.id,
          status,
          plan_interval: planInterval,
          current_period_start: new Date(
            subscription.current_period_start * 1000
          ).toISOString(),
          current_period_end: new Date(
            subscription.current_period_end * 1000
          ).toISOString(),
          updated_at: new Date().toISOString(),
        });
        break;
      }

      // -----------------------------------------------------------
      // customer.subscription.deleted
      // -----------------------------------------------------------
      case "customer.subscription.deleted": {
        const subscription = event.data.object as Stripe.Subscription;
        const userId = subscription.metadata?.supabase_user_id;
        if (!userId) break;

        await upsertSubscription({
          user_id: userId,
          stripe_customer_id: subscription.customer as string,
          stripe_subscription_id: subscription.id,
          status: "cancelled",
          updated_at: new Date().toISOString(),
        });
        break;
      }

      // -----------------------------------------------------------
      // invoice.payment_succeeded
      // -----------------------------------------------------------
      case "invoice.payment_succeeded": {
        const invoice = event.data.object as Stripe.Invoice;
        if (!invoice.subscription) break;

        const subscription = await stripe.subscriptions.retrieve(
          invoice.subscription as string
        );
        const userId = subscription.metadata?.supabase_user_id;
        if (!userId) break;

        await upsertSubscription({
          user_id: userId,
          stripe_customer_id: invoice.customer as string,
          stripe_subscription_id: subscription.id,
          status: "active",
          current_period_start: new Date(
            subscription.current_period_start * 1000
          ).toISOString(),
          current_period_end: new Date(
            subscription.current_period_end * 1000
          ).toISOString(),
          updated_at: new Date().toISOString(),
        });
        break;
      }

      // -----------------------------------------------------------
      // invoice.payment_failed
      // -----------------------------------------------------------
      case "invoice.payment_failed": {
        const invoice = event.data.object as Stripe.Invoice;
        if (!invoice.subscription) break;

        const subscription = await stripe.subscriptions.retrieve(
          invoice.subscription as string
        );
        const userId = subscription.metadata?.supabase_user_id;
        if (!userId) break;

        await upsertSubscription({
          user_id: userId,
          stripe_customer_id: invoice.customer as string,
          stripe_subscription_id: subscription.id,
          status: "past_due",
          updated_at: new Date().toISOString(),
        });
        break;
      }

      default:
        console.log(`Unhandled event type: ${event.type}`);
    }
  } catch (err) {
    console.error(`Error handling ${event.type}:`, err);
    return new Response(JSON.stringify({ error: err.message }), {
      status: 500,
    });
  }

  return new Response(JSON.stringify({ received: true }), {
    status: 200,
    headers: { "Content-Type": "application/json" },
  });
});
