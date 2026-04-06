# 公開前 TODO

## 必須（Stripe審査通過 + サイト動作に必要）

### 1. 特商法ページの情報記入
- ファイル: `pages/legal/tokushoho.html`
- `[事業者名]`、`[氏名]`、`[住所]`、`[メールアドレス]` を実際の情報に置き換える
- Stripe審査で**必須**（これがないと決済停止のまま）

### 2. Supabaseプロジェクトの認証情報設定
- `js/supabase-client.js` の以下を実際の値に置き換え:
  - `SUPABASE_URL` (8行目)
  - `SUPABASE_ANON_KEY` (9行目)
- `pages/auth/pricing.html` の `CHECKOUT_URL` も同様に置き換え

### 3. Supabaseマイグレーションの実行（全てSQL Editorで実行）
- `supabase/migrations/001_create_tables.sql` → subscriptionsテーブル + RLS + トリガー
- `supabase/migrations/002_content_and_questions.sql` → content_pages + questionsテーブル + RLS
- 実行後、`supabase/import_content.json` と `supabase/import_questions.json` をインポート
  - 方法1: Supabase Dashboard → SQL Editor でINSERT文を実行
  - 方法2: Supabase REST API で POST

### 4. Stripe商品・価格の作成
- Stripe Dashboard で以下の4つの Price を作成:
  - 1ヶ月: ¥980/月 (recurring, monthly)
  - 3ヶ月: ¥2,480/3ヶ月 (recurring, every 3 months)
  - 6ヶ月: ¥4,480/6ヶ月 (recurring, every 6 months)
  - 1年: ¥7,980/年 (recurring, yearly)
- 各 Price ID を `pages/auth/pricing.html` の `PRICE_IDS` オブジェクトに設定

### 5. Supabase環境変数の設定
- Supabase Dashboard → Edge Functions → Secrets に以下を設定:
  - `STRIPE_SECRET_KEY`: Stripeのシークレットキー
  - `STRIPE_WEBHOOK_SECRET`: Webhookの署名シークレット
  - `FRONTEND_ORIGIN`: 公開サイトのURL（例: `https://yourdomain.com`）
- ※ `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY` はEdge Functionsで自動的に利用可能なため設定不要

### 6. Stripe Webhookの登録
- Stripe Dashboard → Developers → Webhooks で以下を設定:
  - エンドポイント: `https://<YOUR_PROJECT>.supabase.co/functions/v1/stripe-webhook`
  - イベント: `checkout.session.completed`, `customer.subscription.updated`, `customer.subscription.deleted`, `invoice.payment_succeeded`, `invoice.payment_failed`

### 7. Supabase Edge Functionsのデプロイ
- `supabase functions deploy create-checkout-session`
- `supabase functions deploy stripe-webhook`
- `supabase functions deploy create-portal-session`

### 8. SEOのドメイン設定
- `index.html`、`sitemap.xml`、`robots.txt` 内の `YOUR_DOMAIN` を実際のドメインに置換
- Google Search Console にサイトを登録し、sitemap.xml を送信

### 9. GitHub Pages へのデプロイ
- GitHubリポジトリにpush
- Settings → Pages → Source を `main` / `/ (root)` に設定
- カスタムドメインを設定する場合は CNAME レコードを追加

### 10. Stripe審査の再提出
- 上記1〜9が完了したら、Stripeメールの「ウェブサイトを提出する」ボタンから再提出
- 2営業日以内に審査結果が届く

## 推奨（公開後でも可）

### 11. `.env` の削除確認
- `.env` がGitリポジトリの履歴に含まれていないか確認
- 含まれていたら `BFG Repo-Cleaner` でパスワードを除去
- `その他/stripe_backup_code.txt` も同様

### 12. マイページの実装
- ヘッダーに「マイページ」リンクがあるが、ページ自体が未作成
- サブスクリプション状態の確認、プラン変更、解約機能が必要

### 13. カスタムドメイン + Cloudflare（任意）
- セキュリティヘッダー（X-Frame-Options等）を追加したい場合のみ
- GitHub Pagesだけでも基本的に問題なし
