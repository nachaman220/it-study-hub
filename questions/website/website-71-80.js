var QUIZ_DATA_website_71_80 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 71,
      "question": "ルート管理グループと 10 個の子管理グループを含む Azure 環境を作成する予定です。各子管理グループには 5 つの Azure サブスクリプションが含まれます。各サブスクリプションに 10 ～ 30 のリソース グループを含める予定です。 Azure ガバナンス ソリューションを設計する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 ブループリントを定義するレベル:・ Azure Blueprints を使用して、すべてのサブスクリプションとリソース グループにわたるガバナンスを制御する。・ ブループリント ベースの構成がすべてのサブスクリプションとリソース グループにわたって一貫していることを確認する。・ ブループリントの定義と割り当ての数を最小限に抑える。",
      "choices": [
        "ルート管理グループ",
        "子管理グループ",
        "サブスクリプション"
      ],
      "answer": 0,
      "explanation": "ルート管理グループブループリント定義を作成するときは、ブループリントの保存場所を定義します。ブループリントは、所有している管理グループまたはサブスクリプションに保存できます。寄稿者のアクセス権。場所が管理グループの場合、ブループリントをその管理グループの子サブスクリプションに割り当てることができます。ルート管理グループは階層に組み込まれており、すべての管理グループとサブスクリプションがそれに組み込まれます。このルート管理グループにより、グローバル ポリシーと Azure ロールの割り当てをディレクトリ レベルで適用できます。https://learn.microsoft.com/ja-jp/azure/governance/management-groups/overview",
      "category": "",
      "tags": [
        "rbac",
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "blueprints"
      ]
    },
    {
      "id": 72,
      "question": "ルート管理グループと 10 個の子管理グループを含む Azure 環境を作成する予定です。各子管理グループには 5 つの Azure サブスクリプションが含まれます。各サブスクリプションに 10 ～ 30 のリソース グループを含める予定です。 Azure ガバナンス ソリューションを設計する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 ブループリント割り当てを作成するレベル:・ Azure Blueprints を使用して、すべてのサブスクリプションとリソース グループにわたるガバナンスを制御する。・ ブループリント ベースの構成がすべてのサブスクリプションとリソース グループにわたって一貫していることを確認する。・ ブループリントの定義と割り当ての数を最小限に抑える。",
      "choices": [
        "ルート管理グループ",
        "子管理グループ",
        "サブスクリプション"
      ],
      "answer": 2,
      "explanation": "ブループリントの個々の発行済みバージョンを既存の管理グループまたはサブスクリプションに割り当てることができます (名前の最大長は 90 文字)。 ポータルにおいて、ブループリントの既定のバージョンは、直近の発行済みになったバージョンになります。 アーティファクトのパラメーターまたはブループリントのパラメーターがある場合、そのパラメーターは割り当て処理時に定義されます。https://learn.microsoft.com/ja-jp/azure/governance/blueprints/overview#blueprint-assignment",
      "category": "",
      "tags": [
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "blueprints"
      ]
    },
    {
      "id": 73,
      "question": "Azure サブスクリプションでステートレス Web アプリをホストするには、リソースをデプロイする必要があります。ソリューションは次の要件を満たす必要があります。 解決策: 自動スケーリングを使用する Virtual Machine Scale Setsをデプロイします。 これは目標を達成していますか。・ 完全な .NET Frameworkへのアクセスを提供する。・ Azure リージョンに障害が発生した場合に冗長性を提供する。・ カスタム アプリケーションの依存関係をインストールするためのオペレーティング システムへのアクセスを管理者に許可する。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "この解決策では目標を達成することはできません。代わりに、2 つの Azure 仮想マシンを 2 つの Azure リージョンにデプロイし、Traffic Manager プロファイルを作成する必要があります。Azure Traffic Manager は、DNS ベースのトラフィック ロード バランサーです。 このサービスを使用すると、パブリックに公開されているアプリケーションへのトラフィックを世界各国の Azure リージョン全体に分散することができます。 また、Traffic Manager によって、パブリック エンドポイントには高可用性と高い応答速度が確保されます。https://docs.microsoft.com/ja-jp/azure/traffic-manager/traffic-manager-overview",
      "category": "",
      "tags": [
        "subscription-design",
        "azure-storage",
        "vmss",
        "load-balancers",
        "virtual-machines",
        "app-service"
      ]
    },
    {
      "id": 74,
      "question": "Azure Cosmos DB と Azure Synapse を統合するソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。 Azure Synapse ワークスペースをプロビジョニングするとき:・ Azure Synapse ワークスペースから Azure Cosmos DB アカウントへのトラフィックは、Microsoft バックボーン ネットワーク経由で送信される必要がある。・ Azure Synapse ワークスペースから Azure Cosmos DB アカウントへのトラフィックは、インターネット経由でルーティングしてはならない。・ 導入の労力は最小限に抑える必要がある。",
      "choices": [
        "Microsoft Entra ID 認証の使用を有効にする。",
        "ワークスペース エンドポイントへのパブリック ネットワーク アクセスを無効にする。",
        "専用の仮想ネットワークを構成する。"
      ],
      "answer": 2,
      "explanation": "専用のマネージド仮想ネットワークを構成するマネージド プライベート エンドポイントは、マネージド ワークスペース仮想ネットワークを使用した Azure Synapse ワークスペースでのみサポートされます。https://learn.microsoft.com/ja-jp/azure/synapse-analytics/security/synapse-workspace-managed-private-endpoints#managed-private-endpoints",
      "category": "",
      "tags": [
        "entra-id",
        "log-analytics",
        "cosmosdb",
        "data-analytics",
        "vnet",
        "private-link"
      ]
    },
    {
      "id": 75,
      "question": "Azure Cosmos DB と Azure Synapse を統合するソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。 Azure Cosmos DB アカウントを構成するときに、次を有効にする:・ Azure Synapse ワークスペースから Azure Cosmos DB アカウントへのトラフィックは、Microsoft バックボーン ネットワーク経由で送信される必要がある。・ Azure Synapse ワークスペースから Azure Cosmos DB アカウントへのトラフィックは、インターネット経由でルーティングしてはならない。・ 導入の労力は最小限に抑える必要がある。",
      "choices": [
        "マネージド プライベート エンドポイント",
        "サービス エンドポイント ポリシー",
        "サーバーレベルのファイアウォール規則"
      ],
      "answer": 0,
      "explanation": "マネージドプライベートエンドポイントマネージド プライベート エンドポイントを使用すると、Azure Synapse ワークスペースと他の Azure リソース間のトラフィックは、完全に Microsoft バックボーン ネットワーク上を通過します。https://learn.microsoft.com/ja-jp/azure/synapse-analytics/security/synapse-workspace-managed-vnet",
      "category": "",
      "tags": [
        "log-analytics",
        "cosmosdb",
        "data-analytics",
        "private-link"
      ]
    },
    {
      "id": 76,
      "question": "オンプレミス ネットワークには、500 GB のデータを保存する Server1 という名前のファイル サーバーが含まれています。 Azure Data Factory を使用して、Server1 から Azure Storage にデータをコピーする必要があります。 新しいデータ ファクトリを追加します。 次に何をすべきでしょうか。 Server1:",
      "choices": [
        "セルフホステッド統合ランタイムをインストールする。",
        "Azure File Sync エージェントをインストールする。",
        "ファイル サーバー リソース マネージャーの役​​割サービスをインストールする。"
      ],
      "answer": 0,
      "explanation": "セルフホステッド統合ランタイムをインストールします。データ ストアがオンプレミス ネットワーク、Azure 仮想ネットワーク、または Amazon Virtual Private Cloud 内にある場合は、それに接続するようにセルフホステッド統合ランタイムを構成する必要があります。データ ストアに接続するために使用される統合ランタイム。 Azure Integration Runtime またはセルフホステッド Integration Runtime (データ ストアがプライベート ネットワークにある場合) を使用できます。指定しない場合は、デフォルトの Azure 統合ランタイムが使用されます。https://learn.microsoft.com/ja-jp/azure/data-factory/connector-file-system?tabs=data-factory",
      "category": "",
      "tags": [
        "data-analytics",
        "file-sync",
        "vnet"
      ]
    },
    {
      "id": 77,
      "question": "オンプレミス ネットワークには、500 GB のデータを保存する Server1 という名前のファイル サーバーが含まれています。 Azure Data Factory を使用して、Server1 から Azure Storage にデータをコピーする必要があります。 新しいデータ ファクトリーを追加します。 次に何をすべきでしょうか。 データ ファクトリー:",
      "choices": [
        "Azure Import/Export ジョブを作成する。",
        "Azure-SQL Server Integration Services (SSIS) 統合ランタイム (IR) をプロビジョニングする。",
        "パイプラインを作成する。"
      ],
      "answer": 2,
      "explanation": "パイプラインを作成します。パイプラインを使用してコピー アクティビティを実行します。パイプラインでコピー アクティビティを実行するには、次のいずれかのツールまたは SDK を使用します。・データ コピー ツール・Azure ポータル・.NET SDK・Python SDK・Azure PowerShell・REST API・Azure Resource Manager テンプレートhttps://learn.microsoft.com/ja-jp/azure/data-factory/connector-file-system?tabs=data-factory",
      "category": "",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 78,
      "question": "Azure SQL をデータベース プラットフォームとして使用する予定です。 次の要件を満たす Azure SQL 製品とサービス レベルを推奨する必要があります。 ・ ワークロードの需要に基づいてコンピューティング リソースを自動的にスケーリングする ・ 秒単位の課金を提供する このとき、何を勧めるべきですか。 Azure SQL 製品:",
      "choices": [
        "Azure SQL Database の単一データベース",
        "Azure SQL Managed Instance",
        "An Azure SQL Database elastic pool"
      ],
      "answer": 0,
      "explanation": "サーバーレスは、ワークロードの需要に基づいてコンピューティングが自動的にスケーリングされ、1 秒あたりのコンピューティング使用量に対して請求される、Azure SQL Database の単一データベース用のコンピューティング レベルです。 またサーバーレス コンピューティング レベルでは、アイドル期間にデータベースを自動的に一時停止します。このときはストレージのみに課金され、再びアクティブになると自動的にデータベースが再開されます。 サーバーレス コンピューティング レベルは、General Purpose サービス レベルで提供されており、現在 Hyperscale サービス レベルがプレビュー段階です。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/serverless-tier-overview?view=azuresql&tabs=general-purpose",
      "category": "",
      "tags": [
        "sql-database",
        "azure-functions"
      ]
    },
    {
      "id": 79,
      "question": "Azure SQL をデータベース プラットフォームとして使用する予定です。 次の要件を満たす Azure SQL 製品とサービス レベルを推奨する必要があります。 このとき、何を勧めるべきですか。 サービスレベル:・ ワークロードの需要に基づいてコンピューティング リソースを自動的にスケーリングする・ 秒単位の課金を提供する",
      "choices": [
        "Business Critical",
        "General Purpose",
        "Basic",
        "Standard",
        "Hyperscale"
      ],
      "answer": 1,
      "explanation": "サーバーレスは、ワークロードの需要に基づいてコンピューティングが自動的にスケーリングされ、1 秒あたりのコンピューティング使用量に対して請求される、Azure SQL Database の単一データベース用のコンピューティング レベルです。 またサーバーレス コンピューティング レベルでは、アイドル期間にデータベースを自動的に一時停止します。このときはストレージのみに課金され、再びアクティブになると自動的にデータベースが再開されます。 サーバーレス コンピューティング レベルは、General Purpose サービス レベルで提供されており、現在 Hyperscale サービス レベルがプレビュー段階です。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/serverless-tier-overview?view=azuresql&tabs=general-purpose",
      "category": "",
      "tags": [
        "sql-database",
        "azure-functions"
      ]
    },
    {
      "id": 80,
      "question": "パフォーマンス データを Azure Blob Storage に書き込むデバイスが 100 台あります。 パフォーマンス データを Azure SQL データベースに保存して分析することを計画しています。 パフォーマンス データを Azure SQL データベースに継続的にコピーするソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "Azure Database Migration Service",
        "Azure Data Factory",
        "Data Migration Assistant (DMA)",
        "Azure Data Box"
      ],
      "answer": 1,
      "explanation": "Azure Data Factory は、データ パイプラインの作成、スケジュール、管理を可能にするクラウドベースのデータ統合サービスです。これを使用すると、Azure Blob Storage などのさまざまなソースから Azure SQL Database などの複数の宛先にデータを継続的にコピーできます。他の選択肢は、説明したシナリオでの継続的なデータ コピーには適していません。https://learn.microsoft.com/ja-jp/azure/data-factory/introduction",
      "category": "",
      "tags": [
        "blob-storage",
        "sql-database",
        "data-analytics",
        "data-migration",
        "db-migration"
      ]
    }
  ]
};
