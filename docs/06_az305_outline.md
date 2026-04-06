# AZ-305 試験範囲 章・節立て

出典: Microsoft公式試験スキル領域 + 参考書の構成を参考に再整理

---

## 第1章 ID・ガバナンス・監視ソリューションの設計

### 1.1 Azureの認証ソリューションとMicrosoft Entra
- Microsoft Entra ID（旧Azure AD）
  - 基本概念・テナント
  - 多要素認証（MFA）
  - 外部ユーザー管理
- Microsoft Entra Connect
  - オンプレADとの同期
  - パスワードハッシュ同期 vs パススルー認証 vs フェデレーション
- Microsoft Entra B2B / B2C
  - B2B: 組織間コラボレーション
  - B2C: コンシューマー向けID管理
- Microsoft Entra アプリケーションプロキシ
- Microsoft Entra ID Governance
- Microsoft Entra ライセンス（Free / P1 / P2）

### 1.2 Azureの認可ソリューション
- Azure ロール（RBAC）
  - 組み込みロール（Owner, Contributor, Reader等）
  - カスタムロール
  - ロールの割り当てスコープ（管理グループ / サブスクリプション / リソースグループ / リソース）
- Microsoft Entra ロール
  - Azure RBACとの違い
- 条件付きアクセス
  - ポリシーの構成要素（ユーザー、アプリ、条件、制御）
- Privileged Identity Management（PIM）
  - Just-In-Timeアクセス
  - アクセスレビュー

### 1.3 ガバナンス・コンプライアンス
- 管理グループ
  - 階層構造の設計
- サブスクリプション設計
- Azure Policy
  - ポリシー定義 / イニシアティブ
  - 効果（Deny, Audit, Append, DeployIfNotExists等）
- Azure Blueprints
  - Policyとの違い・使い分け
- リソースロック（ReadOnly / Delete）
- タグ付け戦略
- Azure Purview（コンプライアンス）

### 1.4 監視ソリューション
- Azure Monitor
  - メトリクス vs ログ
  - 監視データの活用
- Azure Monitor ログ（Log Analytics）
  - Log Analyticsワークスペース
  - KQLクエリ
- Application Insights
- アラートルール
  - アクショングループ
- Azure ダッシュボード / Workbooks
- Microsoft Cost Management
  - コスト分析・予算・アラート

---

## 第2章 データソリューションの設計

### 2.1 データソリューションの基礎
- 構造化データ vs 非構造化データ
- ストレージの種類
  - リレーショナルデータベース
  - 非リレーショナルデータベース
  - データウェアハウス
  - データレイク

### 2.2 Azure Storage
- ストレージアカウントの種類（Standard / Premium, v2 / BlobStorage等）
- ストレージの冗長性（LRS / ZRS / GRS / RA-GRS / GZRS / RA-GZRS）
- アクセス層（Hot / Cool / Cold / Archive）

### 2.3 Azure Blob
- Blob の種類（ブロック / 追加 / ページ）
- Blob のアクセス層
- ライフサイクル管理

### 2.4 Azure Files / Azure NetApp Files
- SMB / NFS プロトコル
- Azure File Sync

### 2.5 Azure SQL Database
- デプロイモデル（Single Database / Elastic Pool / Managed Instance）
- 購入モデル（DTU vs vCore）
- サービスレベル（General Purpose / Business Critical / Hyperscale）
- セキュリティ（TDE, Always Encrypted, 動的データマスキング）

### 2.6 Azure のリレーショナルデータベースソリューション
- Azure Database for MySQL
- Azure Database for PostgreSQL
- SQL Server on Azure VM
- 選択基準の比較

### 2.7 Azure Cosmos DB
- 整合性レベル（Strong / Bounded Staleness / Session / Consistent Prefix / Eventual）
- パーティションキーの設計
- API の選択（NoSQL, MongoDB, Cassandra, Gremlin, Table）
- 要求ユニット（RU）

