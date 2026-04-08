var QUIZ_DATA_website_91_100 = {
  "source": "original",
  "questions": [
    {
      "id": 91,
      "question": "ビジネス上重要なデータを格納する新規アプリケーションを開発予定です。要件：1年間はデータの変更を不可にする／データの耐障害性を最大化する／読み取り遅延を最小限にする。推奨するストレージアカウントの種類はどれですか？",
      "choices": [
        "Standard 汎用 v1",
        "Premium ブロックBLOB",
        "Standard 汎用 v2"
      ],
      "answer": 1,
      "explanation": "読み取りレイテンシの最小化にはPremiumブロックBLOBが最適です。Premiumレベルでは不変ストレージ（イミュータブルストレージ）もサポートされており、データの変更不可要件にも対応できます。",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 92,
      "question": "ビジネスクリティカルなデータを保管する新しいアプリを開発します。要件：1年間データ変更不可／データ復元力の最大化／読み取りレイテンシの最小化。どの冗長性オプションを選択すべきですか？",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 1,
      "explanation": "LRSはプライマリリージョン内の単一物理ロケーションにデータを3回同期コピーします。コスト最小のオプションですが、高可用性や高耐久性が求められるアプリには推奨されません。ZRSはプライマリリージョン内の3つの可用性ゾーン間でデータを同期コピーし、LRSより高い耐障害性を提供します。高可用性アプリではZRSの使用が推奨され、セカンダリリージョンへのレプリケーションとの併用も検討すべきです。",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-storage",
        "bcdr-fundamentals",
        "availability-zones"
      ]
    },
    {
      "id": 93,
      "question": "リソースグループRG1内にAzure仮想マシンVM1があり、オンプレミスにはVM2があります。新たにRG2というリソースグループをAzureに作成し、VM1をRG2に移動させる必要があります。VM1の移動に使用すべきツールはどれですか？",
      "choices": [
        "The Data Migration Assistant (DMA)",
        "Azure Migrate",
        "Azure Arc",
        "Azure Lighthouse",
        "Azure Resource Mover"
      ],
      "answer": 4,
      "explanation": "Azure VMを別のリージョンやリソースグループに移動する際は、Azure Resource Moverの利用がMicrosoftから推奨されています。Resource Moverは移動対象リソースを検証し、他リソースへの依存関係を自動解決してくれます。",
      "category": "",
      "tags": [
        "lighthouse",
        "virtual-machines",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 94,
      "question": "Azure VM（VM1、RG1所属）とオンプレミスVM（VM2）があります。新規リソースグループRG2を作成し、VM2をAzureのRG2へ移行する必要があります。VM2の移行に適切なツールはどれですか？",
      "choices": [
        "The Data Migration Assistant (DMA)",
        "Azure Migrate",
        "Azure Arc",
        "Azure Lighthouse",
        "Azure Resource Mover"
      ],
      "answer": 1,
      "explanation": "Azure Migrateはオンプレミスからのクラウド移行を支援する統合サービスで、インフラ・データ・アプリの検出、評価、適切なサイジングなど移行前の全工程をカバーします。拡張フレームワークによりサードパーティツールの統合も可能で対応範囲が広がります。Azure Arcは本ケースでは不要です。DMAはSQL Server評価用のスタンドアロンツールです。LighthouseはマルチテナントのクロステナントManagement用サービスです。",
      "category": "",
      "tags": [
        "entra-id",
        "lighthouse",
        "virtual-machines",
        "automation-deploy",
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 95,
      "question": "Azure Linux VMを使ってビデオファイルを解析するアプリケーションを設計中です。ファイルはExpressRoute接続された企業オフィスからアップロードされます。ストレージアカウントの要件：最大7TBのビデオファイルに対応／可能な限り高い可用性／大容量ビデオファイルに最適化されたストレージ／ExpressRoute経由でのアップロードを確実にする。ストレージアカウントタイプの選択はどれですか？",
      "choices": [
        "Premium ページ BLOB",
        "Premium ファイル共有",
        "Standard 汎用 v2"
      ],
      "answer": 2,
      "explanation": "Standard汎用v2はブロックBLOBをサポートし、大容量のビデオファイル（最大数TBまで）に対応可能です。また、様々な冗長性オプションとネットワーク構成を柔軟に選択できます。",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 96,
      "question": "Azure Linux VMでビデオファイル解析を行うアプリの設計です。ExpressRoute接続の企業オフィスからファイルをアップロードします。要件：最大7TBファイル対応／最高レベルの可用性／大容量ビデオ向けストレージ最適化／ExpressRoute経由のアップロード保証。データの冗長性としてどれを選びますか？",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 1,
      "explanation": "GRSはLRSやZRSと比較して追加の冗長性を提供し、可能な限り高い可用性を実現します。プライマリリージョンに加えてセカンダリリージョンにもデータが複製されるため、リージョン障害からの復旧にも対応できます。",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 97,
      "question": "Azure Linux VMでビデオ解析アプリを運用し、ExpressRoute経由で企業オフィスからファイルをアップロードする構成です。要件：最大7TBのビデオファイル／最高の可用性／大容量ファイルに最適化／ExpressRoute経由のアップロードを確実にする。ネットワーク構成として何を選択すべきですか？",
      "choices": [
        "サービスエンドポイント",
        "Azure Route Server",
        "プライベートエンドポイント"
      ],
      "answer": 2,
      "explanation": "ExpressRouteはインターネットを経由せずAzureネットワークに直結するため、プライベートエンドポイントが適切です。Azure Private Linkを使えば、プライベートエンドポイントを介してAzure PaaSサービスを仮想ネットワークに安全に接続できます。オンプレミスサーバーをAzure Arcに接続し、ExpressRouteやサイト間VPN経由で全トラフィックを送信することで、パブリックネットワークを回避した通信が実現できます。",
      "category": "",
      "tags": [
        "azure-storage",
        "virtual-machines",
        "vnet",
        "on-premises-connectivity",
        "private-link"
      ]
    },
    {
      "id": 98,
      "question": "Azureサブスクリプションがあり、開発者にAzure VMのプロビジョニング権限を付与するソリューションが必要です。要件：特定リージョンのみでVM作成を許可／特定サイズのVMのみ作成を許可。どのサービスを推奨しますか？",
      "choices": [
        "Azure Policy",
        "Azure Resource Manager テンプレート",
        "ロールベースのアクセス制御 (RBAC)",
        "条件付きアクセス ポリシー"
      ],
      "answer": 0,
      "explanation": "Azure Policyを活用すれば、許可するリージョン（場所）や許可するVM SKUを定義・強制できます。ポリシーに適合しないリソースの作成は自動的に拒否されるため、開発者のVM作成を指定のリージョンとサイズに限定できます。",
      "category": "",
      "tags": [
        "rbac",
        "conditional-access",
        "subscription-design",
        "azure-policy",
        "virtual-machines"
      ]
    },
    {
      "id": 99,
      "question": "オンプレミスに2つのSQL Server 2017インスタンスがあり、Always On可用性グループAG1をホストしています。AG1にはデータベースDB1が含まれます。Azure側にはLinuxでSQL Server 2019が稼働するVM1があります。DB1をVM1に移行する際、ダウンタイムを最小限にしたい場合、移行準備として何を実施すべきですか？",
      "choices": [
        "オンプレミスの SQL Server インスタンスのアップグレード",
        "AG1 へのセカンダリ レプリカの追加",
        "VM1 での Always On 可用性グループの作成"
      ],
      "answer": 1,
      "explanation": "移行準備としてAG1にセカンダリレプリカを追加します。オンプレミスに既存の可用性グループ（AG1）があるため、VM1上に新たなAlways On可用性グループを作成する必要はありません。セカンダリレプリカを追加することでDB1のコピーが移行に利用でき、プライマリレプリカを稼働させたままセカンダリ側で移行を進められるため、ダウンタイムを最小化できます。",
      "category": "",
      "tags": [
        "subscription-design",
        "sql-ha",
        "virtual-machines",
        "data-migration"
      ]
    },
    {
      "id": 100,
      "question": "2つのオンプレミスSQL Server 2017インスタンスでAlways On可用性グループAG1（DB1を含む）を運用中です。Azure上のLinux VM（VM1）でSQL Server 2019が稼働しています。DB1をVM1へ移行する際にダウンタイムを最小限にするため、マイグレーション実行時に使用すべきツールはどれですか？",
      "choices": [
        "ログ 配布",
        "Azure Migrate",
        "分散型可用性グループ"
      ],
      "answer": 1,
      "explanation": "オンプレミスのSQL Serverをアップグレードしたうえで、Azure Migrateを使用して移行を実行します。Azure Migrateはオンプレミスからのクラウド移行を包括的に支援するサービスです。",
      "category": "",
      "tags": [
        "subscription-design",
        "sql-ha",
        "virtual-machines",
        "data-migration"
      ]
    }
  ]
};
