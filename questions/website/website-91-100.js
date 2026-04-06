var QUIZ_DATA_website_91_100 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 91,
      "question": "ビジネスに重要なデータを保存する新しいアプリを開発する予定です。アプリは次の要件を満たす必要があります。 アプリにはどのようなストレージ ソリューションを推奨しますか。 ストレージ アカウントの種類:・ 1 年間は新しいデータが変更されないようにする。・ データの復元力を最大化する。・ 読み取り遅延を最小限に抑える。",
      "choices": [
        "Standard 汎用 v1",
        "Premium ブロックBLOB",
        "Standard 汎用 v2"
      ],
      "answer": 1,
      "explanation": "読み取り遅延を最小限に抑えるには、Premium ブロック BLOB が正解です。Premium レベルでは、不変ストレージもサポートされています。https://docs.microsoft.com/ja-jp/azure/storage/blobs/immutable-storage-overview#supported-account-configurations",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 92,
      "question": "ビジネスに重要なデータを保存する新しいアプリを開発する予定です。アプリは次の要件を満たす必要があります。 アプリにはどのようなストレージ ソリューションを推奨しますか。 冗長性:・ 1 年間は新しいデータが変更されないようにする。・ データの復元力を最大化する。・ 読み取り遅延を最小限に抑える。",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 1,
      "explanation": "ローカル冗長ストレージ (LRS) は、プライマリ リージョンの 1 つの物理的な場所内で、データを同期的に 3 回コピーします。 LRS は最もコストのかからないレプリケーション オプションですが、高可用性または持続性を必要とするアプリケーションには推奨されません。 ゾーン冗長ストレージ (ZRS) は、プライマリ リージョンの 3 つの Azure 可用性ゾーン間でデータを同期的にコピーします。 高可用性を必要とするアプリケーションでは、プライマリ リージョンで ZRS を使用し、セカンダリ リージョンにもレプリケートすることをお勧めします。https://learn.microsoft.com/ja-jp/azure/storage/common/storage-redundancy",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-storage",
        "bcdr-fundamentals",
        "availability-zones"
      ]
    },
    {
      "id": 93,
      "question": "次の表に示すリソースがあります。 Azure に RG2 という名前の新しいリソース グループを作成します。 仮想マシンを RG2 に移動する必要があります。 各仮想マシンを移動するには何を使用する必要がありますか。 VM1:名前 | タイプ | リソースグループ-----------------------------------------------VM1 | Azure 仮想マシン | RG1VM2 | オンプレミスの仮想マシン | 未適用",
      "choices": [
        "The Data Migration Assistant (DMA)",
        "Azure Migrate",
        "Azure Arc",
        "Azure Lighthouse",
        "Azure Resource Mover"
      ],
      "answer": 4,
      "explanation": "Azure Resource MoverAzure VM を別のリージョンに移動するには、Microsoft は Azure Resource Mover の使用を推奨しています。リージョン間でリソースを移動するには、移動するリソースを選択します。 Resource Mover はこれらのリソースを検証し、他のリソースに対する依存関係を解決します。https://docs.microsoft.com/ja-jp/azure/resource-mover/overview",
      "category": "",
      "tags": [
        "lighthouse",
        "virtual-machines",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 94,
      "question": "次の表に示すリソースがあります。 Azure に RG2 という名前の新しいリソース グループを作成します。 仮想マシンを RG2 に移動する必要があります。 各仮想マシンを移動するには何を使用する必要がありますか。 VM2:名前 | タイプ | リソースグループ-----------------------------------------------VM1 | Azure 仮想マシン | RG1VM2 | オンプレミスの仮想マシン | 未適用",
      "choices": [
        "The Data Migration Assistant (DMA)",
        "Azure Migrate",
        "Azure Arc",
        "Azure Lighthouse",
        "Azure Resource Mover"
      ],
      "answer": 1,
      "explanation": "Azure MigrateAzure Migrate では、Azure に簡単な移行、最新化、最適化のサービスが提供されます。 インフラストラクチャ、データ、アプリケーションに対して、オンプレミス リソースの検出、評価、適切なサイズ設定など、移行前のすべての手順が含まれています。 Azure Migrate の拡張可能なフレームワークを使用すると、サード パーティ製ツールを統合できるため、サポートされるユース ケースの範囲が広がります。Azure Arc: Azure Migrate で十分です。 Azure Arc を使用する必要はありません。Data Migration Assistant: Data Migration Assistant は、SQL Server を評価するためのスタンドアロン ツールです。Azure Lighthouse: Azure Lighthouse では、スケーラビリティ、高度な自動化、およびリソース全体にわたる強化されたガバナンスを備えたマルチテナント管理が可能になります。https://learn.microsoft.com/ja-jp/azure/migrate/migrate-services-overview",
      "category": "",
      "tags": [
        "entra-id",
        "lighthouse",
        "virtual-machines",
        "automation-deploy",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 95,
      "question": "あなたは、Azure Linux 仮想マシンを使用してビデオ ファイルを分析するアプリケーションを設計しています。 ファイルは、ExpressRoute を使用して Azure に接続する企業オフィスからアップロードされます。 ファイルをホストするために Azure ストレージ アカウントをプロビジョニングする予定です。 ストレージ アカウントが次の要件を満たしていることを確認する必要があります。 ストレージ アカウントはどのように構成すればよいでしょうか。 ストレージ アカウント タイプ:・ 最大 7 TB のビデオ ファイルをサポートする・ 可能な限り最高の可用性を提供する・ ストレージが大きなビデオ ファイル用に最適化されていることを確認する・ ExpressRoute を使用してオンプレミス ネットワークからのファイルが確実にアップロードされるようにする",
      "choices": [
        "Premium ページ BLOB",
        "Premium ファイル共有",
        "Standard 汎用 v2"
      ],
      "answer": 2,
      "explanation": "https://learn.microsoft.com/ja-jp/azure/storage/blobs/storage-blobs-introduction#blobs",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 96,
      "question": "あなたは、Azure Linux 仮想マシンを使用してビデオ ファイルを分析するアプリケーションを設計しています。 ファイルは、ExpressRoute を使用して Azure に接続する企業オフィスからアップロードされます。 ファイルをホストするために Azure ストレージ アカウントをプロビジョニングする予定です。 ストレージ アカウントが次の要件を満たしていることを確認する必要があります。 ストレージ アカウントはどのように構成すればよいでしょうか。 データの冗長性:・ 最大 7 TB のビデオ ファイルをサポートする・ 可能な限り最高の可用性を提供する・ ストレージが大きなビデオ ファイル用に最適化されていることを確認する・ ExpressRoute を使用してオンプレミス ネットワークからのファイルが確実にアップロードされるようにする",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 1,
      "explanation": "GRS は、LRS または ZRS と比較して、データ ストレージに追加の冗長性を提供します。また、可能な限り最高の可用性を実現します。https://learn.microsoft.com/ja-jp/azure/storage/common/storage-redundancy",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 97,
      "question": "あなたは、Azure Linux 仮想マシンを使用してビデオ ファイルを分析するアプリケーションを設計しています。 ファイルは、ExpressRoute を使用して Azure に接続する企業オフィスからアップロードされます。 ファイルをホストするために Azure ストレージ アカウントをプロビジョニングする予定です。 ストレージ アカウントが次の要件を満たしていることを確認する必要があります。 ストレージ アカウントはどのように構成すればよいでしょうか。 ネットワーキング:・ 最大 7 TB のビデオ ファイルをサポートする・ 可能な限り最高の可用性を提供する・ ストレージが大きなビデオ ファイル用に最適化されていることを確認する・ ExpressRoute を使用してオンプレミス ネットワークからのファイルが確実にアップロードされるようにする",
      "choices": [
        "サービスエンドポイント",
        "Azure Route Server",
        "プライベートエンドポイント"
      ],
      "answer": 2,
      "explanation": "ExpressRoute は、インターネットをバイパスして、Azure ネットワークに直接接続します。よって、プライベートエンドポイントが正答となります。Azure Private Link を使用すると、プライベート エンドポイントを使用して Azure PaaS サービスを仮想ネットワークに安全に接続できます。 多くのサービスでは、リソースごとにエンドポイントを設定するだけです。 つまり、オンプレミスまたはマルチクラウド サーバーを Azure Arc に接続し、パブリック ネットワークを使用する代わりに、Azure ExpressRoute またはサイト間 VPN 接続経由ですべてのトラフィックを送信できます。https://learn.microsoft.com/ja-jp/azure/azure-arc/servers/private-link-security",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "vnet",
        "on-premises-connectivity",
        "private-link"
      ]
    },
    {
      "id": 98,
      "question": "あなたは、Azure サブスクリプションを持っています。 開発者に Azure 仮想マシンをプロビジョニングできる機能を提供するソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。・ 特定のリージョンでのみ仮想マシンの作成を許可する。・ 特定のサイズの仮想マシンの作成のみを許可する。",
      "choices": [
        "Azure Policy",
        "Azure Resource Manager テンプレート",
        "ロールベースのアクセス制御 (RBAC)",
        "条件付きアクセス ポリシー"
      ],
      "answer": 0,
      "explanation": "Azure Policyを使用すると、許可される場所と許可される VM SKU を指定できます。https://learn.microsoft.com/ja-jp/azure/governance/policy/tutorials/create-and-manage",
      "category": "",
      "tags": [
        "rbac",
        "conditional-access",
        "subscription-design",
        "azure-policy",
        "virtual-machines"
      ]
    },
    {
      "id": 99,
      "question": "AG1 という名前の Always On 可用性グループをホストするオンプレミスの Microsoft SQL Server 2017 インスタンスが 2 つあります。 AG1 には、DB1 という名前の単一データベースが含まれています。 VM1 という名前の仮想マシンを含む Azure サブスクリプションがあります。 VM1 は Linux を実行し、SQL Server 2019 インスタンスが含まれています。 DB1 を VM1 に移行する必要があります。ソリューションでは、DB1 のダウンタイムを最小限に抑える必要があります。 マイグレーションの準備をするとき、あなたは次のうちどれを使用しますか。",
      "choices": [
        "オンプレミスの SQL Server インスタンスのアップグレード",
        "AG1 へのセカンダリ レプリカの追加",
        "VM1 での Always On 可用性グループの作成"
      ],
      "answer": 1,
      "explanation": "次の手順で移行の準備をします。セカンダリ レプリカを AG1 に追加するオンプレミスの SQL Server インスタンスには可用性グループ (AG1) がすでに存在しているため、VM1 に Always On 可用性グループを作成する必要はありません。セカンダリ レプリカを AG1 に追加すると、移行に使用できる DB1 のコピーを提供できます。これにより、プライマリ レプリカを使用可能な状態のままでセカンダリ レプリカで移行を実行することにより、DB1 のダウンタイムを最小限に抑えることができます。",
      "category": "",
      "tags": [
        "subscription-design",
        "sql-ha",
        "virtual-machines",
        "data-migration"
      ]
    },
    {
      "id": 100,
      "question": "AG1 という名前の Always On 可用性グループをホストするオンプレミスの Microsoft SQL Server 2017 インスタンスが 2 つあります。 AG1 には、DB1 という名前の単一データベースが含まれています。 VM1 という名前の仮想マシンを含む Azure サブスクリプションがあります。 VM1 は Linux を実行し、SQL Server 2019 インスタンスが含まれています。 DB1 を VM1 に移行する必要があります。ソリューションでは、DB1 のダウンタイムを最小限に抑える必要があります。 マイクレーションを実行するとき、あなたは次のうちどれを使用しますか。",
      "choices": [
        "ログ 配布",
        "Azure Migrate",
        "分散型可用性グループ"
      ],
      "answer": 1,
      "explanation": "オンプレミス SQL サーバーをアップグレードし、Azure Migrate を使用します。",
      "category": "",
      "tags": [
        "subscription-design",
        "sql-ha",
        "virtual-machines",
        "data-migration"
      ]
    }
  ]
};
