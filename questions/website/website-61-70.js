var QUIZ_DATA_website_61_70 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 61,
      "question": "あなたは、5 つの Azure Kubernetes Service (AKS) クラスターでホストされるコンテナー化された Web アプリをデプロイすることを計画しています。各クラスターは異なる Azure リージョンでホストされます。 インターネットからアプリへのアクセスを提供する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 グローバル負荷分散:・ 受信 HTTPS 要求は、ネットワーク遅延が最も短いクラスターにルーティングされる必要がある。・ 個々の Pod への HTTPS トラフィックは、イングレス コントローラー経由でルーティングされる必要がある。・ AKS クラスターが停止した場合、フェールオーバー時間を最小限に抑える必要がある。",
      "choices": [
        "Azure Traffic Manager",
        "Standard Load Balancer",
        "Azure Front Door",
        "Azure のリージョン間 (グローバル) ロード バランサー"
      ],
      "answer": 2,
      "explanation": "Azure Front Door と Traffic Manager はどちらもグローバル ロード バランサーです。ただし、Azure Front Door の推奨トラフィックは HTTP(S) であり、Traffic Manager の推奨トラフィックは非 HTTP(S) です。https://learn.microsoft.com/ja-jp/azure/architecture/guide/technology-choices/load-balancing-overview",
      "category": "",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers",
        "app-service",
        "containers"
      ]
    },
    {
      "id": 62,
      "question": "あなたは、5 つの Azure Kubernetes Service (AKS) クラスターでホストされるコンテナー化された Web アプリをデプロイすることを計画しています。各クラスターは異なる Azure リージョンでホストされます。 インターネットからアプリへのアクセスを提供する必要があります。ソリューションは次の要件を満たす必要があります。 ソリューションには何を含めるべきでしょうか。 イングレスコントローラー:・ 受信 HTTPS 要求は、ネットワーク遅延が最も短いクラスターにルーティングされる必要がある。・ 個々の Pod への HTTPS トラフィックは、イングレス コントローラー経由でルーティングされる必要がある。・ AKS クラスターが停止した場合、フェールオーバー時間を最小限に抑える必要がある。",
      "choices": [
        "Azure Application Gateway",
        "Basic Azure Load Balancer",
        "Azure Standard Load Balancer"
      ],
      "answer": 0,
      "explanation": "Application Gateway イングレス コントローラー (AGIC) は Kubernetes アプリケーションであり、これにより、Azure Kubernetes Service (AKS) のお客様が、Azure のネイティブ Application Gateway L7 ロード バランサーを活用してクラウド ソフトウェアをインターネットに公開できるようにします。 AGIC では、ホストされている Kubernetes クラスターを監視し、Application Gateway を継続的に更新して、選択されたサービスがインターネットに公開されるようにします。 イングレス コントローラーは、お客様の AKS の独自のポッドで実行されます。 AGIC では、Kubernetes リソースのサブセットに変更がないかを監視します。 AKS クラスターの状態は Application Gateway の特定の構成に変換され、Azure Resource Manager (ARM) に適用されます。AGIC を使用すると、AKS クラスターの前に別のロード バランサー/パブリック IP アドレスを設定する必要がなくなり、要求が AKS クラスターに到達する前にデータパス内の複数のホップを回避できます。https://learn.microsoft.com/ja-jp/azure/application-gateway/ingress-controller-overview",
      "category": "",
      "tags": [
        "azure-monitor",
        "site-recovery",
        "storage-redundancy",
        "load-balancers",
        "app-service",
        "containers"
      ]
    },
    {
      "id": 63,
      "question": "あなたの会社には、次の表に示すインフラストラクチャがあります。 オンプレミスの Active Directory ドメインは、Microsoft Entra ID と同期します。 Server1 は、LDAP クエリを使用してオンプレミスの Active Directory ドメイン内のユーザー ID を確認する App1 という名前のアプリケーションを実行します。 Server1 を Subscription1 の仮想マシンに移行する予定です。 会社のセキュリティ ポリシーでは、Subscription1 にデプロイされた仮想マシンとサービスがオンプレミス ネットワークにアクセスできないようにする必要があると規定されています。 移行後も App1 が機能し続けることを保証するソリューションを推奨する必要があります。ソリューションはセキュリティ ポリシーを満たしている必要があります。 推奨事項には何を含めるべきですか。ロケーション | リソース--------------------------------Azure | ①Subscription1 という名前の Azure サブスクリプション ②20 個の Azure Web アプリオンプレミス データセンター | ①Active Directory ドメイン ②Microsoft Entra Connec を実行しているサーバー ③Server1 という名前の Linux コンピューター",
      "choices": [
        "Microsoft Entra Domain Services",
        "Azure VPN gateway",
        "仮想マシン上の Active Directory Domain Services ロール",
        "Microsoft Entra アプリケーション プロキシ"
      ],
      "answer": 0,
      "explanation": "Microsoft Entra Domain Services には、ドメイン参加、グループ ポリシー、Lightweight Directory Access Protocol (LDAP)、Kerberos および NTLM 認証などのマネージド ドメイン サービスが用意されています。 クラウドでドメイン コントローラー (DC) のデプロイ、管理、修正プログラムの適用を行わなくても、これらのドメイン サービスを使用することができます。https://learn.microsoft.com/ja-jp/entra/identity/domain-services/overview",
      "category": "",
      "tags": [
        "entra-family",
        "entra-id",
        "entra-connect",
        "rbac",
        "subscription-design",
        "virtual-machines",
        "app-service",
        "data-migration"
      ]
    },
    {
      "id": 64,
      "question": "あなたは、50,000 台の IoT デバイスを含む Azure IoT Hub ソリューションを計画しています。 各デバイスは、温度、デバイス ID、時間データなどのデータをストリーミングします。毎秒約 50,000 レコードが書き込まれます。データはほぼリアルタイムで視覚化されます。 データを保存およびクエリするためのサービスを推奨する必要があります。 このとき、利用すべきサービスを 2 つ答えてください。",
      "choices": [
        "NoSQL 用 Azure Cosmos DB",
        "Azure Table Storage",
        "Azure Event Grid",
        "Azure Time Series Insights"
      ],
      "answer": 3,
      "explanation": "Azure Cosmos DB for NoSQL は、低待機時間と高スループットで大量のデータを処理できる、グローバルに分散されたマルチモデル データベース サービスです。さまざまな整合性レベルとパーティショニング戦略をサポートしているため、大規模な IoT データの処理に適しています。Azure Time Series Insights は、IoT デバイスによって生成された時系列データ向けに特別に設計された、フルマネージドのリアルタイム分析サービスです。時系列データのストレージ、視覚化、高度なクエリ機能を提供するため、多数の IoT デバイスからのデータを処理し、ほぼリアルタイムで視覚化するのに理想的な選択肢となります。https://learn.microsoft.com/ja-jp/azure/architecture/solution-ideas/articles/iot-using-cosmos-db",
      "category": "",
      "tags": [
        "data-fundamentals",
        "cosmosdb",
        "cosmosdb-params",
        "event-driven"
      ]
    },
    {
      "id": 65,
      "question": "あなたは、ユーザー向けのコンテンツを集約するアプリケーションを設計しています。 アプリケーションにデータベース ソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。・ SQL コマンドをサポートする。・ マルチマスター書き込みをサポートする。・ 低遅延の読み取り操作を保証する。",
      "choices": [
        "Azure SQL データベース ハイパースケール",
        "アクティブ geo レプリケーションを使用する Azure SQL データベース",
        "PostgreSQL 用 Azure Cosmos DB",
        "NoSQL 用 Azure Cosmos DB"
      ],
      "answer": 3,
      "explanation": "Azure Cosmos DB は、SQL コマンド、マルチマスター書き込みをサポートし、低待機時間の読み取り操作を保証する、グローバルに分散されたマルチモデル データベース サービスです。ドキュメント、キーと値、グラフ、列ファミリーなどのさまざまな NoSQL データ モデルをサポートします。 Azure Cosmos DB は、複数の Azure リージョン間でデータをレプリケートおよび同期することにより、自動かつ即時のスケーラビリティ、高可用性、低待機時間をグローバルに提供します。 一方、Azure SQL Database と Azure SQL Database Hyperscale は、マルチマスター書き込みをネイティブにサポートしていない従来のリレーショナル データベース サービスです。",
      "category": "",
      "tags": [
        "entra-connect",
        "data-fundamentals",
        "sql-database",
        "cosmosdb",
        "bcdr-fundamentals",
        "sql-ha"
      ]
    },
    {
      "id": 66,
      "question": "あなたは、複数の場所にデプロイされ、Standard レベルの Azure Databricks ワークスペースを使用する販売時点管理 (POS) ソリューションを設計しています。このソリューションには、各場所のオンプレミス ネットワークにデプロイされた複数のアプリが含まれます。 アプリがワークスペースにアクセスするために使用する認証方法を構成する必要があります。このソリューションでは、スタッフの離職と資格情報の管理に関連する管理労力を最小限に抑える必要があります。 何を設定すればよいでしょうか。",
      "choices": [
        "個人のアクセストークン",
        "サービスプリンシパル",
        "管理されたアイデンティティ"
      ],
      "answer": 1,
      "explanation": "マネージド ID は Azure リソースの認証を提供できますが、オンプレミス リソースの認証は提供できません。オンプレミス ネットワークの場合は、通常、認証にサービス プリンシパルまたは個人アクセス トークンを使用します。https://learn.microsoft.com/ja-jp/azure/databricks/administration-guide/users-groups/#identity-model",
      "category": "",
      "tags": [
        "log-analytics",
        "app-registration",
        "managed-identity",
        "data-analytics"
      ]
    },
    {
      "id": 67,
      "question": "App1 という名前のオンプレミス アプリがあります。 お客様は App1 を使用してデジタル画像を管理します。 App1 を Azure に移行する予定です。 App1 用のデータ ストレージ ソリューションを推奨する必要があります。ソリューションは、※1の画像ストレージ要件を満たしている必要があります。 ソリューションは、※2の顧客アカウント要件を満たす必要があります。 データの種類ごとにどのサービスを推奨事項に含めるべきですか。 画像ストレージ:※1・ 保存中のイメージを暗号化する。・ 最大 50 MB のファイルを許可する。・ Azure Front Door 上の Azure Web アプリケーション ファイアウォール (WAF) を使用して、イメージへのアクセスを管理する。※2・ ストレージの自動スケールアウトをサポートする。・ データセンターに障害が発生した場合でも、App1 の可用性を維持する。・ 複数の Azure リージョンからのデータの読み取りと書き込みをサポートする。",
      "choices": [
        "Azure Table Storage",
        "Azure Blob Storage",
        "Azure SQL Database",
        "Azure Cosmos DB"
      ],
      "answer": 1,
      "explanation": "WAF 経由でアクセスできるという要件により、Blob Storage へのオプションが制限されます。Azure Blob Storage は、保存時の暗号化をサポートし、大きなファイル サイズ (最大 50 MB 以上) を処理し、Azure Front Door 上の Azure Web アプリケーション ファイアウォール (WAF) と組み合わせて使用できるため、デジタル イメージの保存に適しています。https://learn.microsoft.com/ja-jp/azure/frontdoor/scenario-storage-blobs",
      "category": "",
      "tags": [
        "blob-storage",
        "sql-database",
        "cosmosdb",
        "load-balancers",
        "app-service",
        "network-security",
        "data-migration"
      ]
    },
    {
      "id": 68,
      "question": "App1 という名前のオンプレミス アプリがあります。 お客様は App1 を使用してデジタル画像を管理します。 App1 を Azure に移行する予定です。 App1 用のデータ ストレージ ソリューションを推奨する必要があります。ソリューションは、※1の画像ストレージ要件を満たしている必要があります。 ソリューションは、※2の顧客アカウント要件を満たす必要があります。 データの種類ごとにどのサービスを推奨事項に含めるべきですか。 顧客アカウント:※1・ 保存中のイメージを暗号化する。・ 最大 50 MB のファイルを許可する。・ Azure Front Door 上の Azure Web アプリケーション ファイアウォール (WAF) を使用して、イメージへのアクセスを管理する。※2・ ストレージの自動スケールアウトをサポートする。・ データセンターに障害が発生した場合でも、App1 の可用性を維持する。・ 複数の Azure リージョンからのデータの読み取りと書き込みをサポートする。",
      "choices": [
        "Azure SQL Database",
        "Azure Cosmos DB",
        "Azure Blob Storage",
        "Azure Table Storage"
      ],
      "answer": 1,
      "explanation": "複数のリージョンからの同時書き込みには、唯一 Azure Cosmos DB が対応しています。Azure Cosmos DB は、自動スケールアウトをサポートし、データセンターに障害が発生した場合でも高可用性を確保し、複数の Azure リージョンからのデータの読み取りと書き込みを可能にする、スケーラビリティの高い、グローバルに分散されたマルチモデル データベース サービスです。https://learn.microsoft.com/ja-jp/azure/cosmos-db/introduction#guaranteed-speed-at-any-scale",
      "category": "",
      "tags": [
        "blob-storage",
        "sql-database",
        "cosmosdb",
        "load-balancers",
        "app-service",
        "network-security",
        "data-migration"
      ]
    },
    {
      "id": 69,
      "question": "Azure 仮想マシン上に SQL Server があります。データベースはバッチ プロセスの一部として毎晩書き込まれます。 データの災害復旧ソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。・ 地域的な停止が発生した場合に回復する機能を提供する。・ 15 分の目標復旧時間 (RTO) をサポートする。・ 24 時間の目標復旧時点 (RPO) をサポートする。・ 自動リカバリをサポートする。・ コストを最小限に抑える。",
      "choices": [
        "Azure Virtual Machines 可用性セット",
        "Always On 可用性グループ",
        "Azure Site Recovery",
        "Azure ディスク バックアップ"
      ],
      "answer": 2,
      "explanation": "Azure Site Recovery を使用したレプリケーション・ RTO は通常 15 分未満です。・ アプリケーション整合性では 1 時間、クラッシュ整合性では 5 分です。 より低い RPO を求めている場合は、別の BCDR テクノロジを使用してください。https://learn.microsoft.com/ja-jp/azure/site-recovery/site-recovery-sqlAzure ディスク バックアップは遅すぎます。Always On 可用性グループの場合は、セカンダリ レプリカへのレプリケーションは非同期であるため、ある程度のデータ損失が発生します。",
      "category": "",
      "tags": [
        "entra-connect",
        "bcdr-fundamentals",
        "availability-zones",
        "azure-backup",
        "site-recovery",
        "sql-ha",
        "virtual-machines"
      ]
    },
    {
      "id": 70,
      "question": "あなたは 2 つのコンポーネントを含むアプリを設計しています。コンポーネントは、キューを介してメッセージを送信することによって通信します。 先入れ先出し (FIFO) パターンを使用してメッセージを処理するソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "パーティショニングが有効になっている Service Bus キュー",
        "セッションが有効になっている Service Bus キュー",
        "カスタムメタデータ設定を使用した Storage キュー",
        "保存されたアクセス ポリシーを使用した Storage キュー"
      ],
      "answer": 1,
      "explanation": "Azure Service Bus は、セッションの使用を通じて FIFO パターンをサポートします。セッションは、順序付けられたメッセージのシーケンスです。セッション内のすべてのメッセージは到着順に処理されます。これにより、メッセージがキューに追加された順序で処理されるようになります。Azure Storage キューは先入れ先出し (FIFO) パターンをネイティブにサポートしていません。Azure Service Bus でのパーティション分割は、複数のメッセージ ブローカーとストアに負荷を分散することでパフォーマンスを向上させることができますが、パーティション間で FIFO 順序付けが強制されるわけではありません。 FIFO の順序はパーティション内では維持されますが、パーティション間では維持されません。https://learn.microsoft.com/ja-jp/azure/service-bus-messaging/message-sessions",
      "category": "",
      "tags": [
        "messaging"
      ]
    }
  ]
};
