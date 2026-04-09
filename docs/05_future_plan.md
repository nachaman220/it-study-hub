# 将来計画

## 現在の状態

### 完了済み
- [x] サイト基盤（HTML/CSS/JS、GitHub Pages）
- [x] Supabase連携（認証、DB、RLS、コンテンツ配信）
- [x] Stripe決済連携（サブスクリプション）
- [x] Cloudflare Turnstile（CAPTCHA）
- [x] AZ-900 教材（10セクション）+ 問題（321問）
- [x] AZ-305 教材（全4章）+ 問題（234問）
- [x] 3段階アクセス制御（guest / free / premium）
- [x] 管理者モード（Ctrl+Shift+A）
- [x] コピー防止機能
- [x] インラインクイズ（教材ページ内の練習問題）
- [x] サイドバーロック表示
- [x] 同時ログイン制御
- [x] 法的ページ（特商法、プライバシーポリシー、利用規約）

### 課題
- [ ] AZ-900問題の著作権対応（it-concepts-japan.comからの問題を改変）
- [ ] Stripe Price IDの本番設定

## ロードマップ

### 短期（次のアクション）
- AZ-900問題の改変・オリジナル化
- Stripe決済フローの本番テスト

### 中期
- 他Azure試験への展開（DP-900, AI-900, SC-900等）
- GCP試験への展開
- ダークモード対応

### 長期
- 非クラウド資格への展開
- MSの仕様アップデートへの追従
- ユーザーフィードバック機能

## コンテンツ更新フロー

### 教材更新
1. Claude Codeで教材HTMLを作成・更新
2. `import_content.json` に反映
3. Supabase REST APIでアップロード（`upload_to_supabase.py`）

### 問題追加
1. Claude Codeで問題を生成（試験範囲・傾向を指示）
2. JSONファイルに追加（`import_questions_*.json`）
3. Supabase REST APIでアップロード
4. `all-questions.js` も更新（クライアント側配信用）

### サイト更新
1. HTML/CSS/JS変更 → `git push` → GitHub Pagesに自動反映
2. コンテンツ・問題データ変更 → Supabase REST APIで更新
