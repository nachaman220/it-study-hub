var QUIZ_DATA_website_11_20 = {
  "source": "original",
  "questions": [
    {
      "id": 11,
      "question": "SAML SSOの導入に加え、認識されていない場所からのサインイン時にMFA（多要素認証）を適用する必要があります。利用すべき2つのサービスはどれですか？（2つ選択）",
      "choices": [
        "A. エンタープライズ アプリケーション",
        "B. Application Gateway",
        "C. Privileged Identity Management (PIM)",
        "D. 条件付きアクセス",
        "E. Identity Protection"
      ],
      "answer": [
        0,
        3
      ],
      "explanation": "エンタープライズアプリケーションでSAML SSOの構成を行い、条件付きアクセスポリシーによって「認識されていない場所からのサインイン」に対しMFAを求める条件を設定します。エンタープライズアプリケーションはSAML SSO設定の基盤となり、条件付きアクセスは場所条件に基づくMFA要求が可能です。Application GatewayはL7ロードバランサーであり、SSO/MFAの設定用途には該当しません。PIMは特権ロールの管理向けサービスです。Identity Protectionはリスクベースのポリシーを提供しますが、「認識されていない場所」に対する条件設定には条件付きアクセスの方がより直接的です。",
      "category": "identity",
      "tags": [
        "auth-methods",
        "sso",
        "rbac",
        "conditional-access",
        "pim",
        "load-balancers"
      ]
    },
    {
      "id": 12,
      "question": "AKSで利用するコンテナイメージを複数リージョンへ自動的にレプリケートしたい場合、どのサービスを選択すべきですか？",
      "choices": [
        "A. Azure Cache for Redis",
        "B. GRS（Geo冗長ストレージ）",
        "C. Azure CDN",
        "D. Azure Container Registry Premium"
      ],
      "answer": 3,
      "explanation": "Azure Container Registry（ACR）のPremiumティアには、Geoレプリケーション機能があり、コンテナイメージを複数リージョンへ自動で複製できます。各リージョンのAKSクラスターが最寄りのレジストリからイメージを取得でき、デプロイ速度が向上します。Azure Cache for Redisはキャッシングサービスであり、コンテナイメージ管理には使いません。GRSはストレージアカウント向けの冗長化機能で、コンテナレジストリへの直接適用はできません。CDNは静的コンテンツ配信向けであり、コンテナイメージのレプリケーション用途には合いません。",
      "category": "compute",
      "tags": [
        "azure-storage",
        "bcdr-fundamentals",
        "containers",
        "caching"
      ]
    },
    {
      "id": 13,
      "question": "XMLメッセージによる非同期通信を実現する必要があります。適切なサービスはどれですか？",
      "choices": [
        "A. Azure Traffic Manager",
        "B. Azure Notification Hubs",
        "C. Azure Queue Storage",
        "D. Azure Service Fabric"
      ],
      "answer": 2,
      "explanation": "Azure Queue Storageは、大量メッセージの格納に対応するシンプルなキューサービスで、XMLメッセージを用いた非同期通信に最適です。メッセージは最大64KBまで、キュー全体では数百万件の格納が可能です。Traffic ManagerはDNSベースのトラフィック分散サービスで、メッセージングとは異なります。Notification Hubsはプッシュ通知に特化したサービスで、一般的な非同期メッセージ処理向けではありません。Service Fabricはマイクロサービスプラットフォームであり、メッセージキューの機能は持ちません。",
      "category": "compute",
      "tags": [
        "entra-connect",
        "load-balancers",
        "containers",
        "messaging"
      ]
    },
    {
      "id": 14,
      "question": "オンプレミスネットワーク（172.16.0.0/16）と接続するAzure仮想ネットワークのサブネット設計を行っています。30台のVMを収容するSubnet1に適切なアドレス範囲はどれですか？",
      "choices": [
        "A. 192.168.0.0/24",
        "B. 172.16.0.0/16",
        "C. 172.16.1.0/27",
        "D. 192.168.1.0/27"
      ],
      "answer": 0,
      "explanation": "正解は192.168.0.0/24です。オンプレミスが172.16.0.0/16を使っているため、172.16.x.xの範囲は重複するため選べません（選択肢BとCは不可）。30台のVMを配置するにはAzureの各サブネットで予約される5個のIPを加味し、少なくとも35個のIPが必要です。192.168.1.0/27は32個（利用可能27個）しかなく、30台を収容できません。192.168.0.0/24は256個（利用可能251個）のIPを提供し、30台のVMを十分に受け入れられます。",
      "category": "network",
      "tags": [
        "vnet"
      ]
    },
    {
      "id": 15,
      "question": "同一仮想ネットワークのゲートウェイサブネットに割り当てるアドレス範囲として適切なのはどれですか？",
      "choices": [
        "A. 192.168.0.0/24",
        "B. 172.16.0.0/16",
        "C. 172.16.1.0/27",
        "D. 192.168.1.0/27"
      ],
      "answer": 3,
      "explanation": "ゲートウェイサブネットとしては192.168.1.0/27が妥当です。Microsoftはゲートウェイサブネットに/27以上のサイズを推奨しています。172.16.x.xの範囲はオンプレミス（172.16.0.0/16）との重複があるため使えません。192.168.0.0/24はSubnet1として既に利用中のため競合します。192.168.1.0/27は/27サイズ（推奨最小）であり、オンプレミスやSubnet1のいずれとも重複しないため、ゲートウェイサブネットとして適切です。",
      "category": "network",
      "tags": [
        "vnet"
      ]
    },
    {
      "id": 16,
      "question": "複数データベースを持つアプリケーションのAzure移行を検討中です。アプリケーションは「サーバー名.データベース名.テーブル名」の形式でデータにアクセスしています。利用すべきサービスの組み合わせはどれですか？",
      "choices": [
        "A. SQL Server on Azure VM",
        "B. SQL Server Stretch Database",
        "C. Azure SQL Database",
        "D. Azure SQL Managed Instance"
      ],
      "answer": [
        0,
        3
      ],
      "explanation": "「サーバー名.データベース名.テーブル名」という3パート名形式でのアクセスには、SQL Serverインスタンスレベルの機能が不可欠です。Azure SQL Managed Instance（MI）はSQL Serverとほぼ完全な互換性があり、クロスデータベースクエリに対応します。SQL Server on Azure VMもフルインスタンスを提供するため、同形式でのアクセスが可能です。Azure SQL Databaseは単一データベースサービスであり、3パート名によるクロスデータベースクエリをネイティブにはサポートしません。Stretch Databaseはオンプレミスのデータをクラウドへ拡張する機能で、移行シナリオには向いていません。",
      "category": "data",
      "tags": [
        "sql-database",
        "data-migration"
      ]
    },
    {
      "id": 17,
      "question": "AKSとAPI Management Standardを運用しています。MTLS（相互TLS）認証の実装が必要で、かつコストを最小限に抑えたい場合の対応策はどれですか？",
      "choices": [
        "A. ExternalNameサービスを構成する",
        "B. 外部ロードバランサーを使用する",
        "C. イングレスコントローラーを使用する",
        "D. API Managementを再デプロイする"
      ],
      "answer": 2,
      "explanation": "イングレスコントローラー（例：NGINX Ingress Controller）をAKSに導入すれば、MTLS認証を実装できます。コスト最小化の条件も満たせます。API ManagementをPremiumティアに再デプロイすればVNet統合経由でMTLSも実現可能ですが、コストが大きく増加します。ExternalNameサービスは外部DNSへのマッピング機能で、MTLSの認証は提供しません。外部ロードバランサーはL4レベルで動作するため、MTLSの認証機能を備えていません。",
      "category": "network",
      "tags": [
        "load-balancers",
        "containers",
        "api-management",
        "vnet"
      ]
    },
    {
      "id": 18,
      "question": "Azure SQL Managed InstanceにおいてTDE（透過的データ暗号化）を利用する際、暗号化強度を最大にするにはTDEプロテクターのキーサイズとしてどれを選ぶべきですか？",
      "choices": [
        "A. RSA 4096",
        "B. RSA 3072",
        "C. AES 256",
        "D. RSA 2048"
      ],
      "answer": 1,
      "explanation": "Azure SQL Managed InstanceのTDEプロテクター（カスタマーマネージドキー）がサポートする最大キーサイズはRSA 3072ビットです。RSA 4096はAzure SQL MIのTDEプロテクターとしてはサポート対象外です。AES 256はデータ暗号化キー（DEK）に用いられるタイプであり、TDEプロテクターとしてはRSAが使われます。RSA 2048もサポートされますが、暗号化強度の最大化にはRSA 3072が最も適しています。",
      "category": "security",
      "tags": [
        "sql-database",
        "sql-security"
      ]
    },
    {
      "id": 19,
      "question": "Azure Database for MySQLにおいてデータセンター障害への備えが必要です。コストを最も抑えられるサービスティアはどれですか？",
      "choices": [
        "A. メモリ最適化",
        "B. バースト可能（Burstable）",
        "C. 汎用（General Purpose）"
      ],
      "answer": 2,
      "explanation": "汎用（General Purpose）ティアはゾーン冗長高可用性（HA）に対応しており、データセンター障害からの保護が可能です。メモリ最適化ティアもゾーン冗長HAをサポートしていますが、汎用ティアよりコストが高くなります。バースト可能（Burstable）ティアはゾーン冗長HAに非対応のため、データセンター障害への保護を実現できません。コスト最小化を考えると、ゾーン冗長HAをサポートする中で最も安価な汎用ティアが正解です。",
      "category": "data",
      "tags": ["sql-database"]
    },
    {
      "id": 20,
      "question": "Blobストレージ内にある重複ファイルを検知し、管理者へ承認メールを送った上で削除を行うサーバーレスソリューションを構築したいと考えています。どのサービスの組み合わせが適していますか？",
      "choices": [
        "A. Azure Logic Apps + Azure Functions",
        "B. Azure Functions + Azure Batch",
        "C. Azure Pipelines + Service Fabric",
        "D. Azure Logic Apps + Azure Event Grid"
      ],
      "answer": 0,
      "explanation": "Azure Logic Appsでスケジュール実行や承認メールのワークフローをノーコードで組み立て、Azure Functionsで重複ファイルの検出・削除ロジックをカスタムスクリプトとして実行できます。いずれもサーバーレスで提供されるサービスです。Azure Batchはバッチ処理向けですがサーバーレスではありません。Azure PipelinesはCI/CDのツールであり、このユースケースには不向きです。Service Fabricはマイクロサービス基盤でサーバーレスではありません。Event Gridはイベントルーティングを担いますが、承認メールのワークフローには対応しません。",
      "category": "compute",
      "tags": [
        "containers",
        "azure-functions",
        "batch",
        "event-driven",
        "api-management"
      ]
    }
  ]
};
