# IT Study Hub - プロジェクトルール

## デプロイ手順
サイトに変更を加えた場合、以下の両方を実行すること:

1. **git push**: GitHub Pagesに反映（HTML/CSS/JS）
2. **Supabaseの更新**: コンテンツや問題データ、スキーマに変更がある場合
   - スキーマ変更: SQL EditorでマイグレーションSQL実行
   - データ変更: REST API（service role key）でインポート
   - Supabase URL: `https://wvwhareffgblvwureyqn.supabase.co`

## アクセス制御（3段階）
- `guest`: 非会員（誰でも閲覧可）
- `free`: 無料会員（ログインユーザー）
- `premium`: 有料会員（Stripe決済済み）

各試験の無料範囲:
- AZ-900: 1-1(guest) / 1-2,1-3(free) / 残り(premium)
- AZ-305: 1.1(guest) / 1.2-1.7(free) / 残り(premium)

## 管理者
- メールアドレスはSHA-256ハッシュで管理（admin-toggle.js）
- Ctrl+Shift+A で管理パネル表示（ログイン中の管理者のみ）

## 新試験追加の手順
memory/process_new_exam_site.md を参照

## 注意事項
- service role keyは絶対にgitにコミットしない
- kindle_screenshots/ はgitignore済み
