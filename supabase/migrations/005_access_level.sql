-- ============================================================
-- Migration 005: Add access_level column to content_pages and questions
-- Replaces binary is_free with 3-tier: guest / free / premium
-- guest = anyone (no login), free = registered user, premium = paid subscriber
-- ============================================================

-- Add access_level column
ALTER TABLE public.content_pages ADD COLUMN IF NOT EXISTS access_level text NOT NULL DEFAULT 'premium';
ALTER TABLE public.questions ADD COLUMN IF NOT EXISTS access_level text NOT NULL DEFAULT 'premium';
ALTER TABLE public.questions ADD COLUMN IF NOT EXISTS primary_section text;

-- Migrate existing is_free data
UPDATE public.content_pages SET access_level = 'guest' WHERE is_free = true;
UPDATE public.questions SET access_level = 'guest' WHERE is_free = true;

-- Drop old RLS policies
DROP POLICY IF EXISTS "Anyone can read free content" ON public.content_pages;
DROP POLICY IF EXISTS "Subscribers can read premium content" ON public.content_pages;
DROP POLICY IF EXISTS "Anyone can read free questions" ON public.questions;
DROP POLICY IF EXISTS "Subscribers can read premium questions" ON public.questions;

-- New RLS policies for 3-tier access

-- Content: guest content = anyone can read
CREATE POLICY "Anyone can read guest content" ON public.content_pages
  FOR SELECT USING (access_level = 'guest');

-- Content: free content = any authenticated user
CREATE POLICY "Authenticated users can read free content" ON public.content_pages
  FOR SELECT USING (access_level = 'free' AND auth.uid() IS NOT NULL);

-- Content: premium content = active subscribers only
CREATE POLICY "Subscribers can read premium content" ON public.content_pages
  FOR SELECT USING (
    access_level = 'premium'
    AND auth.uid() IS NOT NULL
    AND public.has_active_subscription()
  );

-- Questions: guest = anyone
CREATE POLICY "Anyone can read guest questions" ON public.questions
  FOR SELECT USING (access_level = 'guest');

-- Questions: free = any authenticated user
CREATE POLICY "Authenticated users can read free questions" ON public.questions
  FOR SELECT USING (access_level = 'free' AND auth.uid() IS NOT NULL);

-- Questions: premium = active subscribers only
CREATE POLICY "Subscribers can read premium questions" ON public.questions
  FOR SELECT USING (
    access_level = 'premium'
    AND auth.uid() IS NOT NULL
    AND public.has_active_subscription()
  );

-- Index
CREATE INDEX IF NOT EXISTS idx_content_access_level ON public.content_pages(access_level);
CREATE INDEX IF NOT EXISTS idx_questions_access_level ON public.questions(access_level);
CREATE INDEX IF NOT EXISTS idx_questions_primary_section ON public.questions(primary_section);
