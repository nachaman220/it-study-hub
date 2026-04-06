var QUIZ_DATA_website_111_120 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 111,
      "question": "Azure サブスクリプションでステートレス Web アプリをホストするには、リソースをデプロイする必要があります。ソリューションは次の要件を満たす必要があります。 解決策: Web アプリを Isolated App Service プランにデプロイします。 これは目標を達成していますか。・ 完全な .NET Frameworkへのアクセスを提供する。・ Azure リージョンに障害が発生した場合に冗長性を提供する。・ カスタム アプリケーションの依存関係をインストールするためのオペレーティング システムへのアクセスを管理者に許可する。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "解決策の代わりに、2 つの Azure 仮想マシンを 2 つの Azure リージョンにデプロイし、Azure Traffic Manager プロファイルを作成します。https://docs.microsoft.com/ja-jp/azure/traffic-manager/traffic-manager-overview",
      "category": "",
      "tags": [
        "subscription-design",
        "azure-storage",
        "load-balancers",
        "virtual-machines",
        "app-service"
      ]
    },
    {
      "id": 112,
      "question": "次の表に示すリソースを含む Azure サブスクリプションを持っています。 VNet1 と VNet2 の間、および VNet1 と VNet3 の間にピアリングを作成します。 仮想マシンは HTTPS ベースのクライアント/サーバー アプリケーションをホストし、各仮想マシンのプライベート IP アドレスを介してのみアクセスできます。 VM2 と VM3 の負荷分散ソリューションを実装する必要があります。ソリューションでは、VM2 に障害が発生した場合にはリクエストが自動的に VM3 にルーティングされ、VM3 に障害が発生した場合にはリクエストが自動的に VM2 にルーティングされるようにする必要があります。 ソリューションには何を含めるべきでしょうか。名前 | タイプ | 説明------------------------------VM1 | 仮想マシン | 米国中部 Azure リージョンのフロントエンド コンポーネントVM2 | 仮想マシン | 米国東部 Azure リージョンのバックエンド コンポーネントVM3 | 仮想マシン | 米国西部 2 Azure リージョンのバックエンド コンポーネントVNet1 |仮想ネットワーク | VM1にホストVNet2 |仮想ネットワーク | VM2にホストVNet3 | 仮想ネットワーク | VM3にホスト",
      "choices": [
        "リージョン間のロード バランサー",
        "Azure Firewall Premium",
        "Azure Application Gateway v2",
        "Azure Front Door Premium"
      ],
      "answer": 3,
      "explanation": "Azure Front Door Premium は、仮想ネットワークから Azure で実行されているサービスへのプライベート接続を可能にする Private Link をサポートします。この機能を使用すると、リージョン間のサービスにプライベートに接続できるため、VM2 が米国東部にあり、VM3 が米国西部にあるユースケースで機能します。Azure Front Door Premium は、Private Link を使用してセットアップして、地域ネットワーク内にプライベート エンドポイントを作成できます。このネットワークは、パブリック インターネットに公開することなく、Microsoft バックボーン ネットワーク上のプライベート リンクを介して VM2 および VM3 にトラフィックをルーティングできます。 1 つの VM に障害が発生した場合、Azure Front Door は自動的にトラフィックを他の VM にルーティングし、アプリケーションの可用性を維持します。https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-faq#azure-front-door---azure-application-gateway----------",
      "category": "",
      "tags": [
        "subscription-design",
        "load-balancers",
        "virtual-machines",
        "vnet",
        "private-link",
        "network-security"
      ]
    },
    {
      "id": 113,
      "question": "あなたの会社は、Azure SQL データベースを使用するさまざまな Azure App Service インスタンスをデプロイすることを計画しています。 App Service インスタンスは、Azure SQL データベースと同時にデプロイされます。 同社には、App Service インスタンスを特定の Azure リージョンにのみデプロイするという規制要件があります。 App Service インスタンスのリソースは同じリージョンに存在する必要があります。 規制要件を満たすソリューションを推奨する必要があります。 解決策: Azure Policy イニシアチブを使用して、リソース グループの場所を強制することをお勧めします。 これは目標を達成していますか。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "リソースグループ の場所は、リソースグループ 内のリソースの場所とは関係ありません。リソース グループは、「許可された場所」ポリシーから除外されます。 リソース グループを作成できる場所を制限する場合は、「リソース グループに許可された場所」ポリシーを使用してください。参考として、許可された場所のポリシー定義の説明を以下に示します。このポリシーを使用すると、リソースを展開するときに組織が指定できる場所を制限できます。 地理的コンプライアンス要件を強制するために使用します。 リソース グループ、Microsoft.AzureActiveDirectory/b2cDirectories、および「グローバル」リージョンを使用するリソースは除外されます。",
      "category": "",
      "tags": [
        "azure-policy",
        "purview",
        "sql-database",
        "app-service"
      ]
    },
    {
      "id": 114,
      "question": "サードパーティのスケジューラを使用するハイ パフォーマンス コンピューティング (HPC) クラスターを Azure にプロビジョニングする予定です。 HPC クラスター ノードをプロビジョニングおよび管理するためのソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "Azure Purview",
        "Azure Automation",
        "Azure Lighthouse",
        "Azure CycleCloud"
      ],
      "answer": 3,
      "explanation": "Azure CycleCloud を使用して Azure HPC クラスターを動的にプロビジョニングできます。Azure CycleCloud は、Azure 上のハイ パフォーマンス コンピューティング (HPC) 環境を調整および管理するためのエンタープライズ向けツールです。 CycleCloud を使用すると、ユーザーは HPC システムのインフラストラクチャをプロビジョニングし、使い慣れた HPC スケジューラをデプロイし、インフラストラクチャを自動的にスケーリングして、任意の規模でジョブを効率的に実行できます。 CycleCloud を使用して、ユーザーはさまざまな種類のファイル システムを作成し、コンピューティング クラスター ノードにマウントして HPC ワークロードをサポートできます。https://learn.microsoft.com/ja-jp/azure/cyclecloud/overview?view=cyclecloud-8",
      "category": "",
      "tags": [
        "lighthouse",
        "purview",
        "batch",
        "automation-deploy"
      ]
    },
    {
      "id": 115,
      "question": "あなたの会社は、ニューヨーク市、シドニー、パリ、ヨハネスブルグにオフィスを構えています。 会社は Azure サブスクリプションを持っています。 次の要件を満たす新しい Azure ネットワーク ソリューションをデプロイする予定です。 デプロイする必要がある Azure 仮想 WAN ハブの最小数と、使用する仮想 WAN SKU を特定する必要があります。 次のうちどれを選択しますか。 仮想 WAN ハブの数:・ 米国東部、東南アジア、北ヨーロッパ、南アフリカの Azure リージョンの ExpressRoute 回線に接続する。・ 3 つのリージョンでの接続をサポートすることで遅延を最小限に抑える。・ サイト間 VPN 接続をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "1",
        "2",
        "3",
        "4"
      ],
      "answer": 3,
      "explanation": "「3 つのリージョンでの接続をサポートすることで遅延を最小限に抑える」という要件は、3 つのリージョン間で接続を最適化する必要があることを示唆しています。ただし、ソリューションは、米国東部、東南アジア、北ヨーロッパ、南アフリカの 4 つの特定の Azure リージョンの ExpressRoute 回線にも接続する必要があります。これらすべての要件を満たすには、これら 4 つのリージョンのそれぞれにハブをデプロイする必要があります。これにより、各リージョンにローカル接続ポイントが確保され、待ち時間が短縮されます。接続は 3 つのリージョンにわたって最適化されていますが、4 つのリージョンにローカル接続ポイントを提供するには 4 つのハブが必要です。1 つの要件に基づくと 3 つのハブで十分であるように考えられますが、すべての要件を考慮すると 4 つのハブが必要です。",
      "category": "",
      "tags": [
        "subscription-design",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 116,
      "question": "あなたの会社は、ニューヨーク市、シドニー、パリ、ヨハネスブルグにオフィスを構えています。 会社は Azure サブスクリプションを持っています。 次の要件を満たす新しい Azure ネットワーク ソリューションをデプロイする予定です。 デプロイする必要がある Azure 仮想 WAN ハブの最小数と、使用する仮想 WAN SKU を特定する必要があります。 次のうちどれを選択しますか。 仮想 WAN SKU:・ 米国東部、東南アジア、北ヨーロッパ、南アフリカの Azure リージョンの ExpressRoute 回線に接続する。・ 3 つのリージョンでの接続をサポートすることで遅延を最小限に抑える。・ サイト間 VPN 接続をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "Standard",
        "Basic"
      ],
      "answer": 0,
      "explanation": "Basic: サイト間 VPN のみサポートします。Standard: 以下をサポートします。ExpressRouteユーザー VPN (P2S)VPN (サイト対サイト)仮想ハブを経由したハブ間および VNet 対 VNet トランジットAzure Firewall仮想 WAN の NVAhttps://learn.microsoft.com/ja-jp/azure/virtual-wan/virtual-wan-about#basicstandard",
      "category": "",
      "tags": [
        "subscription-design",
        "vnet",
        "on-premises-connectivity",
        "network-security"
      ]
    },
    {
      "id": 117,
      "question": "あなたは、Azure サブスクリプションを持っています。 Linux ノードを使用する Azure Kubernetes Service (AKS) ソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 どのスケーリング オプションをお勧めしますか。・ スケールアウト操作中にコンピューティング リソースをプロビジョニングするのにかかる時間を最小限に抑える。・ Linux コンテナの自動スケーリングをサポートする。・ 管理労力を最小限に抑える。",
      "choices": [
        "クラスターオートスケーラー",
        "Virtual Kubelet",
        "水平 Pod オートスケーラー",
        "仮想ノード"
      ],
      "answer": 3,
      "explanation": "AKS クラスターでアプリケーション ワークロードをすばやくスケーリングするには、仮想ノードを使用します。 仮想ノードを使用すると、ポッドを短時間でプロビジョニングできるため、ポッドの実行時間に対して秒単位の支払いだけで済みます。 Kubernetes クラスターのオートスケーラーが VM コンピューティング ノードをデプロイしてより多くのポッドを実行するのを待つ必要はありません。 仮想ノードは、Linux のポッドとノードでのみサポートされます。https://learn.microsoft.com/ja-jp/azure/aks/virtual-nodes",
      "category": "",
      "tags": [
        "subscription-design",
        "vmss",
        "containers"
      ]
    },
    {
      "id": 118,
      "question": "あなたは、Microsoft Entra ID ユーザーがオンライン アンケートを作成して公開できるようにする、サービスとしてのソフトウェア (SaaS) アプリケーションを設計しています。 SaaS アプリケーションにはフロントエンド Web アプリとバックエンド Web API があります。 Web アプリは、Web API を利用して顧客調査の更新を処理します。 SaaS アプリケーションの認証フローを設計する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 アクセス トークンは次によって生成される。・ バックエンド Web API にアクセスするには、Web アプリは OAuth 2.0ベアラートークンを使用して認証する必要がある。・ Web アプリは、個々のユーザーの ID を使用して認証する必要がある。",
      "choices": [
        "ウェブアプリ",
        "Web API",
        "Microsoft Entra ID"
      ],
      "answer": 2,
      "explanation": "Auth 2.0 は、認可用の業界プロトコルです。 ユーザーは保護されたリソースへの制限付きアクセスを許可できます。 OAuth は、特にハイパーテキスト転送プロトコル (HTTP) を使用するように設計されているため、クライアントの役割がリソース所有者から分離されます。 クライアントでは、リソース所有者によって制御され、リソース サーバーでホストされるリソースへのアクセスが要求されます。 リソース サーバーでは、リソース所有者の承認を使用してアクセス トークンが発行されます。 クライアントはアクセス トークンを使用して、リソース サーバーでホストされる保護されたリソースにアクセスします。OAuth 2.0 は、OpenID Connect (OIDC) に直接関連しています。 OIDC は OAuth 2.0 上に構築された認証と認可の層であるため、OAuth 1.0 との下位互換性がありません。 Microsoft Entra ID では、すべての OAuth 2.0 フローがサポートされています。https://learn.microsoft.com/ja-jp/entra/architecture/auth-oauth2",
      "category": "",
      "tags": [
        "entra-id",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 119,
      "question": "あなたは、Microsoft Entra ID ユーザーがオンライン アンケートを作成して公開できるようにする、サービスとしてのソフトウェア (SaaS) アプリケーションを設計しています。 SaaS アプリケーションにはフロントエンド Web アプリとバックエンド Web API があります。 Web アプリは、Web API を利用して顧客調査の更新を処理します。 SaaS アプリケーションの認証フローを設計する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 認可の決定は以下によって実行される。・ バックエンド Web API にアクセスするには、Web アプリは OAuth 2.0ベアラートークンを使用して認証する必要がある。・ Web アプリは、個々のユーザーの ID を使用して認証する必要がある。",
      "choices": [
        "ウェブアプリ",
        "Web API",
        "Microsoft Entra ID"
      ],
      "answer": 1,
      "explanation": "委任されたアクセスが使用されます。Web API に送信されるベアラー トークンには、ユーザー ID が含まれています。Web API は、ユーザー ID に基づいて認可を決定します。https://learn.microsoft.com/ja-jp/azure/architecture/guide/multitenant/considerations/identity",
      "category": "",
      "tags": [
        "entra-id",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 120,
      "question": "次の要件を満たす高可用性 Azure SQL データベースを設計する必要があります。 どのデプロイ オプションを使用する必要がありますか。・ データベースのレプリカ間のフェイルオーバーは、データを失わずに実行する必要がある。・ ゾーンが停止した場合でも、データベースは利用可能な状態を維持する必要がある。・ コストは最小限に抑える必要がある。",
      "choices": [
        "Azure SQL Database Business Critical",
        "Azure SQL Database Basic",
        "Azure SQL Managed Instance General Purpose",
        "Azure SQL Database Standard"
      ],
      "answer": 0,
      "explanation": "Azure SQL Database Business Critical レベルは、フェールオーバー中にデータ損失がゼロで高可用性を提供するように設計されており、シナリオの主な要件の 1 つを満たします。さらに、Azure SQL Database Business Critical レベルではゾーン冗長構成が提供されます。これは、データのレプリカが異なる可用性ゾーンに保存されることを意味します。これは、ゾーンが停止した場合でもデータベースが利用可能な状態を維持し、シナリオの別の要件を満たしていることを意味します。Azure SQL Managed Instance General Purpose は、単一リージョン内で自動バックアップと高可用性を提供しますが、必要なゾーン冗長性はサポートしていません。Business Critical レベルは高価に見えるかもしれませんが、要件はコストを最小限に抑えることであり、最も安価なオプションを選択することではないことに注意してください。高可用性とデータ損失ゼロの要件を考慮すると、Business Critical 層が最もコスト効率の高い選択肢となります。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/sql-database-paas-overview?view=azuresql#service-tiers",
      "category": "",
      "tags": [
        "azure-storage",
        "sql-database",
        "bcdr-fundamentals",
        "availability-zones",
        "azure-backup",
        "site-recovery",
        "storage-redundancy"
      ]
    }
  ]
};
