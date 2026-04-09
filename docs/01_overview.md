# プロジェクト概要

## プロジェクト名
IT Study Hub

## 目的
Azure認定試験（AZ-900, AZ-305）の学習を支援するブラウザベースの学習サイト。
教材ページ（参考書形式）と模擬問題集を提供し、効率的な試験対策環境を実現する。

## コンセプト
- MS Learnの情報を再構成し、試験対策に特化した教材ページを提供
- 4択問題と詳細な解説で知識を定着させる
- 3段階のアクセス制御（guest / free / premium）で収益化
- 将来的に他のクラウド資格・IT試験にもスケール可能な設計

## 対応試験

| 試験 | 教材 | 問題数 | 状態 |
|------|------|--------|------|
| AZ-900: Azure Fundamentals | 10セクション | 321問 | 公開中 |
| AZ-305: Azure Solutions Architect Expert | 4章構成 | 234問 | 公開中 |

## 技術スタック
- フロントエンド: HTML5 / CSS3 / Vanilla JavaScript（ビルドツールなし）
- ホスティング: GitHub Pages
- バックエンド: Supabase（認証・DB・API）
- 決済: Stripe（サブスクリプション）
- CAPTCHA: Cloudflare Turnstile

## 収益モデル
Stripeによるサブスクリプション方式：
- 1ヶ月: ¥980
- 3ヶ月: ¥2,480
- 6ヶ月: ¥4,480
- 1年: ¥7,980

## 制約
- 追加インフラコストなし（GitHub Pages無料、Supabase無料枠）
- AI連携はブラウザ上では行わない（問題生成はオフラインでClaude Codeが実施）
