-- subscriptions table
create table public.subscriptions (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  stripe_customer_id text,
  stripe_subscription_id text unique,
  status text not null default 'free' check (status in ('free', 'active', 'cancelled', 'past_due')),
  plan_interval text check (plan_interval in ('month', 'quarter', 'half_year', 'year')),
  current_period_start timestamptz,
  current_period_end timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable RLS
alter table public.subscriptions enable row level security;

-- Users can read their own subscription
create policy "Users can read own subscription" on public.subscriptions
  for select using (auth.uid() = user_id);

-- Only service role can insert/update (via webhook)
-- No insert/update policy for authenticated users

-- Create subscription record on user signup (trigger)
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.subscriptions (user_id, status)
  values (new.id, 'free');
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Index for quick lookups
create index idx_subscriptions_user_id on public.subscriptions(user_id);
create index idx_subscriptions_stripe_sub_id on public.subscriptions(stripe_subscription_id);
