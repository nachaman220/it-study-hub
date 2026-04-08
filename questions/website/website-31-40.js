var QUIZ_DATA_website_31_40 = {
  "source": "original",
  "questions": [
    {
      "id": 31,
      "question": "Azure Logic Appsからオンプレミス上のSQL Serverへ接続する必要がありますが、VPN接続は存在しません。オンプレミス側で必要となるコンポーネントはどれですか？",
      "choices": [
        "A. Azure AD アプリケーション プロキシ コネクタ",
        "B. オンプレミス データ ゲートウェイ",
        "C. Hybrid Connection Manager (HCM)",
        "D. Web Application Proxy"
      ],
      "answer": 1,
      "explanation": "オンプレミスデータゲートウェイは、Logic AppsなどのAzureサービスとオンプレミスのデータソース（SQL Server等）との間で安全な通信を仲介するブリッジです。VPNなしでもHTTPSとAzure Service Busリレーを介して接続を確立できます。Azure ADアプリケーションプロキシコネクタはWebアプリの公開用であり、DB接続用途とは異なります。HCMはApp Serviceのハイブリッド接続専用で、Logic Appsでは使えません。Web Application ProxyはAD FS関連のサービスです。",
      "category": "data",
      "tags": [
        "entra-id",
        "app-proxy",
        "data-sources",
        "app-service",
        "messaging",
        "api-management"
      ]
    },
    {
      "id": 32,
      "question": "上記と同じシナリオにおいて、Azure側で必要となるコンポーネントはどれですか？",
      "choices": [
        "A. Application Gateway",
        "B. データ ゲートウェイ リソース",
        "C. Azure Event Grid",
        "D. エンタープライズ アプリケーション"
      ],
      "answer": 1,
      "explanation": "Azure側ではデータゲートウェイリソースの作成が必要です。これはオンプレミスにインストール済みのデータゲートウェイとAzureサービス（Logic Apps）を紐づけるためのAzureリソースです。Application GatewayはL7ロードバランサーであり、オンプレミスへの接続には用いません。Event Gridはイベントルーティングのサービスです。エンタープライズアプリケーションはAzure ADにおけるアプリ登録に使われるものです。",
      "category": "data",
      "tags": [
        "entra-id",
        "app-registration",
        "load-balancers",
        "event-driven",
        "api-management",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 33,
      "question": "北ヨーロッパリージョンを優先的に利用し、障害発生時にはフェールオーバーするルーティングを設計する必要があります。利用すべきサービスはどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. Application Gateway",
        "C. Azure Traffic Manager"
      ],
      "answer": 2,
      "explanation": "Azure Traffic ManagerはDNSベースのグローバルトラフィック分散サービスで、複数リージョンにまたがるトラフィックルーティングを実現します。Azure Load BalancerはL4ロードバランサーで、リージョン内分散のみに対応しています。Application GatewayもL7ロードバランサーですが、単一リージョンに限定されたサービスであり、リージョン間フェールオーバーには利用できません。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers"
      ]
    },
    {
      "id": 34,
      "question": "北ヨーロッパを優先リージョンとして設定するため、Traffic Managerで採用すべきルーティング方法はどれですか？",
      "choices": [
        "A. Cookieベースのアフィニティ",
        "B. 加重ルーティング",
        "C. パフォーマンスルーティング",
        "D. 優先順位ルーティング"
      ],
      "answer": 3,
      "explanation": "優先順位ルーティングでは、プライマリエンドポイント（北ヨーロッパ）に最も高い優先度を割り当て、障害時にはセカンダリエンドポイントへ自動フェールオーバーさせることができます。加重ルーティングは重み付けに基づくトラフィック分散で、特定リージョンの優先指定には不向きです。パフォーマンスルーティングはユーザーに最も近いエンドポイントへの誘導ですが、特定リージョン優先の保証はできません。Cookieベースのアフィニティはセッション維持のための機能であり、リージョン優先のルーティングとは関係がありません。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers"
      ]
    },
    {
      "id": 35,
      "question": "Azure Front Doorはレート制限、負荷分散、地域的な障害からの保護をすべて提供できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "はい、Azure Front Doorはこれらすべてを提供します。WAF（Web Application Firewall）ポリシーによるレート制限、グローバルなL7負荷分散、そして複数リージョンのバックエンドへの自動フェールオーバーによる地域障害への保護が可能です。Front Doorはグローバルサービスとして設計されており、これらの機能を一元的に提供します。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers",
        "network-security"
      ]
    },
    {
      "id": 36,
      "question": "容量400GBのデータベースがあり、月に1日だけ利用されます。コストを最小化できるAzure SQLのサービスティアと課金モデルはどれですか？",
      "choices": [
        "A. Business Critical vCoreモデル",
        "B. General Purpose vCoreモデル",
        "C. Basic DTUモデル",
        "D. Standard DTUモデル"
      ],
      "answer": 1,
      "explanation": "General Purpose vCoreモデルではサーバーレスコンピューティングティアが利用可能です。サーバーレスでは未使用時に自動で一時停止し、コンピューティング料金が発生しません（ストレージのみ課金）。月に1日の利用なら大幅なコスト節約が可能です。Business CriticalはGeneral Purposeより高額です。Basic DTUはデータベース容量が最大2GBまでのため、400GBには対応不可です。Standard DTUも250GB上限があり不適合です。",
      "category": "data",
      "tags": [
        "sql-database",
        "azure-functions"
      ]
    },
    {
      "id": 37,
      "question": "Azure Front Doorが備えている機能はどれですか？",
      "choices": [
        "A. IPフィルタリング",
        "B. Azure AD B2C JWT検証",
        "C. OWASP保護"
      ],
      "answer": 2,
      "explanation": "Azure Front DoorはWAF（Web Application Firewall）を統合しており、OWASPコアルールセットによる保護機能を提供します。SQLインジェクションやクロスサイトスクリプティング（XSS）といった代表的なWeb攻撃に対する防御が含まれます。IPフィルタリングもFront Door WAFのカスタムルールで設定可能ですが、この設問ではOWASP保護が最も適切な回答となります。B2C JWT検証はAPI Managementが持つ機能であり、Front Doorには備わっていません。",
      "category": "security",
      "tags": [
        "entra-id",
        "external-users",
        "load-balancers",
        "api-management",
        "network-security"
      ]
    },
    {
      "id": 38,
      "question": "Azure API Managementが備えている機能はどれですか？",
      "choices": [
        "A. IPフィルタリング",
        "B. Azure AD B2C JWT検証",
        "C. OWASP保護"
      ],
      "answer": 1,
      "explanation": "Azure API Managementでは、ポリシーを通じてJWTトークン（Azure AD B2C発行のものを含む）の検証が行えます。validate-jwtポリシーにより、APIアクセス時にトークンの有効性・クレーム・発行者などを確認できます。IPフィルタリングもAPI Managementで実現可能ですが、この設問ではB2C JWT検証が最も特徴的な機能です。OWASP保護はWAF（Front DoorやApplication Gateway）が提供する機能であり、API Managementの標準機能には含まれません。",
      "category": "security",
      "tags": [
        "entra-id",
        "external-users",
        "load-balancers",
        "api-management",
        "network-security"
      ]
    },
    {
      "id": 39,
      "question": "AKSを2つのリージョンに展開しています。SSL終端を含むグローバルなルーティングソリューションとして最適なのはどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. Azure Front Door",
        "C. イングレスコントローラー",
        "D. Azure Traffic Manager"
      ],
      "answer": 1,
      "explanation": "Azure Front Doorは複数リージョンへのグローバルL7ロードバランシングに加え、SSL終端（TLSオフロード）機能を備えています。2リージョンのAKSクラスターに対するトラフィック分散や障害時の自動フェールオーバーが可能です。Azure Load BalancerはL4でリージョン内限定です。イングレスコントローラーはクラスター内の機能であり、リージョン間ルーティングは行えません。Traffic ManagerはDNSベースのルーティングですが、SSL終端機能は持っていません。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers",
        "containers"
      ]
    },
    {
      "id": 40,
      "question": "Azure Database for MySQLでペアリージョンへのフェールオーバーを実現したい場合、どの機能を利用すべきですか？",
      "choices": [
        "A. Premiumファイル共有",
        "B. 読み取りレプリカ",
        "C. ネイティブレプリケーション",
        "D. Geoバックアップ復元"
      ],
      "answer": 1,
      "explanation": "Azure Database for MySQLの読み取りレプリカ機能を使えば、ペアリージョンに非同期レプリカを構成し、障害時にレプリカをスタンドアロンサーバーへ昇格させてフェールオーバーできます。Premiumファイル共有はAzure Filesの機能で、MySQLとは無関係です。ネイティブレプリケーションはマネージドサービスではサポートされない場合があります。Geoバックアップ復元でも復旧は可能ですが、読み取りレプリカの方がRPO（目標復旧時点）を短くでき、フェールオーバー所要時間も短縮されます。",
      "category": "business-continuity",
      "tags": [
        "entra-connect",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "storage-redundancy"
      ]
    }
  ]
};
