import { serve } from "https://deno.land/std@0.177.0/http/server.ts";
import Stripe from "https://esm.sh/stripe@14.14.0?target=deno";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.39.3";

const stripe = new Stripe(Deno.env.get("STRIPE_SECRET_KEY")!, {
  apiVersion: "2023-10-16",
  httpClient: Stripe.createFetchHttpClient(),
});

const FRONTEND_ORIGIN = Deno.env.get("FRONTEND_ORIGIN");
if (!FRONTEND_ORIGIN) {
  console.warn("FRONTEND_ORIGIN not set – CORS will reject all requests");
}

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": FRONTEND_ORIGIN ?? "https://localhost",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

serve(async (req: Request) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: CORS_HEADERS });
  }

  try {
    // Verify the user's JWT to prevent spoofing userId
    const authHeader = req.headers.get("authorization");
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: "Missing authorization header" }),
        {
          status: 401,
          headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        }
      );
    }

    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_ANON_KEY")!,
      { global: { headers: { Authorization: authHeader } } }
    );
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: "Unauthorized" }),
        {
          status: 401,
          headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        }
      );
    }

    const { priceId } = await req.json();

    if (!priceId) {
      return new Response(
        JSON.stringify({ error: "priceId is required" }),
        {
          status: 400,
          headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
        }
      );
    }

    // Use verified user data instead of trusting request body
    const userId = user.id;
    const userEmail = user.email!;

    const session = await stripe.checkout.sessions.create({
      mode: "subscription",
      payment_method_types: ["card"],
      customer_email: userEmail,
      allow_promotion_codes: true,
      line_items: [
        {
          price: priceId,
          quantity: 1,
        },
      ],
      metadata: {
        supabase_user_id: userId,
      },
      subscription_data: {
        metadata: {
          supabase_user_id: userId,
        },
      },
      success_url: `${
        Deno.env.get("FRONTEND_ORIGIN") ?? "https://example.com"
      }/pages/auth/pricing.html?session_id={CHECKOUT_SESSION_ID}&success=true`,
      cancel_url: `${
        Deno.env.get("FRONTEND_ORIGIN") ?? "https://example.com"
      }/pages/auth/pricing.html?cancelled=true`,
    });

    return new Response(JSON.stringify({ url: session.url }), {
      status: 200,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("Error creating checkout session:", err);
    return new Response(
      JSON.stringify({ error: err.message }),
      {
        status: 500,
        headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      }
    );
  }
});
