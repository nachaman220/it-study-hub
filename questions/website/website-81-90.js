var QUIZ_DATA_website_81_90 = {
  "source": "original",
  "questions": [
    {
      "id": 81,
      "question": "従業員の個人識別情報（PII）を格納するAzure Webアプリを構築中です。Azure SQL Databaseソリューションとして、次の要件を満たすサービス階層とコンピューティングレベルの組み合わせを選択してください。要件：単一データセンター障害時の可用性維持／PIIを含む特定列の暗号化対応／給与処理時の自動スケールアップ／コスト最小化。",
      "choices": [
        "Business Critical サービス レベルとサーバーレス コンピューティング レベル",
        "Hyperscale サービス レベルとプロビジョニング済みコンピューティング レベル",
        "General Purpose サービス レベルとサーバーレス コンピューティング レベル"
      ],
      "answer": 2,
      "explanation": "General Purposeサービスレベルは標準的なワークロード向けに設計されており、コストとパフォーマンスのバランスに優れたコンピューティング・ストレージオプションを提供します。サーバーレスコンピューティングレベルはワークロードの負荷に応じてリソースを自動スケーリングし、秒単位の従量課金を行います。General Purposeで一般提供されており、Hyperscaleではプレビュー段階です。",
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
      "question": "従業員のPIIを保存するAzure Webアプリ向けにAzure SQL Databaseを導入します。次の要件を満たす暗号化方式はどれですか？要件：単一データセンター停止時も可用性を維持／PIIを含む特定列の暗号化／給与計算時の自動スケールアップ／コスト最小化。",
      "choices": [
        "透過的なデータ暗号化 (TDE)",
        "Always Encrypted",
        "Microsoft SQLサービスとデータベース暗号化キー"
      ],
      "answer": 1,
      "explanation": "Always Encryptedは、クレジットカード番号や国民ID番号のような機微データの保護を目的とした機能です。クライアント側でデータを暗号化するため、暗号化キーがデータベースエンジンに渡ることはありません。これにより、データを閲覧できるユーザーと、管理するがアクセス権を持たないユーザー（DB管理者やクラウドオペレーターなど）を明確に分離できます。結果として、機密データをクラウドに保管しても内部不正によるデータ漏洩リスクを軽減できます。",
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
      "question": "Microsoft Entraテナントを保有しており、SQL APIを使用するAzure Cosmos DBデータベースをデプロイ予定です。特定のEntra IDユーザーアカウントにCosmos DBの読み取りアクセスを付与するにはどうすべきですか？",
      "choices": [
        "証明書と Azure Key Vault",
        "共有アクセス署名 (SAS) と条件付きアクセス ポリシー",
        "リソース トークンとアクセス制御 (IAM) ロールの割り当て",
        "マスター キーと Azure Information Protection ポリシー"
      ],
      "answer": 2,
      "explanation": "Cosmos DBのSQL APIには、マスターキートークンとリソーストークンの2種類の認可方式があります。マスターキーは全データ・全権限へのフルアクセスを提供します。リソーストークンは特定のコンテナーと権限に限定したアクセスを付与でき、Entra IDユーザーのIDに基づいて生成可能です。Entra IDユーザーにCosmos DBへのアクセスを提供するには、IAMロール割り当てを使います。Azure RBACはResource Manager上に構築された認可システムで、リソースに対するきめ細かいアクセス制御を実現します。リソーストークンとIAMロール割り当てを組み合わせることで、必要な読み取りアクセス制御が得られます。",
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
      "question": "多層アプリApp1とAzure SQL DatabaseのSQL1があります。バックエンドサービスがSQL1にデータを書き込み、ユーザーはApp1クライアントを使ってSQL1からデータを読み取ります。高負荷時にユーザーのデータ取得が遅延する問題が発生しています。データリクエストの応答時間を短縮するには何を導入すべきですか？",
      "choices": [
        "Azure コンテンツ配信ネットワーク (CDN)",
        "Azure Cache for Redis",
        "Azure Synapse Analytics",
        "Azure Data Factory"
      ],
      "answer": 1,
      "explanation": "Azure Cache for RedisはRedisベースのインメモリデータストアです。バックエンドのデータストアに高い負荷がかかるアプリのパフォーマンスとスケーラビリティを向上させます。アクセス頻度の高いデータをサーバーメモリ上に保持し、高速な読み書きを実現することで、大量リクエストを効率的に処理します。極めて低いレイテンシと高スループットのデータストレージをアプリに提供します。CDNはネットワーク最適化であり本件の問題には該当しません。Data Factoryはデータオーケストレーション用ツールです。Synapse Analyticsはデータウェアハウス機能を持つ分析ツールであり、このケースには不適切です。",
      "category": "",
      "tags": [
        "sql-database",
        "data-analytics",
        "caching"
      ]
    },
    {
      "id": 85,
      "question": "Azure Event Gridに配信されるイベントをトリガーにカスタムC#コードを実行するソリューションを設計中です。要件：実行コードからAzure VM上のMicrosoft SQL ServerのプライベートIPアドレスにアクセスできる／コストを最小限にする。どのサービスを選択すべきですか？",
      "choices": [
        "Azure Logic Apps の統合サービス環境 (ISE)",
        "Azure Logic Apps の 従量課金プラン",
        "Azure Functions の 従量課金プラン",
        "Azure Functions の Premium プラン"
      ],
      "answer": 3,
      "explanation": "Azure FunctionsのPremiumプランは仮想ネットワーク統合に対応しており、VNet内のプライベートIPへのアクセスが可能です。従量課金プランでは仮想ネットワーク統合機能を利用できないため、プライベートIPへの到達要件を満たせません。",
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
      "question": "従量課金プランで動作するAzure FunctionsアプリApp1がAzure Queue Storageトリガーを使用しています。App1をAKSクラスターに移行する計画で、現在のスケーリング方式を維持しつつ、kubenetおよびAzure CNIネットワークの両方に対応する必要があります。AKSクラスターの準備として実施すべき2つのアクションはどれですか？",
      "choices": [
        "Kubernetes Event-driven Autoscaling (KEDA をインストールする。",
        "ポッドの水平オートスケーラーを構成する。",
        "AKS クラスター オートスケーラーを構成する。",
        "仮想 Kubelet をインストールする。",
        "仮想ノード アドオンを構成する。"
      ],
      "answer": 1,
      "explanation": "Kubernetesの水平ポッドオートスケーラー（HPA）はリソース需要を監視してPod数を自動調整します。デフォルトでHPAは15秒ごとにメトリックAPIを確認し、必要に応じてレプリカ数を増減させます。HPAはKubernetes 1.8以降のメトリックサーバーがデプロイされたAKSクラスターで動作します。Kubernetes Event-driven Autoscaling（KEDA）はイベント駆動型の自動スケーリングをシンプルにする軽量コンポーネントで、CNCFのGraduatedプロジェクトです。ゼロスケールに対応した持続可能でコスト効率の高いスケーリングを実現します。",
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
      "question": "Azure Webアプリの複数インスタンスを複数リージョンにデプロイする予定です。要件：レート制限に対応する／全インスタンス間でリクエストを均等分散する／リージョン障害時もアプリにアクセス可能にする。Azure Traffic Managerでアクセスを提供する案は要件を満たしますか？",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Traffic ManagerはDNSベースのトラフィックロードバランサーで、グローバルリージョン間でのトラフィック分散と高可用性を提供します。しかしレート制限機能は備えていないため、この要件を満たすことはできません。",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "load-balancers",
        "app-service"
      ]
    },
    {
      "id": 88,
      "question": "複数Azureリージョンに展開したWebアプリの複数インスタンスへのアクセスソリューションを検討中です。要件：レート制限対応／全インスタンスへの負荷分散／リージョン障害時のアクセス継続。Azure Load Balancerを利用する案で目標は達成できますか？",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Load Balancerはリージョン内でのみ負荷分散を行うサービスであり、リージョン障害への対応はできません。さらに、レート制限や接続制限もサポートしていないため、要件を満たしません。",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "load-balancers",
        "app-service"
      ]
    },
    {
      "id": 89,
      "question": "複数Azureリージョンに展開されたWebアプリインスタンスへのアクセスソリューションを設計しています。要件：レート制限をサポート／全インスタンスへのリクエスト分散／リージョン停止時のアクセス継続。Azure Application Gatewayを使う案で目標を達成できますか？",
      "choices": [
        "はい",
        "いいえ"
      ],
      "answer": 1,
      "explanation": "Azure Application Gatewayにはレート制限や接続制限の機能がないため、要件を満たしません。この要件にはAzure Front Doorが適しています。Front DoorのWAFレート制限ルールを使えば、クライアントからの1分あたりのリクエスト数を制御できます。",
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
      "question": "オンプレミスのWebアプリApp1をAzureへ移行する計画です。App1はホストサーバー上にインストールされたカスタムCOMコンポーネントに依存しています。要件：Azureデータセンターが利用不能になった場合でもApp1を継続利用できる／コストを最小化する。どの構成を推奨しますか？",
      "choices": [
        "2 つの Azure リージョンに、ロード バランサーと仮想マシン スケール セットをデプロイする。",
        "2 つの Azure リージョンに、Azure Traffic Manager プロファイルと Web Appをデプロイする。",
        "2 つの Azure リージョンに、ロード バランサーと Web Appをデプロイする。",
        "ロード バランサーと仮想マシン スケール セットを 2 つの可用性ゾーンにデプロイする。"
      ],
      "answer": 3,
      "explanation": "Azure App ServiceではCOMコンポーネントの登録が許可されていないため、仮想マシンを使用する必要があります。Azureデータセンター障害に備えるには2つの可用性ゾーンへのデプロイが必要です。Web Appの選択肢はCOMコンポーネントの制約により使用不可です。App Service上でCOMコンポーネントを利用するには、マネージドコードでの書き換えとアプリへの同梱が必要です。",
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
