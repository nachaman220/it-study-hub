var QUIZ_DATA_website_61_70 = {
  "source": "original",
  "questions": [
    {
      "id": 61,
      "question": "5つの異なるAzureリージョンにデプロイされたAKSクラスターでコンテナ化Webアプリを運用する計画があります。インターネットからのアクセスを提供し、次の要件を満たすグローバル負荷分散ソリューションを選択してください。要件：受信HTTPSリクエストはネットワーク遅延が最小のクラスターへルーティングする／各PodへのHTTPSトラフィックはイングレスコントローラ経由で配信する／AKSクラスター障害時のフェールオーバー時間を最短にする。",
      "choices": [
        "Azure Traffic Manager",
        "Standard Load Balancer",
        "Azure Front Door",
        "Azure のリージョン間 (グローバル) ロード バランサー"
      ],
      "answer": 2,
      "explanation": "Azure Front DoorとTraffic Managerはいずれもグローバルなロードバランサーですが、HTTP(S)トラフィックにはAzure Front Doorが推奨されます。Traffic Managerは非HTTP(S)トラフィック向けとされています。",
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
      "question": "5つの異なるAzureリージョンのAKSクラスターにコンテナ化Webアプリを展開する計画です。インターネットからのアクセスを実現し、次の条件を満たすイングレスコントローラーを選んでください。条件：受信HTTPSリクエストはレイテンシが最も低いクラスターにルーティングする／各PodへのHTTPSはイングレスコントローラ経由で配信する／AKSクラスターの障害時にはフェールオーバーを最短時間で行う。",
      "choices": [
        "Azure Application Gateway",
        "Basic Azure Load Balancer",
        "Azure Standard Load Balancer"
      ],
      "answer": 0,
      "explanation": "Application Gatewayイングレスコントローラー（AGIC）はKubernetesアプリケーションとして動作し、AzureネイティブのApplication Gateway L7ロードバランサーを通じてクラウドサービスをインターネットに公開できます。AGICはKubernetesクラスターを監視し、選択したサービスが公開されるようApplication Gatewayの設定を自動更新します。イングレスコントローラー自体はAKSの独自Podで稼働し、Kubernetesリソースの一部を監視して変更をAzure Resource Manager経由で適用します。AGICの利用により、AKSクラスターの前段に別途ロードバランサーやパブリックIPを設ける必要がなくなり、データパス上のホップ数を削減できます。",
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
      "question": "社内にオンプレミスActive DirectoryドメインがありMicrosoft Entra IDと同期済みです。Server1上でLDAPクエリによりオンプレミスADのユーザーIDを確認するApp1が稼働しています。Server1をSubscription1内のVMへ移行する計画ですが、セキュリティポリシーにより、Subscription1内のVMやサービスからオンプレミスネットワークへのアクセスは禁止されています。移行後もApp1が正常動作しセキュリティポリシーを遵守するために推奨すべきソリューションは何ですか？環境情報：Azure側にはSubscription1と20個のWebアプリ、オンプレミス側にはADドメイン、Entra Connect実行サーバー、LinuxマシンServer1があります。",
      "choices": [
        "Microsoft Entra Domain Services",
        "Azure VPN gateway",
        "仮想マシン上の Active Directory Domain Services ロール",
        "Microsoft Entra アプリケーション プロキシ"
      ],
      "answer": 0,
      "explanation": "Microsoft Entra Domain Servicesはドメイン参加、グループポリシー、LDAP、Kerberos/NTLM認証といったマネージドドメインサービスを提供します。クラウド上でドメインコントローラーをデプロイ・管理・パッチ適用する手間なく、これらのサービスを利用できます。オンプレミスへの接続を必要とせずにLDAP機能が使えるため、セキュリティポリシーにも適合します。",
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
      "question": "50,000台のIoTデバイスを含むAzure IoT Hubソリューションを構築予定です。各デバイスは温度、デバイスID、タイムスタンプなどのデータをストリーミングし、毎秒約50,000レコードが書き込まれます。データのほぼリアルタイム可視化が必要です。データの格納およびクエリに適したサービスを2つ選択してください。",
      "choices": [
        "NoSQL 用 Azure Cosmos DB",
        "Azure Table Storage",
        "Azure Event Grid",
        "Azure Time Series Insights"
      ],
      "answer": 3,
      "explanation": "Azure Cosmos DB for NoSQLは低レイテンシかつ高スループットで大量データを処理可能なグローバル分散マルチモデルデータベースであり、多様な整合性レベルとパーティション戦略により大規模IoTデータの取り扱いに適しています。Azure Time Series Insightsは、IoTデバイスが生成する時系列データに特化したフルマネージドのリアルタイム分析サービスです。時系列データの格納・可視化・高度なクエリ機能を備えており、大量のIoTデバイスデータをほぼリアルタイムで可視化するのに最適です。",
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
      "question": "ユーザー向けコンテンツを集約するアプリケーションの設計において、データベースソリューションの推奨が求められています。要件：SQLコマンドに対応する／マルチマスター書き込みが可能／読み取り操作の低遅延を保証する。どのサービスを推奨すべきですか？",
      "choices": [
        "Azure SQL データベース ハイパースケール",
        "アクティブ geo レプリケーションを使用する Azure SQL データベース",
        "PostgreSQL 用 Azure Cosmos DB",
        "NoSQL 用 Azure Cosmos DB"
      ],
      "answer": 3,
      "explanation": "Azure Cosmos DBはSQLクエリ対応、マルチマスター書き込み、低レイテンシ読み取りを兼ね備えたグローバル分散マルチモデルデータベースです。ドキュメント、キー値、グラフ、列ファミリーなど多種のNoSQLモデルに対応しています。複数Azureリージョンにデータを自動複製・同期することで、即時スケーラビリティ、高可用性、低レイテンシをグローバルに提供します。一方、Azure SQL DatabaseやHyperscaleはリレーショナルDBであり、マルチマスター書き込みのネイティブサポートがありません。",
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
      "question": "複数の拠点に展開するPOS（販売時点情報管理）ソリューションでStandardレベルのAzure Databricksワークスペースを利用しています。各拠点のオンプレミスネットワークにデプロイされたアプリからワークスペースへアクセスするための認証方式を設定する必要があり、スタッフの入退社や資格情報管理に伴う運用負荷を最小化する方針です。何を設定すべきですか？",
      "choices": [
        "個人のアクセストークン",
        "サービスプリンシパル",
        "管理されたアイデンティティ"
      ],
      "answer": 1,
      "explanation": "マネージドIDはAzureリソース間の認証に限られ、オンプレミスリソースからの認証には使えません。オンプレミスネットワーク環境では、認証にサービスプリンシパルまたは個人アクセストークンを用いるのが一般的です。サービスプリンシパルは個人に紐付かないため、人事異動の影響を受けにくく管理負荷が低くなります。",
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
      "question": "オンプレミスで稼働中のデジタル画像管理アプリApp1をAzureへ移行します。画像ストレージについて、次の要件を満たすサービスを選択してください。要件：保存時の画像暗号化／最大50MBのファイルサポート／Azure Front Door上のWAFによるアクセス管理。",
      "choices": [
        "Azure Table Storage",
        "Azure Blob Storage",
        "Azure SQL Database",
        "Azure Cosmos DB"
      ],
      "answer": 1,
      "explanation": "WAFを介したアクセス管理が必要な点がポイントとなり、Azure Blob Storageが適しています。Blob Storageは保存時暗号化に対応し、50MB以上の大きなファイルも扱え、Azure Front Door上のWAFと組み合わせて利用できるため、デジタル画像のストレージとして適切です。",
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
      "question": "オンプレミスのデジタル画像管理アプリApp1をAzureに移行する計画です。顧客アカウントデータのストレージとして、次の要件を満たすサービスはどれですか？要件：ストレージの自動スケールアウト対応／データセンター障害時もApp1の可用性を維持／複数Azureリージョンからの読み書きをサポート。",
      "choices": [
        "Azure SQL Database",
        "Azure Cosmos DB",
        "Azure Blob Storage",
        "Azure Table Storage"
      ],
      "answer": 1,
      "explanation": "複数リージョンからの同時読み書きを実現できるのはAzure Cosmos DBのみです。Cosmos DBは自動スケールアウトに対応し、データセンター障害時にも高い可用性を確保でき、複数Azureリージョン間でのデータ読み書きを可能にするグローバル分散型のマルチモデルデータベースです。",
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
      "question": "Azure VM上のSQL Serverにバッチ処理で毎晩データを書き込むデータベースがあります。この環境に対し、次の条件を満たすディザスタリカバリソリューションを推奨してください。条件：リージョン全体の障害からの復旧が可能／RTO 15分を達成する／RPO 24時間に対応する／自動復旧をサポートする／コストを抑える。",
      "choices": [
        "Azure Virtual Machines 可用性セット",
        "Always On 可用性グループ",
        "Azure Site Recovery",
        "Azure ディスク バックアップ"
      ],
      "answer": 2,
      "explanation": "Azure Site Recoveryによるレプリケーションでは、RTOは通常15分以内です。RPOはアプリケーション整合性で1時間、クラッシュ整合性で5分程度です。より低いRPOが必要な場合は別のBCDRソリューションの検討が必要です。Azureディスクバックアップでは復旧に時間がかかりすぎます。Always On可用性グループはセカンダリレプリカへの非同期レプリケーションによりある程度のデータ損失が生じ得ます。",
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
      "question": "2つのコンポーネントがキューを介してメッセージをやり取りするアプリケーションを設計中です。FIFO（先入れ先出し）方式でメッセージを処理する必要がある場合、どのソリューションが適切ですか？",
      "choices": [
        "パーティショニングが有効になっている Service Bus キュー",
        "セッションが有効になっている Service Bus キュー",
        "カスタムメタデータ設定を使用した Storage キュー",
        "保存されたアクセス ポリシーを使用した Storage キュー"
      ],
      "answer": 1,
      "explanation": "Azure Service Busではセッション機能によりFIFOパターンを実現できます。セッションは順序付けられたメッセージシーケンスで、セッション内の全メッセージは到着順に処理されるため、キュー投入順での処理が保証されます。Azure Storage キューはFIFOをネイティブにサポートしていません。Service Busのパーティション分割は複数ブローカーへの負荷分散でパフォーマンスを向上させますが、パーティション間ではFIFO順序は保証されません。FIFO順序はパーティション内でのみ維持されます。",
      "category": "",
      "tags": [
        "messaging"
      ]
    }
  ]
};
