# アーキテクチャ設計

## システム構成図

```
┌─────────────────────────────────────────────────────────────────┐
│                        ユーザー（ブラウザ）                        │
└──────────┬──────────────────┬──────────────────┬────────────────┘
           │                  │                  │
           ▼                  ▼                  ▼
┌──────────────────┐ ┌────────────────┐ ┌────────────────────────┐
│  GitHub Pages    │ │   Supabase     │ │   Stripe               │
│  (フロントエンド) │ │  (バックエンド) │ │  (決済)                │
│                  │ │                │ │                        │
│ - HTML/CSS/JS    │ │ - Auth (認証)  │ │ - Checkout Session     │
│ - 静的ページ     │ │ - PostgreSQL   │ │ - Webhook → Supabase   │
│ - 問題表示UI     │ │ - RLS (行レベル│ │ - サブスクリプション    │
│                  │ │   セキュリティ)│ │   管理                 │
└──────────────────┘ │ - REST API     │ └────────────────────────┘
                     └───────┬────────┘
                             │
                     ┌───────┴────────┐
                     │  Cloudflare    │
                     │  Turnstile     │
                     │  (CAPTCHA)     │
                     │                │
                     │ - ログイン保護  │
                     │ - 登録保護     │
                     └────────────────┘
```

## 技術スタック

| レイヤー | 技術 | 用途 |
|---------|------|------|
| フロントエンド | HTML5 / CSS3 / Vanilla JS | UI表示・操作 |
| ホスティング | GitHub Pages | 静的サイト配信 |
| 認証 | Supabase Auth | メール/パスワード認証 |
| データベース | Supabase PostgreSQL | コンテンツ・問題・ユーザーデータ |
| アクセス制御 | Supabase RLS | guest/free/premium 3段階制御 |
| 決済 | Stripe | プレミアム会員のサブスクリプション |
| CAPTCHA | Cloudflare Turnstile | ボット防止（ログイン・登録） |
| ビルドツール | なし | そのままブラウザで動作 |

## データフロー

### コンテンツ配信

```
[Kindle教材 / MS Learn]
        ↓ （Claude Codeで再構成・改変）
[HTML コンテンツ]
        ↓ （import_content.json → Supabase REST API）
[Supabase content_pages テーブル]
        ↓ （content-loader.js が API で取得）
[ブラウザに表示]
```

### 問題配信

```
[元データ（スクレイピング / 独自作成）]
        ↓ （Claude Codeで改変・構造化）
[JSON 問題データ]
        ↓ （upload_to_supabase.py / import_questions_*.json）
[Supabase questions テーブル]
        ↓ （quiz.js が API で取得 / all-questions.js で静的配信）
[ブラウザで出題]
```

### 認証・決済フロー

```
[ユーザー] → [Cloudflare Turnstile 検証]
    ↓
[Supabase Auth でログイン/登録]
    ↓
[無料会員として利用開始]
    ↓ （プレミアム購入時）
[Stripe Checkout]
    ↓
[Stripe Webhook → Supabase subscriptions テーブル更新]
    ↓
[RLS がアクセスレベルを判定 → premium コンテンツ解放]
```

## アクセス制御（3段階）

```
guest (非会員)     → 各試験の導入セクションのみ閲覧可
free  (無料会員)   → 無料範囲のコンテンツ・問題にアクセス可
premium (有料会員) → 全コンテンツ・全問題にアクセス可
```

| 試験 | guest | free | premium |
|------|-------|------|---------|
| AZ-900 | 1-1 | 1-2, 1-3 | 残り全て |
| AZ-305 | 1.1 | 1.2〜1.7 | 残り全て |

## ディレクトリ構成

```
it-study-hub/
├── index.html                     ← トップページ
├── css/
│   └── style.css                  ← 共通スタイル
├── js/
│   ├── supabase-client.js         ← Supabase初期化・セッション管理
│   ├── auth-guard.js              ← 認証・アクセス制御
│   ├── content-loader.js          ← Supabaseからコンテンツ取得
│   ├── quiz.js                    ← 問題表示・採点ロジック
│   ├── admin-toggle.js            ← 管理者モード切替
│   └── copy-protect.js            ← コピー防止
├── pages/
│   ├── auth/
│   │   ├── login.html             ← ログイン（Turnstile付き）
│   │   ├── register.html          ← 会員登録（Turnstile付き）
│   │   └── mypage.html            ← マイページ
│   ├── az-900/                    ← AZ-900 教材・問題
│   ├── az-305/                    ← AZ-305 教材・問題
│   │   ├── identity/
│   │   ├── data/
│   │   ├── business-continuity/
│   │   └── infrastructure/
│   └── legal/                     ← 利用規約・プライバシーポリシー等
├── questions/
│   └── all-questions.js           ← クライアント側問題データ
├── supabase/
│   ├── import_content.json        ← コンテンツインポート用
│   ├── import_questions_az900.json
│   ├── import_questions_az305.json
│   └── upload_to_supabase.py      ← Supabaseへのアップロードスクリプト
├── docs/                          ← 設計書
├── .env                           ← 環境変数（gitignore済み）
└── kindle_screenshots/            ← 教材スクリーンショット（gitignore済み）
```

## 外部サービス一覧

| サービス | URL | 用途 |
|---------|-----|------|
| GitHub Pages | nachaman220.github.io/it-study-hub/ | サイトホスティング |
| Supabase | wvwhareffgblvwureyqn.supabase.co | 認証・DB・API |
| Stripe | dashboard.stripe.com | 決済管理 |
| Cloudflare Turnstile | dash.cloudflare.com | CAPTCHA管理 |
