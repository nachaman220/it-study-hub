var QUIZ_DATA_website_131_140 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 131,
      "question": "Application1 と Application2 という 2 つのアプリケーションに対して Azure ストレージ アカウント構成を推奨する必要があります。構成は次の要件を満たす必要があります。 このとき、何を勧めるべきですか。 Application1:・ Application1 のストレージは、可能な限り高いトランザクション レートと可能な限り低い遅延を提供する必要がある。・ Application2 のストレージは、GB あたりのストレージ コストを可能な限り低くする必要がある。・ データセンターに障害が発生した場合でも、両方のアプリケーションのストレージが利用可能でなければならない。・ 両方のアプリケーションのストレージは、アップロードとダウンロード用に最適化する必要がある。",
      "choices": [
        "Premium パフォーマンスとローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v1",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス地理冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、ローカル冗長ストレージ (LRS) レプリケーションを備えた汎用 v2",
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ"
      ],
      "answer": 3,
      "explanation": "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージApplication1 は、高いトランザクション レートと可能な限り低い遅延を必要とします。 Standard ではなく、Premium を使用する必要があります。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals"
      ]
    },
    {
      "id": 132,
      "question": "Application1 と Application2 という 2 つのアプリケーションに対して Azure ストレージ アカウント構成を推奨する必要があります。構成は次の要件を満たす必要があります。 このとき、何を勧めるべきですか。 Application2:・ Application1 のストレージは、可能な限り高いトランザクション レートと可能な限り低い遅延を提供する必要がある。・ Application2 のストレージは、GB あたりのストレージ コストを可能な限り低くする必要がある。・ データセンターに障害が発生した場合でも、両方のアプリケーションのストレージが利用可能でなければならない。・ 両方のアプリケーションのストレージは、アップロードとダウンロード用に最適化する必要がある。",
      "choices": [
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス geo 冗長ストレージ (RA-GRS) レプリケーションを備えた BLOB ストレージ",
        "Standard パフォーマンス、ホット アクセス層、読み取りアクセス geo 冗長ソストレージ (RA-GRS) レプリケーションを備えた BLOBストレージ",
        "Standard パフォーマンス、クール アクセス層、読み取りアクセス geo 冗長ストレージ (RA-GRS) レプリケーションを備えた汎用 v2",
        "Premium パフォーマンスとゾーン冗長ストレージ (ZRS) レプリケーションを備えた ブロックBLOB ストレージ"
      ],
      "answer": 2,
      "explanation": "Standard パフォーマンスの汎用 v2、..汎用 v2 ストレージ アカウントは、最新の Azure Storage の機能をサポートし、汎用 v1 と BLOB ストレージ アカウントのすべての機能が組み込まれています。 ほとんどのストレージ シナリオに汎用 v2 アカウントをお勧めします。 汎用 v2 アカウントは、業界内の他社に引けを取らないトランザクション料金で、Azure Storage に対してギガバイトあたり容量の最低価格を提供しています。 汎用 v2 アカウントでは、ホットまたはクールの既定のアカウント アクセス層と、ホット、クール、またはアーカイブ間の BLOB レベル階層がサポートされます。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-upgrade",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals"
      ]
    },
    {
      "id": 133,
      "question": "ファイル共有をホストする Azure ストレージ アカウントを作成する予定です。共有には、トランザクション集中型のオンプレミス アプリケーションからアクセスします。 ファイル共有にアクセスする際の遅延を最小限に抑えるソリューションを推奨する必要があります。ソリューションは、選択したストレージ層に最高レベルの復元力を提供する必要があります。 推奨事項には何を含めるべきですか。 ストレージ層:",
      "choices": [
        "Premium",
        "ホット",
        "トランザクション 最適化"
      ],
      "answer": 0,
      "explanation": "Premium:Premium ファイル共有は、ソリッド ステート ドライブ (SSD) によってサポートされており、IO 集中型ワークロードで一貫した優れたパフォーマンスと待機時間 (ほとんどの IO 操作で 1 桁のミリ秒以内の低待機時間) を提供します。 Premium ファイル共有は、データベース、Web サイトのホスティング、開発環境など、幅広い種類のワークロードに適しています。 Premium ファイル共有は、サーバー メッセージ ブロック (SMB) プロトコルとネットワーク ファイル システム (NFS) プロトコルの両方で使用できます。 トランザクション最適化:トランザクション最適化ファイル共有は、Premium ファイル共有が提供する待機時間を必要としない、トランザクション負荷の高いワークロードを可能にします。 トランザクション最適化ファイル共有は、ハード ディスク ドライブ (HDD) によってサポートされている標準ストレージ ハードウェアで提供されます。 トランザクション最適化は、従来は \"Standard\" と呼ばれていましたが、これはサービス レベル自体ではなく、ストレージ メディアの種類を指しています (ホットおよびクールも、標準ストレージ ハードウェア上にあるため、\"Standard\" サービス レベルです)。 Hot:ホット ファイル共有は、チーム共有などの汎用ファイル共有シナリオに最適化されたストレージを提供します。 ホット ファイル共有は、HDD によってサポートされている標準ストレージ ハードウェアで提供されます。 Cool:クール ファイル共有は、オンライン アーカイブ ストレージのシナリオ向けに最適化された、コスト効率に優れたストレージを提供します。 クール ファイル共有は、HDD によってサポートされている標準ストレージ ハードウェアで提供されます。https://docs.microsoft.com/ja-jp/azure/storage/files/storage-files-planning",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 134,
      "question": "ファイル共有をホストする Azure ストレージ アカウントを作成する予定です。共有には、トランザクション集中型のオンプレミス アプリケーションからアクセスします。 ファイル共有にアクセスする際の遅延を最小限に抑えるソリューションを推奨する必要があります。ソリューションは、選択したストレージ層に最高レベルの復元力を提供する必要があります。 推奨事項には何を含めるべきですか。 冗長性:",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 2,
      "explanation": "ローカル冗長ストレージ (LRS) : LRS では、すべてのファイルが Azure ストレージ クラスター内に 3 回保存されます。 これにより、不良ディスク ドライブなどのハードウェア障害によるデータ損失を防ぐことができます。 ただし、データ センター内で火災や洪水などの災害が発生した場合は、LRS を使用しているストレージ アカウントのすべてのレプリカが失われたり、回復不能になったりする可能性があります。ゾーン冗長ストレージ (ZRS): ZRS では、各ファイルのコピーが 3 つ格納されます。 ただし、これらのコピーは物理的に異なる Azure 可用性ゾーン にある 3 つの異なるストレージ クラスターに分離されます。 可用性ゾーンは、Azure リージョン内の一意の物理的な場所です。 それぞれのゾーンは、独立した電源、冷却手段、ネットワークを備えた 1 つまたは複数のデータ センターで構成されています。 3 つの可用性ゾーンすべてのストレージ クラスターに書き込まれるまで、ストレージに書き込むことはできません。Geo 冗長ストレージ (GRS): GRS では、プライマリ リージョンとセカンダリ リージョンの 2 つのリージョンがあります。 ファイルは、プライマリ リージョンの Azure ストレージ クラスター内に 3 回保存されます。 書き込みは、Microsoft によって定義されたセカンダリ リージョンに非同期的にレプリケートされます。 GRS では、データの 6 つのコピーが 2 つの Azure リージョン間で分散して作成されます。 自然災害や他の同様の事象により Azure リージョンが完全に失われる場合など、重大な災害が発生した場合は、Microsoft によってフェールオーバーが実行されます。 この場合は、セカンダリがプライマリになり、すべての操作が行われます。 プライマリ リージョンとセカンダリ リージョンの間のレプリケーションは非同期であるため、重大な災害が発生した場合、セカンダリ リージョンにまだレプリケートされていないデータは失われます。 geo 冗長ストレージ アカウントのフェールオーバーは、手動で実行することもできます。https://docs.microsoft.com/ja-jp/azure/storage/files/storage-files-planning",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-storage",
        "bcdr-fundamentals",
        "availability-zones",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 135,
      "question": "10 個のオンプレミス SQL Server データベースを宛先として使用するように構成された 100 個の Microsoft SQL Server Integration Services (SSIS) パッケージがあります。 10 個のオンプレミス データベースを Azure SQL Database に移行することを計画しています。 Azure-SQL Server Integration Services (SSIS) パッケージを作成するためのソリューションを推奨する必要があります。ソリューションでは、パッケージが以下をターゲットにできることを保証する必要があります。 SQL Database インスタンスを宛先として使用します。 推奨事項には何を含めるべきですか。",
      "choices": [
        "SQL Server Migration Assistant (SSMA)",
        "Data Migration Assistant (DMA)",
        "Azure Data Catalog",
        "Azure Data Factory"
      ],
      "answer": 3,
      "explanation": "データベース ワークロードをオンプレミスの SQL Server から Azure データベース サービス (つまり Azure SQL Database または Azure SQL Database Managed Instance) に移行する場合、主要な付加価値サービスの 1 つとして SQL Server Integration Services (SSIS) の ETL ワークロードも同様に移行する必要があります。 Azure Data Factory (ADF) またはシナプス パイプラインの Azure-SSIS Integration Runtime (IR) では、SSIS パッケージの実行をサポートしています。 Azure-SSIS IR がプロビジョニングされると、SQL Server Data Tools (SSDT)/SQL Server Management Studio (SSMS) などの使い慣れたツールや dtinstall/dtutil/dtexec などのコマンドライン ユーティリティを使用して、Azure でパッケージをデプロイして実行できます。 https://learn.microsoft.com/ja-jp/azure/data-factory/scenario-ssis-migration-overview",
      "category": "",
      "tags": [
        "sql-database",
        "data-analytics",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 136,
      "question": "あなたは、複数の Azure クラウド サービスを含み、トランザクションのさまざまなコンポーネントを処理する販売アプリケーションを開発しています。さまざまなクラウド サービスが顧客の注文、請求、支払い、在庫、発送を処理します。 XML メッセージを使用してクラウド サービスがトランザクション情報を非同期に通信できるようにするソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。",
      "choices": [
        "Azure Data Lake",
        "Azure Service Fabric",
        "Azure Traffic Manager",
        "Azure Service Bus"
      ],
      "answer": 3,
      "explanation": "Azure Service Bus は、メッセージ キューとパブリッシュとサブスクライブ トピックを (名前空間内に) 備えたフル マネージド エンタープライズ統合メッセージ ブローカーです。 Service Bus は、アプリケーションとサービスを相互に分離するために使用され、次のような利点があります。 競合する worker 間での作業の負荷分散 サービスやアプリケーションの境界を越えたデータと制御の安全なルーティングおよび転送 高い信頼性を必要とするトランザクション作業の調整 https://learn.microsoft.com/ja-jp/azure/service-bus-messaging/service-bus-messaging-overview",
      "category": "",
      "tags": [
        "entra-connect",
        "data-analytics",
        "load-balancers",
        "containers",
        "messaging"
      ]
    },
    {
      "id": 137,
      "question": "米国西部 Azure リージョンに KeyVault1 という名前の Azure Key Vault を使用する Azure Web アプリがあります。 あなたは、KeyVault1 の災害復旧計画を設計しています。 KeyVault1 にキーをバックアップする予定です。 バックアップをどこに復元できるかを特定する必要があります。 次のうちどれを選択する必要がありますか。",
      "choices": [
        "同じリージョンのみ",
        "KeyVault1のみ",
        "世界中全てのリージョン",
        "同じ地域のみ"
      ],
      "answer": 3,
      "explanation": "キー コンテナー オブジェクト (シークレット、キー、証明書など) をバックアップすると、そのオブジェクトは、バックアップ操作によって、暗号化された BLOB としてダウンロードされます。 Azure の外部でこの BLOB の暗号化を解除することはできません。 この BLOB から有効なデータを取得するには、同じ Azure サブスクリプションと Azure 地域内のキー コンテナーに BLOB を復元する必要があります。https://learn.microsoft.com/ja-jp/azure/key-vault/general/backup?tabs=azure-cli",
      "category": "",
      "tags": [
        "subscription-design",
        "key-vault",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "app-service",
        "containers"
      ]
    },
    {
      "id": 138,
      "question": "複数の Azure リージョンにわたって複数のインスタンスを持つ Azure App Service Web アプリをデプロイすることを計画しています。 計画された展開に対して負荷分散サービスを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 推奨事項には何を含めるべきですか。・ 地域的な停電が発生した場合でも、アプリへのアクセスを維持する。・ Azure Web アプリケーション ファイアウォール (WAF) をサポートする。・ Cookie ベースのアフィニティをサポートする。・ URL ルーティングをサポートする。",
      "choices": [
        "Azure Front Door",
        "Azure Load Balancer",
        "Azure Traffic Manager",
        "Azure Application Gateway"
      ],
      "answer": 0,
      "explanation": "Azure Application Gateway はリージョン内のトラフィックを分散するリージョン サービスであるのに対し、Azure Front Door はリージョン間でトラフィックを分散するグローバル サービスです。Azure Application Gateway と Azure Front Door は両方ともほとんどの要件を満たしていますが、重要な要件はクロスリージョンのサポートです。https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-faq#what-is-the-difference-between-azure-front-door-and-azure-application-gateway",
      "category": "",
      "tags": [
        "load-balancers",
        "app-service",
        "network-security"
      ]
    },
    {
      "id": 139,
      "question": "DB1 という名前の Azure SQL データベースに接続する、Webapp1 という名前の Azure App Service Web アプリがあります。 Webapp1 と DB1 は米国東部の Azure リージョンにデプロイされます。 Webapp1 と DB1 間のすべてのトラフィックがプライベート接続経由で送信されるようにする必要があります。 あなたは何をするべきですか。 少なくとも[選択肢]のサブネットを含む仮想ネットワークを作成します。",
      "choices": [
        "1",
        "2",
        "3"
      ],
      "answer": 1,
      "explanation": "少なくとも 2 つのサブネットを含む仮想ネットワークを作成する必要があります。 1 つは Azure App Service VNet 統合用で、もう 1 つは Azure Private Link 用です。仮想ネットワーク統合は、専用サブネットに依存します。 サブネットを作成すると、Azure サブネットは先頭から 5 つの IP を使います。 App Service プラン インスタンスごとに、統合サブネットから 1 つのアドレスが使用されます。 アプリを 4 つのインスタンスにスケールする場合は、4 つのアドレスが使用されます。https://learn.microsoft.com/ja-jp/azure/app-service/overview-vnet-integration#subnet-requirements",
      "category": "",
      "tags": [
        "sql-database",
        "app-service",
        "vnet",
        "private-link"
      ]
    },
    {
      "id": 140,
      "question": "DB1 という名前の Azure SQL データベースに接続する、Webapp1 という名前の Azure App Service Web アプリがあります。 Webapp1 と DB1 は米国東部の Azure リージョンにデプロイされます。 Webapp1 と DB1 間のすべてのトラフィックがプライベート接続経由で送信されるようにする必要があります。 あなたは何をするべきですか。 仮想ネットワークから、[選択肢]を使用する名前解決を構成します。",
      "choices": [
        "Azure DNS Private Resolver",
        "プライベートDNSゾーン",
        "パブリックDNSゾーン"
      ],
      "answer": 1,
      "explanation": "プライベート DNS ゾーンを使用するように名前解決を構成します。これは、Web Apps が Azure DNS プライベート ゾーンと連携するために必要です。",
      "category": "",
      "tags": [
        "sql-database",
        "app-service",
        "vnet"
      ]
    }
  ]
};
