var QUIZ_DATA_website_81_90 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 81,
      "question": "あなたは、従業員の個人識別情報 (PII) を保存する Azure Web アプリを構築しています。 Azure SQL を推奨する必要があります。 Web アプリ用のデータベース ソリューション。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。 サービス階層とコンピューティング レベル:・ 単一のデータセンターが停止した場合でも可用性を維持する。・ PII を含む特定の列の暗号化をサポートする。・ 給与計算業務中に自動的にスケールアップする。・ コストを最小限に抑える。",
      "choices": [
        "Business Critical サービス レベルとサーバーレス コンピューティング レベル",
        "Hyperscale サービス レベルとプロビジョニング済みコンピューティング レベル",
        "General Purpose サービス レベルとサーバーレス コンピューティング レベル"
      ],
      "answer": 2,
      "explanation": "General Purpose サービス レベルは、一般的なワークロード向けに設計されています。 予算重視のバランスの取れたコンピューティングおよびストレージ オプションが提供されます。サーバーレス コンピューティング レベル: ワークロード アクティビティに基づいてコンピューティング リソースを自動的にスケーリングし、1 秒あたりのコンピューティング使用量に対して請求します。 サーバーレス コンピューティング レベルは、General Purpose サービス レベルで一般提供されており、現在 Hyperscale サービス レベルがプレビュー段階です。https://learn.microsoft.com/ja-jp/azure/azure-sql/database/sql-database-paas-overview?view=azuresql#service-tiers",
      "category": "",
      "tags": [
        "cost-management",
        "sql-database",
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 82,
      "question": "あなたは、従業員の個人識別情報 (PII) を保存する Azure Web アプリを構築しています。 Azure SQL を推奨する必要があります。 Web アプリ用のデータベース ソリューション。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。 暗号化方式:・ 単一のデータセンターが停止した場合でも可用性を維持する。・ PII を含む特定の列の暗号化をサポートする。・ 給与計算業務中に自動的にスケールアップする。・ コストを最小限に抑える。",
      "choices": [
        "透過的なデータ暗号化 (TDE)",
        "Always Encrypted",
        "Microsoft SQLサービスとデータベース暗号化キー"
      ],
      "answer": 1,
      "explanation": "Always Encrypted は、Azure SQL Database、Azure SQL Managed Instance や SQL Server データベースに格納された、クレジット カード番号や国民識別番号 (米国の社会保障番号など) のような機微なデータを保護することを目的とした機能です。 Always Encrypted では、クライアント内部で機密データが暗号化されるため、暗号化キーがデータベース エンジンに公開されることはありません。 これにより、データを所有し、それを表示できるユーザーと、データを管理するがアクセス権を持たないユーザー (オンプレミスのデータベース管理者、クラウド データベース オペレーター、またはその他の高い特権を持つ未承認のユーザー) が分離されます。 結果として、Always Encrypted を使用すると、顧客は自信を持って機密データをクラウドに格納し、悪意のある内部関係者によるデータ盗難の可能性を減らすことができます。https://learn.microsoft.com/ja-jp/sql/relational-databases/security/encryption/always-encrypted-database-engine?view=sql-server-ver16",
      "category": "",
      "tags": [
        "pim",
        "sql-database",
        "sql-security",
        "app-service"
      ]
    },
    {
      "id": 83,
      "question": "Microsoft Entra テナントがあります。 SQL API を使用する Azure Cosmos DB データベースをデプロイする予定です。 特定の Microsoft Entra ID ユーザー アカウントに Cosmos DB データベースへの読み取りアクセスを提供するソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "証明書と Azure Key Vault",
        "共有アクセス署名 (SAS) と条件付きアクセス ポリシー",
        "リソース トークンとアクセス制御 (IAM) ロールの割り当て",
        "マスター キーと Azure Information Protection ポリシー"
      ],
      "answer": 2,
      "explanation": "Azure Cosmos DB の SQL API は、マスター キー トークンとリソース トークンという 2 種類の承認を提供します。マスター キー トークンは、すべてのデータとすべての権限へのアクセスを提供します。リソース トークンは、特定のコンテナーとアクセス許可へのアクセスを提供し、Microsoft Entra ID ユーザーの ID を使用してこれらのトークンを作成できます。Microsoft Entra ID ユーザーに Azure Cosmos DB へのアクセスを提供するには、ユーザーに特定の IAM ロールを割り当てます。 Azure Cosmos DB は、特定のアクセスを提供するために Azure ロールベースのアクセス制御 (Azure RBAC) を使用します。 Azure RBAC は、Azure Resource Manager 上に構築された認証システムで、Azure 内のリソースに対するきめ細かいアクセス管理を提供します。リソース トークンと IAM ロールの割り当てを組み合わせることで、Microsoft Entra ID ユーザー アカウントが Cosmos DB データベースへの読み取りアクセスを持つために必要なアクセス制御が提供されます。https://docs.microsoft.com/ja-jp/azure/cosmos-db/role-based-access-control",
      "category": "",
      "tags": [
        "entra-id",
        "rbac",
        "conditional-access",
        "sas",
        "key-vault",
        "cosmosdb",
        "containers"
      ]
    },
    {
      "id": 84,
      "question": "App1 という名前の多層アプリと SQL1 という名前の Azure SQL データベースがあります。 App1 のバックエンド サービスは、データを SQL1 に書き込みます。ユーザーは App1 クライアントを使用して SQL1 からデータを読み取ります。 使用率が高い期間中、ユーザーはデータの取得に遅れを経験します。 データ要求にかかる時間を最小限に抑える必要があります。 ソリューションには何を含めるべきでしょうか。",
      "choices": [
        "Azure コンテンツ配信ネットワーク (CDN)",
        "Azure Cache for Redis",
        "Azure Synapse Analytics",
        "Azure Data Factory"
      ],
      "answer": 1,
      "explanation": "Azure Cache for Redis は、Redis ソフトウェアを基にしたインメモリ データ ストアを提供します。 Redis は、バックエンドでデータ ストアを酷使するアプリケーションのパフォーマンスとスケーラビリティを高めます。 高速に読み書きできるサーバーのメモリ内にアクセス頻度の高いデータを維持することで、大量のアプリケーション要求を処理することができます。 Redis によって、きわめて低遅延かつ高スループットのデータ ストレージ ソリューションがモダン アプリケーションにもたらされます。Azure コンテンツ配信ネットワーク (CDN): ネットワークに問題はありませんAzure Data Factory: このツールはオーケストレーション用であり、既存のものを強化するためのものではありませんAzure Synapse Analytics: 追加のデータ ウェアハウス機能を備えたオーケストレーション ツールでもありますが、この場合は関係ありませんhttps://learn.microsoft.com/ja-jp/azure/azure-cache-for-redis/cache-overview",
      "category": "",
      "tags": [
        "sql-database",
        "data-analytics",
        "caching"
      ]
    },
    {
      "id": 85,
      "question": "Azure Event Grid にルーティングされたイベントに応答してカスタム C# コードを実行するソリューションを設計する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。・ 実行されるコードは、Azure 仮想マシン上で実行される Microsoft SQL Server インスタンスのプライベート IP アドレスにアクセスできる必要がある。・ コストは最小限に抑える必要がある。",
      "choices": [
        "Azure Logic Apps の統合サービス環境 (ISE)",
        "Azure Logic Apps の 従量課金プラン",
        "Azure Functions の 従量課金プラン",
        "Azure Functions の Premium プラン"
      ],
      "answer": 3,
      "explanation": "プレミアム プランでは仮想ネットワーク接続が可能です。従量課金プランでは仮想ネットワーク統合機能にアクセスできません。https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-scale#networking-features",
      "category": "",
      "tags": [
        "virtual-machines",
        "azure-functions",
        "event-driven",
        "api-management",
        "vnet"
      ]
    },
    {
      "id": 86,
      "question": "従量課金プランでホストされている App1 という名前の Azure Functions マイクロサービス アプリがあります。 App1 は Azure Queue Storage トリガーを使用します。 App1 を Azure Kubernetes Service (AKS) クラスターに移行することを計画しています。 App1 をサポートするには、AKS クラスターを準備する必要があります。ソリューションは次の要件を満たす必要があります。 どの 2 つのアクションを実行する必要がありますか。・ 現在のデプロイメントと同じスケーリング メカニズムを使用する。・ kubenet および Azure Container Networking Interface (CNI) ネットワーキングをサポートする。",
      "choices": [
        "Kubernetes Event-driven Autoscaling (KEDA をインストールする。",
        "ポッドの水平オートスケーラーを構成する。",
        "AKS クラスター オートスケーラーを構成する。",
        "仮想 Kubelet をインストールする。",
        "仮想ノード アドオンを構成する。"
      ],
      "answer": 1,
      "explanation": "Kubernetes は、ポッドの水平オートスケーラー (HPA) を使用して、リソース需要を監視し、ポッドの数を自動的にスケーリングします。 既定では、HPA は、必要なレプリカ数の変更についてメトリック API を 15 秒ごとに確認します。メトリック API は、Kubelet からデータを 60 秒ごとに取得します。 つまり、HPA は 60 秒ごとに更新されます。 変更が必要な場合、それに応じてレプリカの数が増減されます。 HPA は、Kubernetes 1.8 以降用のメトリック サーバーをデプロイした AKS クラスターで動作します。https://learn.microsoft.com/ja-jp/azure/aks/concepts-scale#horizo%E2%80%8B%E2%80%8Bntal-pod-autoscalerKubernetes Event-driven Autoscaling (KEDA) は、アプリケーションの自動スケーリングをシンプルにすることを目指す単一目的の軽量コンポーネントであり、CNCF Graduated プロジェクトです。 イベント駆動型自動スケーリングを適用して、scale-to-zero で持続可能でコスト効率の高い方法で需要を満たすようにアプリケーションをスケーリングします。https://learn.microsoft.com/ja-jp/azure/aks/keda-about",
      "category": "",
      "tags": [
        "azure-monitor",
        "vmss",
        "containers",
        "azure-functions",
        "messaging",
        "event-driven",
        "data-migration"
      ]
    },
    {
      "id": 87,
      "question": "Azure Web アプリの複数のインスタンスを複数の Azure リージョンにデプロイすることを計画しています。 アプリのアクセス ソリューションを設計する必要があります。ソリューションは次のレプリケーション要件を満たしている必要があります。 解決策: Azure Traffic Manager を使用して、アプリへのアクセスを提供します。 これは目標を達成していますか。・ レート制限をサポートする。・ すべてのインスタンス間でリクエストのバランスをとる。・ 地域的に停電が発生した場合でも、ユーザーがアプリにアクセスできるようにする。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Traffic Manager は、DNS ベースのトラフィック ロード バランサーです。このサービスを使用すると、グローバル Azure リージョン全体でパブリック向けアプリケーションにトラフィックを分散できます。 Traffic Manager は、パブリック エンドポイントに高可用性と迅速な応答性も提供します。レート制限はありません。https://learn.microsoft.com/ja-jp/azure/app-service/web-sites-traffic-manager",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "load-balancers",
        "app-service"
      ]
    },
    {
      "id": 88,
      "question": "Azure Web アプリの複数のインスタンスを複数の Azure リージョンにデプロイすることを計画しています。 アプリのアクセス ソリューションを設計する必要があります。ソリューションは次のレプリケーション要件を満たしている必要があります。 解決策: Azure Load Balancer を使用して、アプリへのアクセスを提供します。 これは目標を達成していますか。・ レート制限をサポートする。・ すべてのインスタンス間でリクエストのバランスをとる。・ 地域的に停電が発生した場合でも、ユーザーがアプリにアクセスできるようにする。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Load Balancer はリージョン内でロード バランシングを行います (リージョンの停止はサポートされません)。一方で、Azure Load Balancer は、レートまたは接続の制限をサポートしていません。https://docs.microsoft.com/ja-jp/azure/architecture/guide/technology-choices/load-balancing-overview",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "load-balancers",
        "app-service"
      ]
    },
    {
      "id": 89,
      "question": "Azure Web アプリの複数のインスタンスを複数の Azure リージョンにデプロイすることを計画しています。 アプリのアクセス ソリューションを設計する必要があります。ソリューションは次のレプリケーション要件を満たしている必要があります。 解決策: Azure Application Gateway を使用して、アプリへのアクセスを提供します。 これは目標を達成していますか。・ レート制限をサポートする。・ すべてのインスタンス間でリクエストのバランスをとる。・ 地域的に停電が発生した場合でも、ユーザーがアプリにアクセスできるようにする。",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Application Gateway は、レートまたは接続の制限をサポートしていません。Azure Front Door は要件を満たします。 Azure Front Door の Azure Web アプリケーション ファイアウォール (WAF) レート制限ルールは、1 分間にクライアントから許可される要求の数を制御します。https://learn.microsoft.com/ja-jp/azure/application-gateway/overviewhttps://learn.microsoft.com/ja-jp/azure/web-application-firewall/afds/waf-front-door-rate-limit-configure?pivots=portal",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "load-balancers",
        "app-service",
        "network-security"
      ]
    },
    {
      "id": 90,
      "question": "App1 という名前の Web アプリをオンプレミスのデータセンターから Azure に移動する予定です。 App1 は、ホスト サーバーにインストールされているカスタム COM コンポーネントに依存します。 Azure で App1 をホストするソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。・ Azure データセンターが利用できなくなった場合、ユーザーは App1 を利用できる必要がある。・ コストは最小限に抑える必要がある。",
      "choices": [
        "2 つの Azure リージョンに、ロード バランサーと仮想マシン スケール セットをデプロイする。",
        "2 つの Azure リージョンに、Azure Traffic Manager プロファイルと Web Appをデプロイする。",
        "2 つの Azure リージョンに、ロード バランサーと Web Appをデプロイする。",
        "ロード バランサーと仮想マシン スケール セットを 2 つの可用性ゾーンにデプロイする。"
      ],
      "answer": 3,
      "explanation": "Azure App Service では COM コンポーネントが許可されないため、仮想マシンを使用する必要があります。Azure データセンターの障害から保護するには 2 つの可用性ゾーンが必要です。Web Appは使用できません。Azure App Service では、プラットフォーム上で COM コンポーネントを登録することはできません。 アプリで COM コンポーネントを使用する場合は、それらのコンポーネントをマネージド コードで書き換えて、サイトまたはアプリケーショントと共にデプロイする必要があります。https://learn.microsoft.com/ja-jp/dotnet/azure/migration/app-service#com-and-com-components",
      "category": "",
      "tags": [
        "availability-zones",
        "load-balancers",
        "virtual-machines",
        "app-service"
      ]
    }
  ]
};
