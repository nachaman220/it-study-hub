var QUIZ_DATA_website_71_80 = {
  "source": "original",
  "questions": [
    {
      "id": 71,
      "question": "ルート管理グループと10個の子管理グループで構成されるAzure環境を構築予定です。各子管理グループに5つのサブスクリプションを配置し、各サブスクリプションに10～30個のリソースグループを含める計画です。Azure Blueprintsによるガバナンス制御を全サブスクリプション・リソースグループに適用し、構成の一貫性を確保しつつ、ブループリントの定義数と割り当て数を最小化する場合、ブループリントを定義すべきレベルはどれですか？",
      "choices": [
        "ルート管理グループ",
        "子管理グループ",
        "サブスクリプション"
      ],
      "answer": 0,
      "explanation": "ブループリント定義の保存先として管理グループまたはサブスクリプションを指定できます。保存先が管理グループの場合、そのグループ配下の子サブスクリプションにブループリントを割り当て可能です。ルート管理グループは階層の最上位であり、全管理グループ・全サブスクリプションを包含します。このレベルでブループリントを定義することにより、グローバルなポリシーやロール割り当てをディレクトリ全体に適用できます。",
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
      "question": "ルート管理グループ配下に10個の子管理グループがあるAzure環境を計画中です。各子管理グループに5サブスクリプション、各サブスクリプションに10～30のリソースグループを含めます。Azure Blueprintsで全体のガバナンスを統一し、定義・割り当て数を最小化する方針において、ブループリントの割り当てを作成するレベルはどこですか？",
      "choices": [
        "ルート管理グループ",
        "子管理グループ",
        "サブスクリプション"
      ],
      "answer": 2,
      "explanation": "ブループリントの発行済みバージョンは、既存の管理グループまたはサブスクリプションに割り当てることが可能です（割り当て名は最大90文字）。ポータル上ではデフォルトで直近の発行バージョンが選択されます。アーティファクトパラメーターやブループリントパラメーターがある場合は、割り当て時に値を定義します。",
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
      "question": "Azureサブスクリプション上でステートレスWebアプリをホストするリソースをデプロイします。要件：完全な.NET Frameworkが利用できる／Azureリージョン障害時にも冗長性がある／管理者がOSにアクセスしてカスタムアプリ依存関係をインストールできる。解決策として、自動スケーリング付きのVirtual Machine Scale Setsをデプロイすることを提案します。これで目標を達成できますか？",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "この解決策では要件を満たせません。VMSSは単一リージョン内で動作するため、リージョン障害時の冗長性を確保できません。代替策として、2つのAzureリージョンにそれぞれVMをデプロイし、Traffic Managerプロファイルで負荷分散する構成が必要です。Azure Traffic ManagerはDNSベースのトラフィックロードバランサーとして、パブリックアプリケーションへのトラフィックを複数リージョンに分散し、高可用性と高応答性を実現します。",
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
      "question": "Azure Cosmos DBとAzure Synapseの統合ソリューションを設計しています。要件：SynapseワークスペースからCosmos DBへの通信はMicrosoftバックボーンネットワーク経由とする／インターネット経由のルーティングは禁止／導入工数を最小化する。Synapseワークスペースのプロビジョニング時にどの設定を行うべきですか？",
      "choices": [
        "Microsoft Entra ID 認証の使用を有効にする。",
        "ワークスペース エンドポイントへのパブリック ネットワーク アクセスを無効にする。",
        "専用の仮想ネットワークを構成する。"
      ],
      "answer": 2,
      "explanation": "マネージドプライベートエンドポイントを使用するには、マネージドワークスペース仮想ネットワークが有効なSynapseワークスペースが必要です。専用のマネージド仮想ネットワークを構成することで、プライベートエンドポイントを通じた安全な通信が可能になります。",
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
      "question": "Azure Cosmos DBとAzure Synapseの統合ソリューションの設計において、次の条件を満たす必要があります。条件：SynapseからCosmos DBへの通信をMicrosoftバックボーン経由にする／インターネット経由は不可／導入労力を最小にする。Cosmos DBアカウントの設定時に何を有効化すべきですか？",
      "choices": [
        "マネージド プライベート エンドポイント",
        "サービス エンドポイント ポリシー",
        "サーバーレベルのファイアウォール規則"
      ],
      "answer": 0,
      "explanation": "マネージドプライベートエンドポイントを利用すれば、SynapseワークスペースとAzureリソース間のトラフィックが全てMicrosoftバックボーンネットワーク上で完結します。インターネットを経由しないため、セキュリティ要件を満たしつつ導入も容易です。",
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
      "question": "オンプレミスネットワーク内の500GBのデータを保持するファイルサーバーServer1から、Azure Data Factoryを使ってAzure Storageへデータコピーする計画です。新しいData Factoryを作成した後、Server1側で行うべき次の手順は何ですか？",
      "choices": [
        "セルフホステッド統合ランタイムをインストールする。",
        "Azure File Sync エージェントをインストールする。",
        "ファイル サーバー リソース マネージャーの役​​割サービスをインストールする。"
      ],
      "answer": 0,
      "explanation": "データストアがオンプレミスネットワーク内、Azure仮想ネットワーク内、またはAmazon VPC内にある場合は、セルフホステッド統合ランタイムの構成が必要です。これにより、Data Factoryがプライベートネットワーク内のデータストアへアクセスできるようになります。指定しなければデフォルトのAzure統合ランタイムが使われますが、プライベートネットワーク内のデータには到達できません。",
      "category": "",
      "tags": [
        "data-analytics",
        "file-sync",
        "vnet"
      ]
    },
    {
      "id": 77,
      "question": "オンプレミスのファイルサーバーServer1（データ量500GB）からAzure Data Factoryを使ってAzure Storageにデータをコピーします。新規Data Factoryの追加後、Data Factory側で次に実施すべき操作は何ですか？",
      "choices": [
        "Azure Import/Export ジョブを作成する。",
        "Azure-SQL Server Integration Services (SSIS) 統合ランタイム (IR) をプロビジョニングする。",
        "パイプラインを作成する。"
      ],
      "answer": 2,
      "explanation": "Data Factory内でコピーアクティビティを実行するにはパイプラインを作成します。パイプラインのコピーアクティビティは、データコピーツール、Azureポータル、各種SDK（.NET、Python）、Azure PowerShell、REST API、ARMテンプレートなどを使って構成・実行できます。",
      "category": "",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 78,
      "question": "Azure SQLをデータベース基盤として採用する予定です。次の要件を満たすAzure SQL製品を選んでください。要件：ワークロード需要に応じてコンピューティングリソースが自動スケーリングされる／秒単位の課金に対応する。推奨すべきAzure SQL製品はどれですか？",
      "choices": [
        "Azure SQL Database の単一データベース",
        "Azure SQL Managed Instance",
        "An Azure SQL Database elastic pool"
      ],
      "answer": 0,
      "explanation": "サーバーレスコンピューティングレベルはAzure SQL Databaseの単一データベース向けに提供されており、ワークロード量に基づいてコンピューティングが自動スケーリングされ、秒単位で課金されます。アイドル時にはデータベースが自動停止してストレージのみの課金となり、アクティビティ再開時に自動復帰します。サーバーレスはGeneral Purposeサービスレベルで一般提供中で、HyperscaleではプレビューS段階です。",
      "category": "",
      "tags": [
        "sql-database",
        "azure-functions"
      ]
    },
    {
      "id": 79,
      "question": "Azure SQLの導入を計画しています。ワークロード需要に応じたコンピューティングの自動スケーリングと秒単位課金を実現するために、どのサービスレベルを選択すべきですか？",
      "choices": [
        "Business Critical",
        "General Purpose",
        "Basic",
        "Standard",
        "Hyperscale"
      ],
      "answer": 1,
      "explanation": "サーバーレスコンピューティングレベルは、General Purposeサービスレベルにおいて一般提供されています。ワークロード需要に合わせてコンピューティングを自動スケーリングし、秒単位で使用量に応じた課金を行います。アイドル状態ではデータベースが自動一時停止されストレージのみの課金に切り替わり、アクティビティ発生時に自動再開されます。Hyperscaleでのサーバーレスは現在プレビュー段階です。",
      "category": "",
      "tags": [
        "sql-database",
        "azure-functions"
      ]
    },
    {
      "id": 80,
      "question": "100台のデバイスがパフォーマンスデータをAzure Blob Storageに書き込んでいます。このデータをAzure SQL Databaseに格納して分析する計画であり、継続的にデータをコピーするソリューションが必要です。どのサービスを推奨すべきですか？",
      "choices": [
        "Azure Database Migration Service",
        "Azure Data Factory",
        "Data Migration Assistant (DMA)",
        "Azure Data Box"
      ],
      "answer": 1,
      "explanation": "Azure Data Factoryはデータパイプラインの構築・スケジュール・管理が可能なクラウドベースのデータ統合サービスです。Blob StorageからSQL Databaseなど、多様なソースからターゲットへの継続的なデータコピーに対応しています。他の選択肢は、このシナリオのような継続的なデータ転送には適していません。",
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
