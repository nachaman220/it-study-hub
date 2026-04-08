var QUIZ_DATA_website_131_140 = {
  "source": "original",
  "questions": [
    {
      "id": 131,
      "question": "Application1 と Application2 の 2 つのアプリケーション向けに Azure ストレージアカウントの構成を推奨する必要があります。以下の要件を踏まえ、Application1 に適した構成はどれですか。・ Application1 は最大限のトランザクションレートと最小限のレイテンシが必要。・ Application2 は GB あたりのストレージコストを最低限にする必要がある。・ どちらもデータセンター障害時に利用継続できなければならない。・ どちらもアップロード・ダウンロード処理に最適化される必要がある。",
      "choices": [
        "Premium パフォーマンスとローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v1",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス地理冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、ローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v2",
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ"
      ],
      "answer": 3,
      "explanation": "Application1 は高いトランザクションレートと低レイテンシを必要としているため、Standard ではなく Premium パフォーマンスが必須です。データセンター障害への耐性も必要なため、ZRS レプリケーションを備えたブロック BLOB ストレージが最も適しています。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals"
      ]
    },
    {
      "id": 132,
      "question": "Application1 と Application2 の 2 つのアプリケーション向けに Azure ストレージアカウントの構成を推奨する必要があります。以下の要件を踏まえ、Application2 に適した構成はどれですか。・ Application1 は最大限のトランザクションレートと最小限のレイテンシが必要。・ Application2 は GB あたりのストレージコストを最低限にする必要がある。・ どちらもデータセンター障害時に利用継続できなければならない。・ どちらもアップロード・ダウンロード処理に最適化される必要がある。",
      "choices": [
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス geo 冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス geo 冗長ソストレージ (RA-GRS) レプリケーションを備えた BLOBストレージ",
        "Standard パフォーマンス、クール アクセス層、読み取りアクセス geo 冗長ストレージ (RA-GRS) レプリケーションを備えた汎用 v2",
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ"
      ],
      "answer": 2,
      "explanation": "汎用 v2 ストレージアカウントは Azure Storage の最新機能をすべてサポートし、GB あたりの容量単価が最も低く設定されています。大半のストレージ利用シナリオに推奨されるアカウントタイプです。ホット・クールの既定アクセス層や、ホット・クール・アーカイブ間の BLOB レベル階層化にも対応しています。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals"
      ]
    },
    {
      "id": 133,
      "question": "ファイル共有をホストする Azure ストレージアカウントの作成を予定しています。この共有にはトランザクション集中型のオンプレミスアプリケーションからアクセスします。ファイル共有へのアクセス時のレイテンシを最小にし、選択したストレージ層で最も高い復元力を確保するには、どのストレージ層を推奨すべきですか。",
      "choices": [
        "Premium",
        "ホット",
        "トランザクション 最適化"
      ],
      "answer": 0,
      "explanation": "Premium ファイル共有は SSD に支えられており、IO 集中型のワークロードに対してほとんどの操作で 1 桁ミリ秒台の低レイテンシを安定して提供します。データベースやウェブサイトホスティング、開発環境など幅広い用途に適しています。トランザクション最適化層は HDD ベースであり、Premium ほどの低レイテンシは実現できません。ホット層やクール層も HDD ベースの標準ストレージハードウェア上で提供されます。https://docs.microsoft.com/ja-jp/azure/storage/files/storage-files-planning",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 134,
      "question": "ファイル共有をホストする Azure ストレージアカウントの作成を予定しています。この共有にはトランザクション集中型のオンプレミスアプリケーションからアクセスします。ファイル共有へのアクセス時のレイテンシを最小にし、選択したストレージ層で最も高い復元力を確保するには、どの冗長性オプションを推奨すべきですか。",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 2,
      "explanation": "LRS は単一データセンター内で 3 回データを複製しますが、データセンター全体の災害時にはすべてのレプリカが失われる恐れがあります。ZRS は物理的に分離された 3 つの可用性ゾーンにデータを分散保存し、単一ゾーンの障害に耐えることができます。GRS はセカンダリリージョンへの非同期レプリケーションを行いますが、Premium ファイル共有で選択可能な最高の復元力を持つのは ZRS です。https://docs.microsoft.com/ja-jp/azure/storage/files/storage-files-planning",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-storage",
        "bcdr-fundamentals",
        "availability-zones",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 135,
      "question": "オンプレミスの SQL Server データベース 10 個を宛先として使用する 100 個の Microsoft SQL Server Integration Services (SSIS) パッケージがあります。これら 10 個のデータベースを Azure SQL Database へ移行する計画です。移行後の Azure SQL Database インスタンスを宛先として使用できる Azure-SSIS パッケージを作成するためのソリューションとして、何を推奨すべきですか。",
      "choices": [
        "SQL Server Migration Assistant (SSMA)",
        "Data Migration Assistant (DMA)",
        "Azure Data Catalog",
        "Azure Data Factory"
      ],
      "answer": 3,
      "explanation": "データベースワークロードを Azure SQL Database や Azure SQL Managed Instance に移行する際、SSIS の ETL ワークロードも併せて移行することが重要です。Azure Data Factory（ADF）の Azure-SSIS Integration Runtime を利用すれば、SSIS パッケージを Azure 上で実行できます。SSDT や SSMS などの従来のツールを引き続き使ってパッケージのデプロイと実行が可能です。https://learn.microsoft.com/ja-jp/azure/data-factory/scenario-ssis-migration-overview",
      "category": "",
      "tags": [
        "sql-database",
        "data-analytics",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 136,
      "question": "複数の Azure クラウドサービスで構成される販売アプリケーションを開発しており、各サービスは顧客注文、請求、支払い、在庫、出荷といったトランザクションの異なる部分を処理します。XML メッセージを使って各クラウドサービス間で非同期にトランザクション情報をやり取りできるようにするには、どのソリューションを推奨すべきですか。",
      "choices": [
        "Azure Data Lake",
        "Azure Service Fabric",
        "Azure Traffic Manager",
        "Azure Service Bus"
      ],
      "answer": 3,
      "explanation": "Azure Service Bus は、メッセージキューやパブリッシュ/サブスクライブトピックを備えたフルマネージドのエンタープライズ統合メッセージブローカーです。アプリケーションとサービスの分離を実現し、競合するワーカー間での負荷分散、サービス境界を越えたデータや制御の安全な転送、高信頼性が求められるトランザクション処理の調整といった用途に適しています。https://learn.microsoft.com/ja-jp/azure/service-bus-messaging/service-bus-messaging-overview",
      "category": "",
      "tags": [
        "entra-connect",
        "data-analytics",
        "load-balancers",
        "containers",
        "messaging"
      ]
    },
    {
      "id": 137,
      "question": "米国西部 Azure リージョンに KeyVault1 という Azure Key Vault を使用する Azure Web アプリケーションがあり、KeyVault1 の災害復旧計画を策定しています。KeyVault1 のキーをバックアップした場合、そのバックアップはどこに復元可能ですか。",
      "choices": [
        "同じリージョンのみ",
        "KeyVault1のみ",
        "世界中全てのリージョン",
        "同じ地域のみ"
      ],
      "answer": 3,
      "explanation": "Key Vault オブジェクト（シークレット、キー、証明書など）をバックアップすると、暗号化された BLOB としてダウンロードされます。この BLOB は Azure 外部では復号できません。有効なデータとして復元するには、同一の Azure サブスクリプションかつ同一の Azure 地域内にある Key Vault に対してのみ復元操作が可能です。https://learn.microsoft.com/ja-jp/azure/key-vault/general/backup?tabs=azure-cli",
      "category": "",
      "tags": [
        "subscription-design",
        "key-vault",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "app-service",
        "containers"
      ]
    },
    {
      "id": 138,
      "question": "複数の Azure リージョンにまたがる複数インスタンスの Azure App Service Web アプリをデプロイする計画があります。以下の要件を満たす負荷分散サービスはどれですか。・ リージョン全体の停止時でもアプリへのアクセスを維持する。・ Azure Web アプリケーション ファイアウォール (WAF) に対応する。・ Cookie ベースのセッションアフィニティをサポートする。・ URL パスベースのルーティングに対応する。",
      "choices": [
        "Azure Front Door",
        "Azure Load Balancer",
        "Azure Traffic Manager",
        "Azure Application Gateway"
      ],
      "answer": 0,
      "explanation": "Azure Application Gateway はリージョン内でトラフィックを分散するリージョナルサービスであるのに対し、Azure Front Door はリージョン間でトラフィックを振り分けるグローバルサービスです。両者とも WAF、Cookie アフィニティ、URL ルーティングをサポートしますが、リージョン障害時の可用性確保にはクロスリージョン対応の Azure Front Door が必要です。https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-faq#what-is-the-difference-between-azure-front-door-and-azure-application-gateway",
      "category": "",
      "tags": [
        "load-balancers",
        "app-service",
        "network-security"
      ]
    },
    {
      "id": 139,
      "question": "Webapp1 という Azure App Service Web アプリが DB1 という Azure SQL データベースに接続しています。両方とも米国東部リージョンにデプロイされています。Webapp1 と DB1 間のすべての通信をプライベート接続経由にするために、仮想ネットワークにはサブネットが少なくともいくつ必要ですか。",
      "choices": [
        "1",
        "2",
        "3"
      ],
      "answer": 1,
      "explanation": "最低 2 つのサブネットが必要です。1 つは Azure App Service の VNet 統合用、もう 1 つは Azure Private Link のプライベートエンドポイント用です。VNet 統合は専用サブネットを必要とし、Azure はサブネットごとに先頭の 5 つの IP アドレスを予約します。App Service のインスタンスごとに統合サブネットから 1 つのアドレスが消費されます。https://learn.microsoft.com/ja-jp/azure/app-service/overview-vnet-integration#subnet-requirements",
      "category": "",
      "tags": [
        "sql-database",
        "app-service",
        "vnet",
        "private-link"
      ]
    },
    {
      "id": 140,
      "question": "Webapp1 という Azure App Service Web アプリが DB1 という Azure SQL データベースに接続しています。両方とも米国東部リージョンにデプロイされています。Webapp1 と DB1 間のすべての通信をプライベート接続経由にするために、仮想ネットワークからどの名前解決方式を使用すべきですか。",
      "choices": [
        "Azure DNS Private Resolver",
        "プライベートDNSゾーン",
        "パブリックDNSゾーン"
      ],
      "answer": 1,
      "explanation": "プライベート DNS ゾーンを構成する必要があります。Web アプリが Azure DNS プライベートゾーンと連携してプライベートエンドポイントの名前解決を行うために不可欠な設定です。",
      "category": "",
      "tags": [
        "sql-database",
        "app-service",
        "vnet"
      ]
    }
  ]
};