### 2.8 データ分析ソリューション
- データ分析の基礎
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Azure Databricks
- Azure Synapse Analytics
- Azure Analysis Services
- Power BI

### 2.9 Azure Storageの認証・認可ソリューション
- Shared Key / SAS / Entra ID認証
- ストレージファイアウォール / プライベートエンドポイント

### 2.10 アプリケーションの認証と認可
- マネージドID（システム割り当て / ユーザー割り当て）
- Azure Key Vault
- アプリの登録・サービスプリンシパル

---

## 第3章 事業継続性ソリューションの設計

### 3.1 事業継続性の基礎
- 高可用性 vs 障害復旧
- SLA の考え方・複合SLAの計算

### 3.2 RPO, RTO, RLO
- 各指標の意味と設計への影響

### 3.3 仮想マシンの事業継続性ソリューション
- 可用性セット（障害ドメイン / 更新ドメイン）
- 可用性ゾーン
- Virtual Machine Scale Sets
- Azure Site Recovery
- Azure Backup

### 3.4 ストレージの事業継続性ソリューション
- 冗長性オプション（LRS / ZRS / GRS / RA-GRS / GZRS / RA-GZRS）
- オブジェクトレプリケーション
- ストレージのバックアップ・復元
- Azure File Sync

### 3.5 Azure SQL Databaseの事業継続性ソリューション
- サービスレベルとSLA
- アクティブ geo レプリケーション
- 自動フェールオーバーグループ
- バックアップと復元（PITR / LTR）

### 3.6 Azure Database for MySQLの事業継続性
- 高可用性オプション
- バックアップとレプリカ

### 3.7 アプリケーションの事業継続性
- Azure Load Balancer
- Application Gateway / WAF
- Azure Front Door
- Traffic Manager
- 負荷分散サービスの比較・選択基準

### 3.8 Azure Key Vaultの事業継続性
- キーコンテナーのレプリケーション
- 論理削除とパージ保護

---

## 第4章 インフラストラクチャソリューションの設計

### 4.1 コンピューティングソリューションの設計
- 仮想マシン（VMシリーズの選択）
- Azure App Service
  - App Service Plan（SKU選択）
- Azure Container Instances（ACI）
- Azure Kubernetes Service（AKS）
- Azure Functions
  - ホスティングプラン（消費量 / Premium / Dedicated）
- コンピューティングサービスの比較・選択基準
- サーバーレス vs コンテナ vs VM の判断フロー
- バッチ処理サービス

### 4.2 アプリケーションアーキテクチャの設計
- メッセージングアーキテクチャ
  - Azure Service Bus / Event Grid / Event Hubs / Queue Storage
  - メッセージング vs イベントの違い
- キャッシュソリューション
  - Azure Cache for Redis
- API管理
  - Azure API Management
- 構成管理
  - Azure App Configuration
- アプリケーションの自動化デプロイ
  - ARM テンプレート / Bicep
  - Azure DevOps / GitHub Actions

### 4.3 ネットワークソリューションの設計
- 仮想ネットワーク（VNet）
  - サブネット設計
  - NSG（ネットワークセキュリティグループ）
- VNet ピアリング
- VPN Gateway（S2S / P2S）
- ExpressRoute
- Azure Private Link / Private Endpoint
- Azure Firewall
- Azure DDoS Protection
- ネットワークパフォーマンスの最適化
  - CDN / Front Door

### 4.4 データ移行の設計
- Azure Migrate
- Azure Data Box
- Azure Import/Export
- AzCopy / Azure Data Share

### 4.5 データベース移行の設計
- Azure Database Migration Service
- Data Migration Assistant
- SQL Server Migration Assistant
- Azure Cosmos DB Desktop Data Migration Tool

### 4.6 リソース移行の設計
- Azure Resource Mover
- リソースの移動（サブスクリプション間 / リージョン間）

---

## 第5章 模擬試験

### 5.1 模擬試験問題
- 全分野横断の4択問題

### 5.2 模擬試験問題の解答と解説
- 各問題の詳細解説
