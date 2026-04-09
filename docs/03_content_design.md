# コンテンツ設計

## コンテンツソース

| ソース | 用途 | 注意事項 |
|--------|------|----------|
| MS Learn / 公式ドキュメント | ベース情報。正確な仕様の根拠 | CC BY 4.0（出典明記で利用可） |
| Kindle教材 | 参考書的な構成・説明の参考 | スクショはgitignore済み。文章はそのまま使わず再構成 |
| it-concepts-japan.com | AZ-900問題の参考元 | 要改変（現状そのまま利用のためリスクあり） |
| 独自作成 | AZ-305問題・教材 | Claude Codeで生成・構造化 |

## コンテンツ方針
- 元ソースの文章をそのままコピペしない。自分の言葉で再構成する
- 長い説明文より**比較表**と**判断フロー**を重視する
- 各ページに出典としてMS Learnへのリンクを記載する
- 試験で実際に問われるポイントを明示する

## コンテンツ配信方式

### 教材ページ
- Supabase `content_pages` テーブルにHTML形式で格納
- `content-loader.js` が `data-section` 属性を元にAPIで取得・表示
- HTMLシェルファイルは `pages/` 配下に配置（静的）

### 問題データ
- Supabase `questions` テーブルに格納
- クライアント側にも `questions/all-questions.js` として静的配信
- インラインクイズ: `inline-quiz.js` が教材ページ内に練習問題を埋め込み

## AZ-900 コンテンツ構成

| セクション | ページ | 主要トピック |
|-----------|--------|------------|
| クラウドの概念 | cloud-concepts.html | クラウドとは、IaaS/PaaS/SaaS |
| クラウドの利点 | cloud-benefits.html | 高可用性、スケーラビリティ、弾力性 |
| クラウドサービスの種類 | cloud-service-types.html | 共有責任モデル |
| コアアーキテクチャ | core-architecture.html | リージョン、可用性ゾーン |
| コスト管理 | cost-management.html | 料金計算、Cost Management |
| ガバナンス | governance.html | Policy、Blueprints、ロック |
| ID・セキュリティ | identity-security.html | Entra ID、MFA、Defender |
| 管理ツール | management-tools.html | Portal、CLI、PowerShell |
| 監視 | monitoring.html | Azure Monitor、Service Health |
| ストレージ | storage.html | Blob、Files、Queue、Table |

## AZ-305 コンテンツ構成

4章構成。詳細は `06_az305_outline.md` を参照。

| 章 | テーマ | ページ数 |
|----|--------|----------|
| 第1章 | ID・ガバナンス・監視 | 7ページ |
| 第2章 | データソリューション | 4ページ |
| 第3章 | 事業継続性 | 3ページ（+1） |
| 第4章 | インフラストラクチャ | 4ページ |

## 問題データの形式

```json
{
  "exam": "az-305",
  "question": "問題文",
  "choices": ["A. 選択肢1", "B. 選択肢2", "C. 選択肢3"],
  "answer": 2,
  "explanation": "解説文",
  "category": "data",
  "tags": ["data-analytics"],
  "source": "website",
  "is_free": false,
  "primary_section": "2-1",
  "access_level": "premium"
}
```

## アクセス制御の範囲

| 試験 | guest（非会員） | free（無料会員） | premium（有料会員） |
|------|----------------|-----------------|-------------------|
| AZ-900 | セクション1-1 | 1-2, 1-3 | 全セクション |
| AZ-305 | セクション1.1 | 1.2〜1.7 | 全セクション |
