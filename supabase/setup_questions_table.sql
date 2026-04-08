-- Questions テーブル作成（既存テーブルがない場合）
-- Supabase SQL Editor で実行してください

CREATE TABLE IF NOT EXISTS questions (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  exam text NOT NULL DEFAULT 'az-305',
  source text NOT NULL DEFAULT 'original',
  question text NOT NULL,
  choices jsonb NOT NULL,
  answer jsonb NOT NULL,  -- integer or array of integers
  explanation text NOT NULL,
  category text,
  tags jsonb DEFAULT '[]'::jsonb,
  created_at timestamptz DEFAULT now()
);

-- インデックス
CREATE INDEX IF NOT EXISTS idx_questions_exam ON questions(exam);
CREATE INDEX IF NOT EXISTS idx_questions_source ON questions(source);
CREATE INDEX IF NOT EXISTS idx_questions_category ON questions(category);

-- RLS有効化
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;

-- 認証済みユーザーのみ読み取り可能（問題データ保護）
CREATE POLICY "Authenticated users can read questions"
  ON questions FOR SELECT
  TO authenticated
  USING (true);

-- 匿名ユーザー（未ログイン）は読み取り不可
-- ※ 無料問題のみ匿名で見せたい場合は別途ポリシーを追加
