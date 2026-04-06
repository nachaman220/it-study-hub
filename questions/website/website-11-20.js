var QUIZ_DATA_website_11_20 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 11,
      "question": "SAML SSOを実装し、不明な場所からのサインインに対してMFA（多要素認証）を要求する必要があります。どの2つのサービスを使用すべきですか？（2つ選択）",
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
      "explanation": "エンタープライズアプリケーションでSAML SSOを構成し、条件付きアクセスポリシーで「不明な場所からのサインイン」に対してMFAを要求する条件を設定します。エンタープライズアプリケーションはSAML SSOの設定に必要であり、条件付きアクセスは場所ベースの条件でMFAを要求できます。Application GatewayはL7ロードバランサーであり、SSO/MFAの設定には使用しません。PIMは特権ロールの管理サービスです。Identity Protectionはリスクベースのポリシーを提供しますが、「不明な場所」という条件には条件付きアクセスの方が直接的に対応できます。",
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
      "question": "AKSで使用するコンテナイメージを複数のリージョンに自動的にレプリケーションする必要があります。どのサービスを使用すべきですか？",
      "choices": [
        "A. Azure Cache for Redis",
        "B. GRS（Geo冗長ストレージ）",
        "C. Azure CDN",
        "D. Azure Container Registry Premium"
      ],
      "answer": 3,
      "explanation": "Azure Container Registry（ACR）Premiumティアは、Geoレプリケーション機能を提供し、コンテナイメージを複数のリージョンに自動的にレプリケートできます。これにより、各リージョンのAKSクラスターが最寄りのレジストリからイメージをプルでき、デプロイの高速化が可能です。Azure Cache for Redisはキャッシュサービスでありコンテナイメージの管理には使用しません。GRSはストレージアカウントの冗長化であり、コンテナレジストリには直接適用できません。CDNは静的コンテンツの配信であり、コンテナイメージのレプリケーションには適していません。",
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
      "question": "XMLメッセージを使用した非同期通信を実装する必要があります。どのサービスを使用すべきですか？",
      "choices": [
        "A. Azure Traffic Manager",
        "B. Azure Notification Hubs",
        "C. Azure Queue Storage",
        "D. Azure Service Fabric"
      ],
      "answer": 2,
      "explanation": "Azure Queue Storageは、大量のメッセージを格納できるシンプルなキューサービスであり、XMLメッセージを含む非同期通信に適しています。メッセージの最大サイズは64KBで、キューには数百万のメッセージを格納できます。Traffic Managerはトラフィック分散のDNSベースのサービスであり、メッセージングには使用しません。Notification Hubsはプッシュ通知サービスであり、一般的な非同期メッセージングには適していません。Service Fabricはマイクロサービスプラットフォームであり、メッセージキューではありません。",
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
      "question": "オンプレミスネットワーク（172.16.0.0/16）と接続するAzure仮想ネットワークのサブネット設計を行います。30台のVMを収容するSubnet1のアドレス範囲として適切なものはどれですか？",
      "choices": [
        "A. 192.168.0.0/24",
        "B. 172.16.0.0/16",
        "C. 172.16.1.0/27",
        "D. 192.168.1.0/27"
      ],
      "answer": 0,
      "explanation": "192.168.0.0/24が正解です。オンプレミスネットワークが172.16.0.0/16を使用しているため、172.16.x.xのアドレス範囲は重複するため使用できません（選択肢BとCは不可）。30台のVMを収容するには、Azureの各サブネットで予約される5つのIPアドレスを考慮し、最低35個のIPアドレスが必要です。192.168.1.0/27は32個のIPアドレス（利用可能は27個）しか提供できず、30台のVMを収容できません。192.168.0.0/24は256個のIPアドレス（利用可能は251個）を提供し、30台のVMを十分に収容できます。",
      "category": "network",
      "tags": [
        "vnet"
      ]
    },
    {
      "id": 15,
      "question": "同じ仮想ネットワークのゲートウェイサブネットのアドレス範囲として適切なものはどれですか？",
      "choices": [
        "A. 192.168.0.0/24",
        "B. 172.16.0.0/16",
        "C. 172.16.1.0/27",
        "D. 192.168.1.0/27"
      ],
      "answer": 3,
      "explanation": "192.168.1.0/27がゲートウェイサブネットに適切です。ゲートウェイサブネットにはMicrosoftが/27以上のサイズを推奨しています。172.16.x.xのアドレス範囲はオンプレミス（172.16.0.0/16）と重複するため使用できません。192.168.0.0/24はSubnet1で使用されているため重複します。192.168.1.0/27は/27のサイズ（Microsoftの推奨最小サイズ）で、オンプレミスやSubnet1とも重複せず、ゲートウェイサブネットとして適切です。",
      "category": "network",
      "tags": [
        "vnet"
      ]
    },
    {
      "id": 16,
      "question": "複数のデータベースを使用するアプリケーションをAzureに移行する必要があります。アプリケーションは「サーバー名.データベース名.テーブル名」の形式でデータにアクセスしています。どのサービスの組み合わせを使用すべきですか？",
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
      "explanation": "「サーバー名.データベース名.テーブル名」の3パート名でアクセスするには、SQL Serverのインスタンスレベルの機能が必要です。Azure SQL Managed Instance（MI）はSQL Serverとほぼ100%の互換性を持ち、クロスデータベースクエリをサポートします。SQL Server on Azure VMも完全なSQL Serverインスタンスを提供するため、この形式のアクセスが可能です。Azure SQL Databaseは単一データベースのサービスであり、クロスデータベースクエリ（3パート名）をネイティブにサポートしていません。Stretch Databaseはオンプレミスのデータをクラウドに拡張する機能であり、移行シナリオには適していません。",
      "category": "data",
      "tags": [
        "sql-database",
        "data-migration"
      ]
    },
    {
      "id": 17,
      "question": "AKSとAPI Management Standardを使用しています。MTLS（相互TLS）認証を実装し、コストを最小化する必要があります。どうすべきですか？",
      "choices": [
        "A. ExternalNameサービスを構成する",
        "B. 外部ロードバランサーを使用する",
        "C. イングレスコントローラーを使用する",
        "D. API Managementを再デプロイする"
      ],
      "answer": 2,
      "explanation": "イングレスコントローラー（例: NGINX Ingress Controller）をAKSに導入することで、MTLS認証を実装できます。これはコスト最小化の要件も満たします。API ManagementをPremiumティアに再デプロイすればVNet統合でMTLSも可能ですが、コストが大幅に増加します。ExternalNameサービスは外部DNSへのマッピングであり、MTLS認証は提供しません。外部ロードバランサーはL4レベルであり、MTLS認証の機能は提供しません。",
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
      "question": "Azure SQL Managed InstanceでTDE（透過的データ暗号化）を使用する場合、暗号化の強度を最大化するためのTDEプロテクターのキーサイズはどれですか？",
      "choices": [
        "A. RSA 4096",
        "B. RSA 3072",
        "C. AES 256",
        "D. RSA 2048"
      ],
      "answer": 1,
      "explanation": "Azure SQL Managed InstanceのTDEプロテクター（カスタマーマネージドキー）は、RSA 3072ビットが最大サポートサイズです。RSA 4096はAzure SQL MIのTDEプロテクターとしてはサポートされていません。AES 256はデータ暗号化キー（DEK）として使用されますが、TDEプロテクターのキータイプとしてはRSAが使用されます。RSA 2048もサポートされていますが、暗号化強度の最大化の要件にはRSA 3072が適切です。",
      "category": "security",
      "tags": [
        "sql-database",
        "sql-security"
      ]
    },
    {
      "id": 19,
      "question": "Azure Database for MySQLでデータセンター障害に備える必要があります。コストを最小化するサービスティアはどれですか？",
      "choices": [
        "A. メモリ最適化",
        "B. バースト可能（Burstable）",
        "C. 汎用（General Purpose）"
      ],
      "answer": 2,
      "explanation": "汎用（General Purpose）ティアは、ゾーン冗長高可用性（HA）をサポートしており、データセンター障害に備えることができます。メモリ最適化ティアもゾーン冗長HAをサポートしていますが、汎用より高コストです。バースト可能（Burstable）ティアはゾーン冗長HAをサポートしていないため、データセンター障害に対する保護ができません。コスト最小化の要件を考慮すると、ゾーン冗長HAをサポートする最も安価なティアである汎用が正解です。",
      "category": "data",
      "tags": ["sql-database"]
    },
    {
      "id": 20,
      "question": "Blobストレージ内の重複ファイルを検出し、管理者の承認メールを送信してから削除するサーバーレスソリューションを設計する必要があります。どのサービスの組み合わせを使用すべきですか？",
      "choices": [
        "A. Azure Logic Apps + Azure Functions",
        "B. Azure Functions + Azure Batch",
        "C. Azure Pipelines + Service Fabric",
        "D. Azure Logic Apps + Azure Event Grid"
      ],
      "answer": 0,
      "explanation": "Azure Logic Appsはスケジュール実行と承認メールのワークフローをノーコードで構築でき、Azure Functionsは重複ファイルの検出と削除のカスタムスクリプトを実行できます。両方ともサーバーレスです。Azure Batchはバッチ処理サービスですがサーバーレスではありません。Azure PipelinesはCI/CDツールであり、このシナリオには適していません。Service Fabricはマイクロサービスプラットフォームでありサーバーレスではありません。Event Gridはイベントルーティングサービスですが、承認メールのワークフローには対応していません。",
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
