# アーキテクチャ設計

## 技術スタック
- HTML5 / CSS3 / Vanilla JavaScript
- ビルドツールなし（そのままブラウザで動作）
- ホスティング：GitHub Pages

## ディレクトリ構成

```
azure-study/
├── docs/                          ← 設計書（本番には含めない）
│   ├── 01_overview.md
│   ├── 02_architecture.md
│   ├── 03_content_design.md
│   ├── 04_ui_design.md
│   └── 05_future_plan.md
├── index.html                     ← トップページ（分野一覧）
├── css/
│   └── style.css                  ← 共通スタイル
├── js/
│   ├── main.js                    ← 共通JS（ナビゲーション等）
│   ├── quiz.js                    ← 4択問題の表示・採点ロジック
│   └── speech.js                  ← 音声読み上げ（将来）
├── pages/
│   ├── identity/                  ← ID・ガバナンス分野
│   │   ├── index.html             ← 分野トップ（セクション一覧）
│   │   ├── entra-id.html          ← Microsoft Entra ID
│   │   ├── rbac.html              ← Azure ロール・RBAC
│   │   ├── governance.html        ← ガバナンス（Policy, Blueprints等）
│   │   └── monitoring.html        ← 監視ソリューション
│   ├── data/                      ← データソリューション（将来）
│   ├── business-continuity/       ← 事業継続性（将来）
│   └── infrastructure/            ← インフラストラクチャ（将来）
├── questions/
│   └── identity/
│       ├── entra-id.json          ← 4択問題データ
│       ├── rbac.json
│       ├── governance.json
│       └── monitoring.json
└── assets/
    └── images/                    ← アーキテクチャ図等（必要に応じて）
```

## ページ構成

### 参考書ページの構成
各HTMLページは以下の構造を持つ：
1. パンくずリスト（ナビゲーション）
2. ページタイトル
3. 概要（このサービス/機能は何か、いつ使うか）
4. 詳細セクション（比較表、判断フロー中心）
5. 試験での出題ポイント
6. 関連ページへのリンク
7. 出典（MS Learnへのリンク）

### 4択問題ページの構成（将来）
- 問題文の表示
- 4つの選択肢
- 回答後に正解・解説を表示
- 関連する参考書ページへのリンク

## データフロー

```
[MS Learn / 公式ドキュメント]
        ↓ （Claude Codeで再構成）
[Markdown/HTMLコンテンツ]
        ↓ （Git push）
[GitHub Pages] → ブラウザで閲覧
```

```
[試験範囲 + 過去問の傾向]
        ↓ （Claude Codeで問題生成）
[JSON問題データ]
        ↓ （Git push）
[GitHub Pages] → ブラウザで4択問題を解く
```
