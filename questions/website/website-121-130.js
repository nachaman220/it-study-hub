var QUIZ_DATA_website_121_130 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 121,
      "question": "あなたは、Contoso, Ltd. という名前の Microsoft ボリューム ライセンスのお客様の、データベース環境を管理しています。Contoso はソフトウェア アシュアランスによるライセンス モビリティを使用しています。 50 個のデータベースをデプロイする必要があります。 ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 購入ケースモデル:・ 自動スケーリングをサポートする。・ Microsoft SQL Server のライセンス コストを最小限に抑える。",
      "choices": [
        "仮想コア",
        "DTU",
        "Azure 予約仮想マシン インスタンス"
      ],
      "answer": 0,
      "explanation": "Azure ハイブリッド ライセンス モデルを適用できるのは、Azure SQL Database に対して、仮想コア ベースの購入モデルとプロビジョニングされたコンピューティング レベルを選択した場合に限られます。 Azure ハイブリッド特典は、DTU ベースの購入モデル下のサービス レベル、またはサーバーレス コンピューティング レベルでは利用できません。https://docs.microsoft.com/ja-jp/azure/azure-sql/azure-hybrid-benefit",
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
      "question": "あなたは、Contoso, Ltd. という名前の Microsoft ボリューム ライセンスのお客様の、データベース環境を管理しています。Contoso はソフトウェア アシュアランスによるライセンス モビリティを使用しています。 50 個のデータベースをデプロイする必要があります。 ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 デプロイメント オプション:・ 自動スケーリングをサポートする。・ Microsoft SQL Server のライセンス コストを最小限に抑える。",
      "choices": [
        "Azure SQL Managed Instance",
        "SQL Server Always On 可用性グループ",
        "Azure SQL Database エラスティック プール"
      ],
      "answer": 2,
      "explanation": "Azure SQL Database のエラスティック プールは、使用ニーズが多様で予測不可能な複数のデータベースを管理およびスケーリングするための、シンプルでコスト効率に優れたソリューションです。 エラスティック プール内のデータベースは、単一のサーバー上にあり、設定された数のリソースを設定価格で共有します。 SQL Database のエラスティック プールを使用すると、サービスとしてのソフトウェア (SaaS) の開発者は、各データベースのパフォーマンスに弾力性を持たせながら、データベース グループの価格に対するパフォーマンスを所定の予算内で最適化できます。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/elastic-pool-overview?view=azuresql",
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
      "question": "Contoso, Ltd. という名前の会社は、※1のリソースを含む Azure サブスクリプションを持っています。 Contoso の製品データが contososql1 から contosolake1 にコピーされました。 Contoso には、Fabrikam Inc. というパートナー会社があります。Fabrikam には、※2のリソースを含む Azure サブスクリプションがあります。 Contoso は、FabrikamVM1 の研究データを contosolake1 にアップロードする予定です。アップロード中に、研究データを Contoso が使用するデータ形式に変換する必要があります。 contosolake1 のデータは contosoworkspace1 を使用して分析されます。 このとき、※3の要件を満たすソリューションを推奨する必要があります。 それぞれの要件に対して何を推奨する必要がありますか。 データをアップロードして変換する:※1・ contosoworkspace1 という名前の Azure Synapse Analytics ワークスペース・ contosolake1 という名前の Azure Data Lake Storage アカウント・ contososql1 という名前の Azure SQL データベース※2・ Microsoft SQL Server 2019 を実行する FabrikamVM1 という名前の仮想マシン・ fabrikamsa1 という名前の Azure ストレージ アカウント※3・ FabrikamVM1 研究データをアップロードして変換する。・ contosoworkspace1 内のデータのスナップショットへの制限付きアクセスを Fabrikam に提供する。",
      "choices": [
        "Azure Data Box Gateway",
        "Azure Data Share",
        "Azure Synapse パイプライン"
      ],
      "answer": 2,
      "explanation": "ETL 操作を実現するには Azure Data Factory を使用する必要があります。Azure Synapse Analytics の Synapse パイプラインやデータ フローなどのデータ統合機能は、Azure Data Factory の機能に基づいています。https://learn.microsoft.com/ja-jp/azure/synapse-analytics/data-integration/concepts-data-factory-differences",
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
      "question": "Contoso, Ltd. という名前の会社は、※1のリソースを含む Azure サブスクリプションを持っています。 Contoso の製品データが contososql1 から contosolake1 にコピーされました。 Contoso には、Fabrikam Inc. というパートナー会社があります。Fabrikam には、※2のリソースを含む Azure サブスクリプションがあります。 Contoso は、FabrikamVM1 の研究データを contosolake1 にアップロードする予定です。アップロード中に、研究データを Contoso が使用するデータ形式に変換する必要があります。 contosolake1 のデータは contosoworkspace1 を使用して分析されます。 このとき、※3の要件を満たすソリューションを推奨する必要があります。 それぞれの要件に対して何を推奨する必要がありますか。 制限付きアクセスを提供する:※1・ contosoworkspace1 という名前の Azure Synapse Analytics ワークスペース・ contosolake1 という名前の Azure Data Lake Storage アカウント・ contososql1 という名前の Azure SQL データベース※2・ Microsoft SQL Server 2019 を実行する FabrikamVM1 という名前の仮想マシン・ fabrikamsa1 という名前の Azure ストレージ アカウント※3・ FabrikamVM1 研究データをアップロードして変換する。・ contosoworkspace1 内のデータのスナップショットへの制限付きアクセスを Fabrikam に提供する。",
      "choices": [
        "Azure Data Box Gateway",
        "Azure Synapse パイプライン",
        "Azure Data Share"
      ],
      "answer": 2,
      "explanation": "Azure Data Share を使用すると、組織は複数のお客様やパートナーとデータを安全に共有できます。 データ プロバイダーでは共有したデータが常に管理下に置かれるため、Azure Data Share を使用すると、どのデータが、いつ、誰によって共有されたかを簡単に管理し、監視することができます。この場合、スナップショットベースの共有を使用する必要があります。https://learn.microsoft.com/ja-jp/azure/data-share/overview",
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
      "question": "ミッションクリティカルなアプリケーションの記録用のストレージ ソリューションを推奨する必要があります。ソリューションでは、書き込み操作の待ち時間とスループットに関するサービス レベル アグリーメント (SLA) を提供する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "Azure Data Lake Storage Gen2",
        "Azure Cosmos DB",
        "Azure SQL",
        "Azure Blob Storage"
      ],
      "answer": 1,
      "explanation": "Azure Cosmos DB は、グローバルに分散されたマルチモデル データベース サービスです。スループット、遅延、可用性、一貫性をカバーする包括的なサービス レベル アグリーメント (SLA) を提供します。他の選択肢では、レイテンシーとスループットの両方に対する SLA は提供されません。https://learn.microsoft.com/ja-jp/azure/cosmos-db/introduction",
      "category": "",
      "tags": [
        "blob-storage",
        "cosmosdb",
        "data-analytics"
      ]
    },
    {
      "id": 126,
      "question": "あなたの会社には、次の表に示す部門があります。 Sub1 には、App1 という名前の Azure App Service Web アプリが含まれています。 App1 は、シングルテナントのユーザー認証に Microsoft Entra ID を使用します。 contoso.com のユーザーは App1 に対して認証できます。 fabrikam.com テナント内のユーザーが App1 に対して認証できるようにするソリューションを推奨する必要があります。 何を勧めるべきですか。部門 | Azure サブスクリプション | Microsoft Entra テナント-------------------------------------------------- -------------East | Sub1 | Contoso.comWest | Sub2 | Fabrikam.com",
      "choices": [
        "Microsoft Entra ID Protection を構成する。",
        "条件付きアクセス ポリシーを構成する。",
        "Microsoft Entra ID エンタイトルメント管理を使用して外部ユーザーを管理する。",
        "Microsoft Entra ID プロビジョニング サービスを構成する。"
      ],
      "answer": 2,
      "explanation": "エンタイトルメント管理接続先の組織を選択して、その組織のユーザーがアクセス権を要求できるようにすることができます。 ディレクトリにまだ存在しないユーザーがアクセス権を要求し、それが承認されると、そのユーザーは自動的にディレクトリに招待され、アクセス権を割り当てられます。 アクセス権の有効期限が切れ、かつ他のアクセス パッケージが割り当てられていない場合には、ディレクトリ内の B2B アカウントを自動的に削除できます。https://learn.microsoft.com/ja-jp/entra/id-governance/entitlement-management-overview",
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
      "question": "オンプレミス ネットワークと Azure サブスクリプションがあります。オンプレミス ネットワークには複数のブランチ オフィスがあります。 トロント支社のオフィスには、ファイル サーバーとして構成された VM1 という名前の仮想マシンがあります。ユーザーはすべてのオフィスから VM1 上の共有ファイルにアクセスします。 トロント支社にアクセスできない場合に、ユーザーが共有ファイルにできるだけ早くアクセスできるようにするソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "Azure File 共有 と Azure File Sync",
        "Recovery Services コンテナーと Windows Server バックアップ",
        "Recovery Services コンテナーと Azure Backup",
        "Azure BLOB コンテナーと Azure File Sync"
      ],
      "answer": 0,
      "explanation": "オンプレミス ネットワークと Azure サブスクリプションがあります。オンプレミス ネットワークには複数のブランチ オフィスがあります。 トロント支社のオフィスには、ファイル サーバーとして構成された VM1 という名前の仮想マシンがあります。ユーザーはすべてのオフィスから VM1 上の共有ファイルにアクセスします。 トロント支社にアクセスできない場合に、ユーザーが共有ファイルにできるだけ早くアクセスできるようにするソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
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
      "question": "ある企業は、Web アプリをサポートするために HTTP ベースの API を実装することを計画しています。 Web アプリを使用すると、顧客は注文のステータスを確認できます。 API は次の要件を満たす必要があります。 どの HTTP メソッドと認証レベルを構成するかを推奨する必要があります。 何を勧めるべきですか。 HTTP メソッド:・ Azure Functions を実装する。・ パブリック (読み取り専用)を提供する。・ 書き込み操作を禁止する。",
      "choices": [
        "GET と POST のみ",
        "GET、POST、OPTIONSのみ",
        "APIメソッド",
        "GETのみ"
      ],
      "answer": 3,
      "explanation": "GET API はパブリック読み取り専用操作を提供するだけであるため、データを取得するには GET メソッドで十分です。",
      "category": "",
      "tags": [
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 129,
      "question": "ある企業は、Web アプリをサポートするために HTTP ベースの API を実装することを計画しています。 Web アプリを使用すると、顧客は注文のステータスを確認できます。 API は次の要件を満たす必要があります。 どの HTTP メソッドと認証レベルを構成するかを推奨する必要があります。 何を勧めるべきですか。 認証レベル:・ Azure Functions を実装する。・ パブリック (読み取り専用)を提供する。・ 書き込み操作を禁止する。",
      "choices": [
        "匿名",
        "管理者",
        "関数"
      ],
      "answer": 0,
      "explanation": "認証レベル: 匿名API は読み取り専用操作のためにパブリックにアクセスできる必要があるため、認証や承認を必要とせずに無制限のアクセスを許可するには、匿名承認レベルを使用する必要があります。",
      "category": "",
      "tags": [
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 130,
      "question": "Application1 と Application2 という 2 つのアプリケーションに対して Azure ストレージ アカウント構成を推奨する必要があります。構成は次の要件を満たす必要があります。 このとき、何を勧めるべきですか。 Application1:・ Application1 のストレージは、可能な限り高いトランザクション レートと可能な限り低い遅延を提供する必要がある。・ Application2 のストレージは、GB あたりのストレージ コストを可能な限り低くする必要がある。・ データセンターに障害が発生した場合でも、両方のアプリケーションのストレージが利用可能でなければならない。・ 両方のアプリケーションのストレージは、アップロードとダウンロード用に最適化する必要がある。",
      "choices": [
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、ローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v2",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス地理冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Premium パフォーマンスとローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v1"
      ],
      "answer": 0,
      "explanation": "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージApplication1 は、高いトランザクション レートと可能な限り低い遅延を必要とします。 Standard ではなく、Premium を使用する必要があります。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
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
