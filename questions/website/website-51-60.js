var QUIZ_DATA_website_51_60 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 51,
      "question": "Basic Virtual WANにExpressRoute接続を追加する必要があります。どの操作が必要ですか？",
      "choices": [
        "A. Hub1にExpressRouteゲートウェイを追加する",
        "B. ハブVNetを作成する",
        "C. Virtual WANをStandardにアップグレードする",
        "D. ExpressRoute Premiumにアップグレードする"
      ],
      "answer": 2,
      "explanation": "Basic Virtual WANはサイト間（S2S）VPN接続のみをサポートしています。ExpressRoute接続を使用するには、Virtual WANをStandardティアにアップグレードする必要があります。Standard Virtual WANは、S2S VPN、ExpressRoute、ポイント対サイトVPN、VNet間接続など、すべての接続タイプをサポートしています。ゲートウェイの追加はStandardへのアップグレード後に行う操作です。ExpressRoute Premiumは異なるリージョンへの接続に必要ですが、Virtual WANのティアとは別の問題です。",
      "category": "network",
      "tags": [
        "vnet",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 52,
      "question": "VMのデプロイ先リージョンとVMサイズを制限する必要があります。どのサービスを使用すべきですか？",
      "choices": [
        "A. Azure Policy",
        "B. 条件付きアクセス",
        "C. 属性ベースのアクセス制御 (ABAC)",
        "D. ロールベースのアクセス制御 (RBAC)"
      ],
      "answer": 0,
      "explanation": "Azure Policyは、リソースのプロパティに基づいてルールを強制するサービスです。「許可されたリージョン」や「許可されたVMサイズ」などの組み込みポリシーを使用して、特定のリージョンやVMサイズへのデプロイを制限できます。条件付きアクセスはユーザーのサインイン条件を制御するAzure ADの機能であり、リソースデプロイの制限には使用しません。ABACはデータプレーンのアクセス制御です。RBACはユーザーの操作権限を管理しますが、リソースのプロパティ（リージョンやサイズ）の制限には適していません。",
      "category": "governance",
      "tags": [
        "entra-id",
        "rbac",
        "conditional-access",
        "azure-policy",
        "storage-rbac"
      ]
    },
    {
      "id": 53,
      "question": "VM上のデータをAzure Data Factoryを使用してAzure Data Lake Storageに転送する必要があります。VM上に必要なコンポーネントはどれですか？",
      "choices": [
        "A. Azure Pipelines エージェント",
        "B. オンプレミス データ ゲートウェイ",
        "C. Azure File Sync エージェント",
        "D. セルフホステッド統合ランタイム"
      ],
      "answer": 3,
      "explanation": "セルフホステッド統合ランタイムは、Azure Data FactoryがVM上やオンプレミスのデータソースにアクセスするために必要なコンポーネントです。VMにインストールすることで、Data FactoryがVM上のデータを読み取り、ADLSに転送できます。Azure Pipelinesエージェントは CI/CD用であり、Data Factoryとは関係ありません。オンプレミスデータゲートウェイはLogic AppsやPower BI向けです。File SyncエージェントはAzure Filesとの同期用であり、Data Factoryとは連携しません。",
      "category": "data",
      "tags": [
        "entra-connect",
        "data-sources",
        "data-analytics",
        "file-sync",
        "api-management"
      ]
    },
    {
      "id": 54,
      "question": "App Serviceのデプロイ先リージョンをリソースロックで制限できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "いいえ、リソースロックはデプロイ先リージョンを制限する機能ではありません。リソースロックは既存のリソースに対して削除ロック（CanNotDelete）や読み取り専用ロック（ReadOnly）を設定し、誤った変更や削除を防ぐ機能です。新しいリソースのデプロイ先を制限するには、Azure Policyを使用する必要があります。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "resource-locks",
        "app-service"
      ]
    },
    {
      "id": 55,
      "question": "App Serviceのデプロイ先リージョンをMicrosoft Defender for Cloudで制限できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "いいえ、Microsoft Defender for Cloudはセキュリティ体制管理と脅威保護のサービスであり、リソースのデプロイ先リージョンを制限する機能は提供していません。Defender for Cloudはセキュリティの推奨事項の提示、脅威の検出・アラート、セキュリティスコアの評価などを行います。デプロイ先の制限にはAzure Policyを使用します。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 56,
      "question": "App Serviceのデプロイ先リージョンをAzure Policyで制限できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "はい、Azure Policyの「許可されたリージョン」（Allowed locations）組み込みポリシーを使用することで、App Serviceを含むすべてのAzureリソースのデプロイ先リージョンを制限できます。ポリシーに違反するリージョンへのデプロイは自動的に拒否されます。Azure Policyはリソースのプロパティに基づくルールの強制に最適なサービスです。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "app-service"
      ]
    },
    {
      "id": 57,
      "question": "Azure VM上のSQL ServerでHAを実装する必要があります。コストを最小化し、フェールオーバー時間を最小化する構成はどれですか？",
      "choices": [
        "A. VNN + Standard ファイル共有",
        "B. Premium ファイル共有 + DNN AG（Always On 可用性グループ）",
        "C. Premium ファイル共有 + VNN AG（Always On 可用性グループ）",
        "D. VNN + Premium ファイル共有"
      ],
      "answer": 1,
      "explanation": "Premium ファイル共有 + DNN（Distributed Network Name）を使用したAlways On可用性グループが最適です。Always On可用性グループはフェールオーバー時間が最小化されます。DNNはAzure Load Balancerを必要としないため、構成が簡素化されコストが削減されます。Premium ファイル共有は高いIOPSと低レイテンシを提供します。VNNはAzure Load Balancerが必要でコストが増加します。Standard ファイル共有はパフォーマンスが低くなります。",
      "category": "business-continuity",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "sql-ha",
        "load-balancers"
      ]
    },
    {
      "id": 58,
      "question": "Azure Key Vaultはフェールオーバー時にどこにフェールオーバーされますか？",
      "choices": [
        "A. 同一障害ドメイン",
        "B. ペアリージョン",
        "C. 同一可用性セット"
      ],
      "answer": 1,
      "explanation": "Azure Key Vaultは、リージョン障害が発生した場合、ペアリージョンに自動的にフェールオーバーされます。これはMicrosoftが管理する自動フェールオーバーであり、ユーザーの操作は不要です。Key Vaultのコンテンツはプライマリリージョンとペアリージョンの両方にレプリケートされています。障害ドメインや可用性セットは同一リージョン内の概念であり、リージョン障害からの保護には対応していません。",
      "category": "business-continuity",
      "tags": [
        "key-vault",
        "availability-zones",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 59,
      "question": "Azure Key Vaultのフェールオーバー中に利用できない操作はどれですか？（該当するものを選択）",
      "choices": [
        "A. List",
        "B. Backup",
        "C. Get",
        "D. Unwrap",
        "E. Delete",
        "F. Wrap"
      ],
      "answer": 4,
      "explanation": "Key Vaultのフェールオーバー中は読み取り専用モードとなり、書き込み操作（Create、Update、Delete）は利用できません。選択肢の中でDeleteは書き込み操作に該当するため、フェールオーバー中は利用できません。List、Get、Unwrap、Wrapは読み取りまたは暗号化操作であり、フェールオーバー中も利用可能です。Backupも読み取り操作として利用可能です。フェールオーバーが完了すると、すべての操作が再び利用可能になります。",
      "category": "security",
      "tags": [
        "key-vault",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 60,
      "question": "ネットワーク仮想アプライアンス（NVA）への受信トラフィックを分散するために使用すべきサービスはどれですか？",
      "choices": [
        "A. Azure Front Door",
        "B. Azure Gateway Load Balancer",
        "C. Application Gateway",
        "D. Azure Traffic Manager"
      ],
      "answer": 1,
      "explanation": "Azure Gateway Load Balancerは、NVA（ネットワーク仮想アプライアンス）へのトラフィックを透過的にチェーンするために設計されたサービスです。ファイアウォール、IDS/IPS、DPIなどのNVAにトラフィックを分散し、既存のネットワークパスに透過的に挿入できます。Front DoorはグローバルL7ルーティングでありNVAへの直接的なトラフィック分散には適していません。Application GatewayはWebアプリケーション向けのL7ロードバランサーです。Traffic ManagerはDNSベースのルーティングであり、NVAへのインライントラフィック分散には使用しません。",
      "category": "network",
      "tags": [
        "load-balancers"
      ]
    }
  ]
};
