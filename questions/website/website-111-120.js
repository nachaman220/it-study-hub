var QUIZ_DATA_website_111_120 = {
  "source": "original",
  "questions": [
    {
      "id": 111,
      "question": "Azure サブスクリプション上でステートレスな Web アプリケーションをホストするためのリソースをデプロイする必要があります。提案された解決策として、Isolated App Service プランに Web アプリをデプロイする方法が挙げられています。この提案は以下の目標を達成できますか。・ 完全な .NET Framework を利用可能にする。・ Azure リージョン全体の障害時にも冗長性を確保する。・ カスタムのアプリケーション依存関係をインストールするために、管理者が OS レベルのアクセス権を持てるようにする。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "この提案は目標を満たしません。代替策として、2 つの Azure リージョンにそれぞれ Azure 仮想マシンをデプロイし、Azure Traffic Manager プロファイルを構成する方法が適切です。https://docs.microsoft.com/ja-jp/azure/traffic-manager/traffic-manager-overview",
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
      "question": "以下のリソースを含む Azure サブスクリプションがあります。VNet1 と VNet2 間、および VNet1 と VNet3 間にピアリングを設定しています。各仮想マシンは HTTPS ベースのクライアント/サーバーアプリケーションを実行しており、プライベート IP アドレスのみでアクセス可能です。VM2 と VM3 間で負荷分散を行い、一方の VM に障害が発生した際にもう一方へ自動的にリクエストが転送されるようにするには、どのソリューションを採用すべきですか。名前 | 種類 | 詳細------------------------------VM1 | 仮想マシン | 米国中部リージョン、フロントエンドVM2 | 仮想マシン | 米国東部リージョン、バックエンドVM3 | 仮想マシン | 米国西部 2 リージョン、バックエンドVNet1 | 仮想ネットワーク | VM1 を収容VNet2 | 仮想ネットワーク | VM2 を収容VNet3 | 仮想ネットワーク | VM3 を収容",
      "choices": [
        "リージョン間のロード バランサー",
        "Azure Firewall Premium",
        "Azure Application Gateway v2",
        "Azure Front Door Premium"
      ],
      "answer": 3,
      "explanation": "Azure Front Door Premium は Private Link に対応しており、仮想ネットワーク内で稼働するサービスへのプライベート接続を実現します。プライベートエンドポイントを各リージョンのネットワーク内に作成し、Microsoft のバックボーンネットワーク経由で VM2 および VM3 にトラフィックを振り分けることが可能です。パブリックインターネットへの露出なしにリージョン横断での負荷分散と自動フェールオーバーを実現できます。https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-faq#azure-front-door---azure-application-gateway----------",
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
      "question": "ある企業が Azure SQL データベースを利用する複数の Azure App Service インスタンスのデプロイを予定しています。App Service インスタンスは Azure SQL データベースと同時にプロビジョニングされます。規制上の要件として、App Service は特定の Azure リージョンにのみ配置でき、関連リソースも同一リージョンに存在しなければなりません。提案された解決策として、Azure Policy イニシアチブによりリソースグループの場所を強制する方法が挙げられています。これは目的を達成しますか。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "リソースグループの場所と、その中に含まれるリソースの場所は無関係です。リソースグループは「許可された場所」ポリシーの対象外となります。リソースのデプロイ先リージョンを制限するには、「許可された場所」ポリシーをリソース自体に適用する必要があります。リソースグループの配置制限には別途「リソースグループに許可された場所」ポリシーを使用します。",
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
      "question": "サードパーティ製のスケジューラを使用するハイパフォーマンスコンピューティング (HPC) クラスターを Azure 上にプロビジョニングしたいと考えています。HPC クラスターのノードをプロビジョニングおよび管理するのに最適なソリューションはどれですか。",
      "choices": [
        "Azure Purview",
        "Azure Automation",
        "Azure Lighthouse",
        "Azure CycleCloud"
      ],
      "answer": 3,
      "explanation": "Azure CycleCloud は、Azure 上での HPC 環境の構築・管理に特化したエンタープライズ向けツールです。既存の HPC スケジューラとの連携が可能で、インフラの動的なプロビジョニングや自動スケーリングをサポートします。任意の規模でのジョブ実行が効率的に行えるほか、ファイルシステムの作成やコンピュートノードへのマウントといった機能も備えています。https://learn.microsoft.com/ja-jp/azure/cyclecloud/overview?view=cyclecloud-8",
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
      "question": "ニューヨーク、シドニー、パリ、ヨハネスブルグにオフィスを持つ企業が、Azure サブスクリプションを利用しています。以下の条件を満たす Azure ネットワークソリューションをデプロイするにあたり、最低限必要な仮想 WAN ハブの数はいくつですか。・ 米国東部、東南アジア、北ヨーロッパ、南アフリカの各 Azure リージョンで ExpressRoute 回線と接続する。・ 3 つのリージョン間の接続を最適化してレイテンシを最小化する。・ サイト間 VPN 接続をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "1",
        "2",
        "3",
        "4"
      ],
      "answer": 3,
      "explanation": "レイテンシ最小化には 3 リージョンでの接続最適化が求められますが、4 つの Azure リージョンすべてで ExpressRoute 回線への接続も必要です。各リージョンにローカルなハブを配置することで、接続ポイントが確保されレイテンシが低減されます。3 リージョン間の最適化だけなら 3 つで足りるように見えますが、4 つのリージョンすべてのローカル接続をカバーするには 4 つのハブが必要です。",
      "category": "",
      "tags": [
        "subscription-design",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 116,
      "question": "ニューヨーク、シドニー、パリ、ヨハネスブルグにオフィスを持つ企業が、Azure サブスクリプションを利用しています。以下の条件を満たす Azure ネットワークソリューションをデプロイするにあたり、適切な仮想 WAN SKU はどれですか。・ 米国東部、東南アジア、北ヨーロッパ、南アフリカの各 Azure リージョンで ExpressRoute 回線と接続する。・ 3 つのリージョン間の接続を最適化してレイテンシを最小化する。・ サイト間 VPN 接続をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "Standard",
        "Basic"
      ],
      "answer": 0,
      "explanation": "Basic SKU はサイト間 VPN のみ対応です。Standard SKU は ExpressRoute、ユーザー VPN (P2S)、サイト間 VPN、ハブ間トランジット、VNet 間トランジット、Azure Firewall、仮想 WAN 上の NVA をサポートします。ExpressRoute との接続が必要なため Standard が必須です。https://learn.microsoft.com/ja-jp/azure/virtual-wan/virtual-wan-about#basicstandard",
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
      "question": "Azure サブスクリプションを利用しており、Linux ノードを使用する Azure Kubernetes Service (AKS) のソリューションを推奨する必要があります。以下の条件を満たすスケーリングオプションはどれですか。・ スケールアウト時のコンピューティングリソースのプロビジョニング時間を最小限にする。・ Linux コンテナの自動スケーリングに対応する。・ 管理にかかる作業量を最小限にする。",
      "choices": [
        "クラスターオートスケーラー",
        "Virtual Kubelet",
        "水平 Pod オートスケーラー",
        "仮想ノード"
      ],
      "answer": 3,
      "explanation": "仮想ノードを使用すると、AKS クラスター上のアプリケーションワークロードを迅速にスケールできます。Pod のプロビジョニングが短時間で完了し、実行時間に基づく秒単位の課金のみで済みます。クラスターオートスケーラーが VM コンピューティングノードの追加デプロイを待つ必要がなくなります。なお、仮想ノードは Linux の Pod とノードでのみサポートされています。https://learn.microsoft.com/ja-jp/azure/aks/virtual-nodes",
      "category": "",
      "tags": [
        "subscription-design",
        "vmss",
        "containers"
      ]
    },
    {
      "id": 118,
      "question": "Microsoft Entra ID ユーザーがオンラインアンケートの作成・公開を行える SaaS アプリケーションを設計しています。このアプリケーションにはフロントエンドの Web アプリとバックエンドの Web API があり、Web アプリは Web API を呼び出して顧客アンケートの更新処理を行います。以下の要件を満たす認証フローの設計において、アクセストークンはどこで生成されるべきですか。・ Web アプリからバックエンド Web API へのアクセスには OAuth 2.0 ベアラートークンによる認証が必要。・ Web アプリでは個々のユーザーの ID による認証が必要。",
      "choices": [
        "ウェブアプリ",
        "Web API",
        "Microsoft Entra ID"
      ],
      "answer": 2,
      "explanation": "OAuth 2.0 では、認可サーバーがリソース所有者の承認に基づきアクセストークンを発行します。Microsoft Entra ID は OAuth 2.0 のすべてのフローをサポートする認可サーバーとして機能し、アクセストークンの生成を担います。クライアント（Web アプリ）はこのトークンを使って、リソースサーバー（Web API）上の保護リソースにアクセスします。https://learn.microsoft.com/ja-jp/entra/architecture/auth-oauth2",
      "category": "",
      "tags": [
        "entra-id",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 119,
      "question": "Microsoft Entra ID ユーザーがオンラインアンケートの作成・公開を行える SaaS アプリケーションを設計しています。このアプリケーションにはフロントエンドの Web アプリとバックエンドの Web API があり、Web アプリは Web API を呼び出して顧客アンケートの更新処理を行います。以下の要件を満たす認証フローの設計において、認可の判断はどこで行われるべきですか。・ Web アプリからバックエンド Web API へのアクセスには OAuth 2.0 ベアラートークンによる認証が必要。・ Web アプリでは個々のユーザーの ID による認証が必要。",
      "choices": [
        "ウェブアプリ",
        "Web API",
        "Microsoft Entra ID"
      ],
      "answer": 1,
      "explanation": "委任アクセスのパターンでは、Web API に送信されるベアラートークンにユーザー ID 情報が含まれています。Web API はこのユーザー ID をもとに、リソースへのアクセス可否を判断します。https://learn.microsoft.com/ja-jp/azure/architecture/guide/multitenant/considerations/identity",
      "category": "",
      "tags": [
        "entra-id",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 120,
      "question": "以下の条件を満たす高可用性 Azure SQL データベースを設計するには、どのデプロイオプションを選択すべきですか。・ レプリカ間のフェイルオーバー時にデータ損失が発生しないこと。・ 可用性ゾーンの障害時にもデータベースの利用を継続できること。・ コストを可能な限り抑えること。",
      "choices": [
        "Azure SQL Database Business Critical",
        "Azure SQL Database Basic",
        "Azure SQL Managed Instance General Purpose",
        "Azure SQL Database Standard"
      ],
      "answer": 0,
      "explanation": "Business Critical レベルは、フェールオーバー時のデータ損失ゼロと高可用性を実現するよう設計されています。また、ゾーン冗長構成を備えており、異なる可用性ゾーンにレプリカを配置することで、ゾーン停止時にもサービスを継続できます。General Purpose レベルでは必要なゾーン冗長性がサポートされていません。コスト最小化は最も安価な選択肢を選ぶことではなく、すべての要件を満たした上で最もコスト効率の高い構成を選ぶことを意味します。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/sql-database-paas-overview?view=azuresql#service-tiers",
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
