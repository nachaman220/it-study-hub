-- ============================================================
-- Migration 002: content_pages and questions tables
-- Protects premium content behind RLS (JWT auth + subscription check)
-- ============================================================

-- ── Helper function: check if user has active subscription ──
create or replace function public.has_active_subscription()
returns boolean as $$
begin
  return exists (
    select 1 from public.subscriptions
    where user_id = auth.uid()
      and status = 'active'
      and current_period_end > now()
  );
end;
$$ language plpgsql security definer stable;

-- ============================================================
-- content_pages: educational content (HTML body per section)
-- ============================================================
create table public.content_pages (
  id uuid default gen_random_uuid() primary key,
  section_id text not null unique,       -- e.g. "1.1", "2.3"
  chapter int not null,                  -- 1, 2, 3, 4
  section_order int not null,            -- order within chapter
  title text not null,                   -- e.g. "認証ソリューションと Microsoft Entra"
  slug text not null unique,             -- e.g. "entra-id"
  content_html text not null,            -- the actual HTML body
  is_free boolean not null default false, -- true for free tier content
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

alter table public.content_pages enable row level security;

-- Free content: anyone can read
create policy "Anyone can read free content" on public.content_pages
  for select using (is_free = true);

-- Premium content: only active subscribers
create policy "Subscribers can read premium content" on public.content_pages
  for select using (
    is_free = false
    and auth.uid() is not null
    and public.has_active_subscription()
  );

-- ============================================================
-- questions: quiz questions
-- ============================================================
create table public.questions (
  id serial primary key,
  exam text not null default 'az-305',   -- exam identifier
  question text not null,
  choices jsonb not null,                -- ["A. ...", "B. ...", ...]
  answer jsonb not null,                 -- single index (0) or array [0,1]
  explanation text,
  category text,
  tags text[] default '{}',
  is_free boolean not null default false,
  source text,                           -- e.g. "book-ch1", "website"
  created_at timestamptz default now()
);

alter table public.questions enable row level security;

-- Free questions: anyone can read
create policy "Anyone can read free questions" on public.questions
  for select using (is_free = true);

-- Premium questions: only active subscribers
create policy "Subscribers can read premium questions" on public.questions
  for select using (
    is_free = false
    and auth.uid() is not null
    and public.has_active_subscription()
  );

-- Indexes
create index idx_questions_exam on public.questions(exam);
create index idx_questions_tags on public.questions using gin(tags);
create index idx_questions_is_free on public.questions(is_free);
create index idx_content_pages_section on public.content_pages(section_id);
create index idx_content_pages_chapter on public.content_pages(chapter);
