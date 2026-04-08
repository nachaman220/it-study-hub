var QUIZ_DATA_website_51_60 = {
  "source": "original",
  "questions": [
    {
      "id": 51,
      "question": "Basic SKUのVirtual WANを使用していますが、ExpressRoute接続を構成する必要が生じました。どのような対応が求められますか？",
      "choices": [
        "A. Hub1にExpressRouteゲートウェイをデプロイする",
        "B. 新しいハブVNetを構築する",
        "C. Virtual WANのSKUをStandardへ変更する",
        "D. ExpressRoute回線をPremiumへアップグレードする"
      ],
      "answer": 2,
      "explanation": "Basic SKUのVirtual WANが対応しているのはサイト間VPN（S2S）のみです。ExpressRouteを利用するためには、Standard SKUへの昇格が必須となります。Standardティアでは、S2S VPNに加えてExpressRoute、P2S VPN、VNet間接続といった全種類の接続が利用可能です。ExpressRouteゲートウェイの追加はStandard化が完了した後の手順です。なお、ExpressRoute Premiumは他リージョン間の接続に関わるもので、Virtual WANのティアの話とは異なります。",
      "category": "network",
      "tags": [
        "vnet",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 52,
      "question": "仮想マシンの展開可能なリージョンおよびサイズを制御したい場合、どのAzureサービスが最適ですか？",
      "choices": [
        "A. Azure Policy",
        "B. 条件付きアクセス",
        "C. 属性ベースのアクセス制御 (ABAC)",
        "D. ロールベースのアクセス制御 (RBAC)"
      ],
      "answer": 0,
      "explanation": "Azure Policyはリソースのプロパティに対してルールを適用できるサービスです。「許可されたリージョン」や「許可されたVMサイズ」といった組み込みのポリシー定義を活用すれば、デプロイ先や利用サイズの制約を設けることが可能です。条件付きアクセスはAzure ADにおけるサインイン制御機能であり、リソースのデプロイ制御には向いていません。ABACはデータプレーン側のアクセス管理に使われます。RBACはユーザーの権限管理が主目的であり、リージョンやVMサイズのようなリソース属性の制約には不向きです。",
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
      "question": "Azure Data Factoryを利用してVM内のデータをAzure Data Lake Storageへ移送する計画があります。VMにインストールすべきコンポーネントは何ですか？",
      "choices": [
        "A. Azure Pipelines エージェント",
        "B. オンプレミス データ ゲートウェイ",
        "C. Azure File Sync エージェント",
        "D. セルフホステッド統合ランタイム"
      ],
      "answer": 3,
      "explanation": "Azure Data FactoryがVM上やオンプレミス環境のデータにアクセスするには、セルフホステッド統合ランタイムのインストールが不可欠です。これをVM上に配置すると、Data FactoryがそのVM上のデータを取得してADLSへコピーできるようになります。Azure Pipelinesエージェントの用途はCI/CDであり、Data Factoryの処理には関与しません。オンプレミスデータゲートウェイはPower BIやLogic Apps用のコンポーネントです。File SyncエージェントはAzure Filesの同期に使うもので、Data Factoryとは連携しません。",
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
      "question": "リソースロックを使って、App Serviceの展開先リージョンを制約することは可能でしょうか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "リソースロックにはデプロイ先リージョンを制約する機能はありません。リソースロックの役割は、既存リソースに対する削除防止（CanNotDelete）や読み取り専用（ReadOnly）の設定であり、意図しない変更・削除から保護するものです。リソースのデプロイ先を制約するにはAzure Policyを利用する必要があります。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "resource-locks",
        "app-service"
      ]
    },
    {
      "id": 55,
      "question": "Microsoft Defender for Cloudを用いて、App Serviceのデプロイ先リージョンを制約できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "Microsoft Defender for Cloudはセキュリティ態勢管理や脅威防御を担うサービスであり、リソースの展開先リージョンを制御する機能は備えていません。セキュリティ推奨事項の提示、脅威検知とアラート生成、セキュリティスコアの算出などが主な役割です。デプロイ先のリージョン制限にはAzure Policyを活用します。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "alerts",
        "app-service"
      ]
    },
    {
      "id": 56,
      "question": "Azure Policyを利用して、App Serviceの展開可能リージョンを限定することはできますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "Azure Policyに用意されている「Allowed locations」（許可された場所）ビルトインポリシーを適用すれば、App Serviceを含むあらゆるAzureリソースの展開リージョンを制限できます。ポリシーに適合しないリージョンへのデプロイは自動的にブロックされます。リソースのプロパティベースでルールを強制するにはAzure Policyが最適です。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "app-service"
      ]
    },
    {
      "id": 57,
      "question": "Azure VM上で稼働するSQL Serverに高可用性を導入する必要があります。フェールオーバー時間の短縮とコスト削減の両方を重視する場合、最適な構成はどれですか？",
      "choices": [
        "A. VNN + Standard ファイル共有",
        "B. Premium ファイル共有 + DNN AG（Always On 可用性グループ）",
        "C. Premium ファイル共有 + VNN AG（Always On 可用性グループ）",
        "D. VNN + Premium ファイル共有"
      ],
      "answer": 1,
      "explanation": "Premium ファイル共有とDNN（分散ネットワーク名）を組み合わせたAlways On可用性グループが最も適しています。Always On可用性グループによりフェールオーバー所要時間を最短にでき、DNNの採用でAzure Load Balancerが不要になるため、構成の簡略化とコスト低減が実現します。Premium ファイル共有は高IOPSと低レイテンシを実現します。VNN方式ではAzure Load Balancerが別途必要となりコストが増えます。Standard ファイル共有ではパフォーマンスが劣ります。",
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
      "question": "Azure Key Vaultでリージョン障害が発生した場合、フェールオーバー先はどこになりますか？",
      "choices": [
        "A. 同一障害ドメイン",
        "B. ペアリージョン",
        "C. 同一可用性セット"
      ],
      "answer": 1,
      "explanation": "Azure Key Vaultは、リージョン規模の障害時にペアリージョンへ自動フェールオーバーされます。この処理はMicrosoftが管理しており、ユーザー側の手動操作は不要です。Key Vaultの内容はプライマリリージョンとペアリージョンの双方に複製されています。障害ドメインや可用性セットは単一リージョン内の概念であるため、リージョン障害への対策にはなりません。",
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
      "question": "Azure Key Vaultがフェールオーバー中の場合、実行不可能な操作はどれですか？（該当するものを選んでください）",
      "choices": [
        "A. List",
        "B. Backup",
        "C. Get",
        "D. Unwrap",
        "E. Delete",
        "F. Wrap"
      ],
      "answer": 4,
      "explanation": "フェールオーバー中のKey Vaultは読み取り専用状態となるため、作成・更新・削除などの書き込み系操作は行えません。選択肢のうちDeleteが書き込み操作に分類されるため、フェールオーバー中は使用できなくなります。List、Get、Unwrap、Wrapといった読み取り・暗号化系の操作やBackup（読み取り系）はフェールオーバー中でも実行可能です。フェールオーバーの完了後に全操作が復旧します。",
      "category": "security",
      "tags": [
        "key-vault",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 60,
      "question": "ネットワーク仮想アプライアンス（NVA）宛のインバウンドトラフィックを負荷分散するには、どのサービスを採用すべきですか？",
      "choices": [
        "A. Azure Front Door",
        "B. Azure Gateway Load Balancer",
        "C. Application Gateway",
        "D. Azure Traffic Manager"
      ],
      "answer": 1,
      "explanation": "Azure Gateway Load Balancerは、NVA（ネットワーク仮想アプライアンス）のトラフィックチェーンを透過的に実現するために開発されたサービスです。ファイアウォールやIDS/IPS、DPIなどのNVAへ負荷を分散し、既存のネットワーク経路にシームレスに組み込めます。Front DoorはグローバルなL7ルーティングが主用途で、NVAへの直接的なトラフィック分散には不向きです。Application GatewayはWebアプリ向けのL7ロードバランサーです。Traffic ManagerはDNSレベルのルーティングであり、NVAへのインライン分散には適していません。",
      "category": "network",
      "tags": [
        "load-balancers"
      ]
    }
  ]
};
