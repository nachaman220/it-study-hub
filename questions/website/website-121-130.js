var QUIZ_DATA_website_121_130 = {
  "source": "original",
  "questions": [
    {
      "id": 121,
      "question": "Contoso, Ltd. という Microsoft ボリュームライセンス顧客のデータベース環境を管理しています。Contoso はソフトウェアアシュアランスのライセンスモビリティを活用しています。50 個のデータベースをデプロイする際、以下の要件を満たす購入モデルとして適切なものはどれですか。・ 自動スケーリングに対応する。・ Microsoft SQL Server のライセンス費用を最小化する。",
      "choices": [
        "仮想コア",
        "DTU",
        "Azure 予約仮想マシン インスタンス"
      ],
      "answer": 0,
      "explanation": "Azure ハイブリッド特典を Azure SQL Database に適用するには、仮想コアベースの購入モデルとプロビジョニング済みコンピューティングレベルを選択する必要があります。DTU ベースの購入モデルやサーバーレスコンピューティングレベルでは Azure ハイブリッド特典を利用できません。ソフトウェアアシュアランスを持つ顧客にとって、仮想コアモデルが最もライセンスコストを抑える選択です。https://docs.microsoft.com/ja-jp/azure/azure-sql/azure-hybrid-benefit",
      "category": "",
      "tags": [
        "entra-license",
        "sql-database",
        "vmss",
        "virtual-machines",
        "azure-functions"
      ]
    },
    {
      "id": 122,
      "question": "Contoso, Ltd. という Microsoft ボリュームライセンス顧客のデータベース環境を管理しています。Contoso はソフトウェアアシュアランスのライセンスモビリティを活用しています。50 個のデータベースをデプロイする際、以下の要件を満たすデプロイオプションとして適切なものはどれですか。・ 自動スケーリングに対応する。・ Microsoft SQL Server のライセンス費用を最小化する。",
      "choices": [
        "Azure SQL Managed Instance",
        "SQL Server Always On 可用性グループ",
        "Azure SQL Database エラスティック プール"
      ],
      "answer": 2,
      "explanation": "Azure SQL Database のエラスティックプールは、利用パターンが多様で予測が難しい複数のデータベースを効率よく管理・スケーリングするためのコスト効率に優れたソリューションです。プール内のデータベースは単一サーバー上でリソースを共有し、SaaS 開発者はデータベースごとの弾力的なパフォーマンスを確保しながら、全体の費用を予算内に収められます。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/elastic-pool-overview?view=azuresql",
      "category": "",
      "tags": [
        "entra-license",
        "cost-management",
        "sql-database",
        "vmss",
        "sql-ha"
      ]
    },
    {
      "id": 123,
      "question": "Contoso, Ltd. は以下のリソース（※1）を持つ Azure サブスクリプションを運用しています。Contoso の製品データは contososql1 から contosolake1 にコピー済みです。パートナー企業 Fabrikam Inc. は以下のリソース（※2）を持つ Azure サブスクリプションを所有しています。Contoso は FabrikamVM1 上の研究データを contosolake1 にアップロードし、その過程で Contoso の利用するデータ形式へ変換する必要があります。contosolake1 に格納されたデータは contosoworkspace1 で分析します。以下の要件（※3）を満たすソリューションとして、データのアップロードと変換にはどの方法を推奨しますか。※1 contosoworkspace1（Azure Synapse Analytics ワークスペース）、contosolake1（Azure Data Lake Storage アカウント）、contososql1（Azure SQL データベース） ※2 FabrikamVM1（SQL Server 2019 搭載の仮想マシン）、fabrikamsa1（Azure ストレージアカウント） ※3 FabrikamVM1 の研究データのアップロードおよび変換、contosoworkspace1 内のデータスナップショットへの限定的なアクセスを Fabrikam に付与",
      "choices": [
        "Azure Data Box Gateway",
        "Azure Data Share",
        "Azure Synapse パイプライン"
      ],
      "answer": 2,
      "explanation": "データのアップロードと変換（ETL 操作）には Azure Data Factory ベースの機能が適しています。Azure Synapse Analytics の Synapse パイプラインは Azure Data Factory の機能を基盤としており、データ統合やデータフローの処理を Synapse ワークスペース内で直接実行できます。https://learn.microsoft.com/ja-jp/azure/synapse-analytics/data-integration/concepts-data-factory-differences",
      "category": "",
      "tags": [
        "subscription-design",
        "log-analytics",
        "azure-storage",
        "sql-database",
        "data-analytics",
        "virtual-machines",
        "data-migration"
      ]
    },
    {
      "id": 124,
      "question": "Contoso, Ltd. は以下のリソース（※1）を持つ Azure サブスクリプションを運用しています。Contoso の製品データは contososql1 から contosolake1 にコピー済みです。パートナー企業 Fabrikam Inc. は以下のリソース（※2）を持つ Azure サブスクリプションを所有しています。Contoso は FabrikamVM1 上の研究データを contosolake1 にアップロードし、その過程で Contoso の利用するデータ形式へ変換する必要があります。contosolake1 に格納されたデータは contosoworkspace1 で分析します。以下の要件（※3）を満たすソリューションとして、制限付きアクセスの提供にはどの方法を推奨しますか。※1 contosoworkspace1（Azure Synapse Analytics ワークスペース）、contosolake1（Azure Data Lake Storage アカウント）、contososql1（Azure SQL データベース） ※2 FabrikamVM1（SQL Server 2019 搭載の仮想マシン）、fabrikamsa1（Azure ストレージアカウント） ※3 FabrikamVM1 の研究データのアップロードおよび変換、contosoworkspace1 内のデータスナップショットへの限定的なアクセスを Fabrikam に付与",
      "choices": [
        "Azure Data Box Gateway",
        "Azure Synapse パイプライン",
        "Azure Data Share"
      ],
      "answer": 2,
      "explanation": "Azure Data Share を利用すると、複数の顧客やパートナーとデータを安全に共有できます。データプロバイダーは共有データの管理権限を保持したまま、誰がいつどのデータにアクセスしたかを監視・管理できます。このケースではスナップショットベースの共有方式を使って、Fabrikam に対して contosoworkspace1 のデータへの限定的なアクセスを提供します。https://learn.microsoft.com/ja-jp/azure/data-share/overview",
      "category": "",
      "tags": [
        "subscription-design",
        "azure-monitor",
        "log-analytics",
        "azure-storage",
        "sql-database",
        "data-analytics",
        "virtual-machines",
        "data-migration"
      ]
    },
    {
      "id": 125,
      "question": "ミッションクリティカルなアプリケーションの記録データを保存するストレージソリューションを選定する必要があります。書き込み操作のレイテンシおよびスループットに関する SLA を提供するサービスとして、最も適切なものはどれですか。",
      "choices": [
        "Azure Data Lake Storage Gen2",
        "Azure Cosmos DB",
        "Azure SQL",
        "Azure Blob Storage"
      ],
      "answer": 1,
      "explanation": "Azure Cosmos DB は、グローバル分散型のマルチモデルデータベースサービスであり、スループット、レイテンシ、可用性、整合性を網羅する包括的な SLA を提供する唯一の選択肢です。他のサービスではレイテンシとスループットの両方に対する SLA は保証されません。https://learn.microsoft.com/ja-jp/azure/cosmos-db/introduction",
      "category": "",
      "tags": [
        "blob-storage",
        "cosmosdb",
        "data-analytics"
      ]
    },
    {
      "id": 126,
      "question": "以下の表に示す部門構成を持つ企業があります。Sub1 には App1 という Azure App Service Web アプリが含まれ、シングルテナント構成で Microsoft Entra ID を使ったユーザー認証を行っています。現在 contoso.com のユーザーのみが App1 に認証可能です。fabrikam.com テナントのユーザーにも App1 への認証を許可するには、どのソリューションを推奨すべきですか。部門 | Azure サブスクリプション | Microsoft Entra テナント-----East | Sub1 | Contoso.com West | Sub2 | Fabrikam.com",
      "choices": [
        "Microsoft Entra ID Protection を構成する。",
        "条件付きアクセス ポリシーを構成する。",
        "Microsoft Entra ID エンタイトルメント管理を使用して外部ユーザーを管理する。",
        "Microsoft Entra ID プロビジョニング サービスを構成する。"
      ],
      "answer": 2,
      "explanation": "エンタイトルメント管理では、接続先組織を指定してそのユーザーがアクセス権を要求できるようにします。ディレクトリに未登録のユーザーがアクセスを要求し承認されると、自動的に B2B ゲストとして招待されアクセス権が付与されます。アクセス権の期限切れ後、他のアクセスパッケージが割り当てられていなければ B2B アカウントも自動削除されます。https://learn.microsoft.com/ja-jp/entra/id-governance/entitlement-management-overview",
      "category": "",
      "tags": [
        "entra-id",
        "external-users",
        "entra-governance",
        "conditional-access",
        "subscription-design",
        "app-service"
      ]
    },
    {
      "id": 127,
      "question": "オンプレミスネットワークと Azure サブスクリプションを利用しており、複数のブランチオフィスが存在します。トロントのブランチオフィスにはファイルサーバーとして機能する VM1 があり、全オフィスのユーザーが VM1 の共有ファイルにアクセスしています。トロントオフィスへのアクセスが不能になった場合に、ユーザーが共有ファイルへ可能な限り早くアクセスできるようにするソリューションはどれですか。",
      "choices": [
        "Azure File 共有 と Azure File Sync",
        "Recovery Services コンテナーと Windows Server バックアップ",
        "Recovery Services コンテナーと Azure Backup",
        "Azure BLOB コンテナーと Azure File Sync"
      ],
      "answer": 0,
      "explanation": "Azure File Sync と Azure ファイル共有を組み合わせることで、オンプレミスのファイルサーバーのデータをクラウドに同期できます。トロントのオフィスがアクセス不能になった場合でも、Azure 上の同期済みファイル共有から迅速にファイルを提供できるため、ダウンタイムを最小化できます。",
      "category": "",
      "tags": [
        "subscription-design",
        "bcdr-fundamentals",
        "azure-backup",
        "file-sync",
        "virtual-machines",
        "containers"
      ]
    },
    {
      "id": 128,
      "question": "ある企業が Web アプリケーションをサポートする HTTP ベースの API を実装予定です。この Web アプリでは顧客が注文ステータスを確認できます。以下の要件を満たすために、どの HTTP メソッドを構成すべきですか。・ Azure Functions で実装する。・ パブリックな読み取り専用アクセスを提供する。・ 書き込み操作は許可しない。",
      "choices": [
        "GET と POST のみ",
        "GET、POST、OPTIONSのみ",
        "APIメソッド",
        "GETのみ"
      ],
      "answer": 3,
      "explanation": "読み取り専用のパブリックアクセスのみが求められるため、データ取得用の GET メソッドだけで十分です。POST など書き込みを伴うメソッドは不要です。",
      "category": "",
      "tags": [
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 129,
      "question": "ある企業が Web アプリケーションをサポートする HTTP ベースの API を実装予定です。この Web アプリでは顧客が注文ステータスを確認できます。以下の要件を満たすために、どの認証レベルを構成すべきですか。・ Azure Functions で実装する。・ パブリックな読み取り専用アクセスを提供する。・ 書き込み操作は許可しない。",
      "choices": [
        "匿名",
        "管理者",
        "関数"
      ],
      "answer": 0,
      "explanation": "API は読み取り専用でパブリックにアクセス可能である必要があるため、認証や承認を必要としない匿名レベルを使用します。これにより制限なしのアクセスが実現されます。",
      "category": "",
      "tags": [
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 130,
      "question": "Application1 と Application2 の 2 つのアプリケーション向けに Azure ストレージアカウントの構成を推奨する必要があります。以下の要件を踏まえ、Application1 に適した構成はどれですか。・ Application1 は最大限のトランザクションレートと最小限のレイテンシが必要。・ Application2 は GB あたりのストレージコストを最低限にする必要がある。・ どちらもデータセンター障害時に利用継続できなければならない。・ どちらもアップロード・ダウンロード処理に最適化される必要がある。",
      "choices": [
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、ローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v2",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス地理冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Premium パフォーマンスとローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v1"
      ],
      "answer": 0,
      "explanation": "Application1 には高トランザクションレートと低レイテンシが求められるため、Standard ではなく Premium パフォーマンスを選択する必要があります。また、データセンター障害時の可用性を確保するため ZRS レプリケーションを組み合わせたブロック BLOB ストレージが最適です。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals"
      ]
    }
  ]
};
