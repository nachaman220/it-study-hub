var QUIZ_DATA_website_01_10 = {
  "source": "original",
  "questions": [
    {
      "id": 1,
      "question": "データウェアハウス（DWH）の構築にあたり、最適なAzureサービスを決定する必要があります。大規模データの並列取り込みに適したDWH向けサービスはどれですか？",
      "choices": [
        "A. Azure Data Lake Analytics",
        "B. Azure Synapse Analytics Sparkプール",
        "C. Azure Synapse Analytics 専用SQLプール"
      ],
      "answer": 2,
      "explanation": "Azure Synapse Analytics 専用SQLプールは、企業規模のデータウェアハウス向けに設計されたサービスです。超並列処理（MPP）のアーキテクチャにより、大量データの並列読み込みや高速なクエリ実行が実現できます。Azure Data Lake Analyticsはオンデマンド型のビッグデータ分析ジョブ向けサービスであり、DWH用途には向いていません。Synapse Sparkプールはビッグデータ処理や機械学習に強みがありますが、構造化データのDWHとしては専用SQLプールがより適しています。",
      "category": "data",
      "tags": [
        "data-fundamentals",
        "data-analytics"
      ]
    },
    {
      "id": 2,
      "question": "数千人規模のユーザーに向けてOLAP（オンライン分析処理）のサービングレイヤーを構築する必要があります。最も適したサービスはどれですか？",
      "choices": [
        "A. Azure Synapse Analytics Sparkプール",
        "B. Azure Synapse Analytics 専用SQLプール",
        "C. Azure Analysis Services"
      ],
      "answer": 2,
      "explanation": "Azure Analysis Servicesは、エンタープライズレベルのOLAPエンジンとして、大人数のユーザーへのサービングレイヤーに適した設計となっています。セマンティックモデルの構築を通じて高速なクエリ応答を実現します。Synapse Sparkプールはビッグデータ処理に特化しており、サービングレイヤーとしての利用には向きません。Synapse専用SQLプールはDWHとして優れていますが、大規模ユーザー向けのOLAPサービングにはAnalysis Servicesの方がコスト効率に優れています。",
      "category": "data",
      "tags": [
        "data-analytics"
      ]
    },
    {
      "id": 3,
      "question": "Azure Resource Managerによるデプロイメントの月次レポートを作成したいと考えています。リソースのデプロイ履歴を把握するのに適切なサービスはどれですか？",
      "choices": [
        "A. Azure Analysis Services",
        "B. Azure Monitor アクション グループ",
        "C. Azure Monitor アクティビティ ログ",
        "D. Azure Arc"
      ],
      "answer": 2,
      "explanation": "Azure Monitorのアクティビティログには、サブスクリプション内で発生したイベント（リソースの作成・更新・削除などARMのデプロイ操作）が記録されています。これを活用すれば、月次レポートに必要なデプロイ履歴が確認できます。Analysis Servicesはデータ分析向けのサービスであり、デプロイの追跡には関係がありません。アクショングループはアラート発報時の通知やアクションを構成するもので、履歴の記録機能ではありません。Azure Arcはハイブリッド環境のリソースを一元管理するサービスで、デプロイ履歴の記録用途とは異なります。",
      "category": "monitoring",
      "tags": [
        "subscription-design",
        "azure-monitor",
        "alerts",
        "activity-log",
        "data-analytics",
        "event-driven"
      ]
    },
    {
      "id": 4,
      "question": "SQL Serverの稼働に最適なAzure仮想マシンシリーズを選んでください。条件として15,000 IOPSへの対応、SR-IOVのサポート、そしてコストの最小化が求められます。",
      "choices": [
        "A. NCシリーズ",
        "B. NVシリーズ",
        "C. DSシリーズ"
      ],
      "answer": 2,
      "explanation": "DSシリーズは汎用的なVMで、Premium Storageに対応しており、15,000 IOPSの要件を満たせます。SR-IOV（Single Root I/O Virtualization）もサポートされているため、SQL Serverの運用に適しています。NCシリーズはGPUコンピューティング（AI/ML）用途向けで、SQL Serverにはオーバースペックかつ高コストになります。NVシリーズはGPUベースの可視化やリモートデスクトップ向けであり、データベースワークロードには不向きです。",
      "category": "compute",
      "tags": [
        "virtual-machines"
      ]
    },
    {
      "id": 5,
      "question": "SQL Server VMに適用するディスク種類を選んでください。15,000 IOPSの対応が必要で、なるべくコストを抑えたい場合に最適なのはどれですか？",
      "choices": [
        "A. Ultra Disk",
        "B. Premium SSD",
        "C. Standard SSD"
      ],
      "answer": 1,
      "explanation": "Premium SSDは最大20,000 IOPSに対応しており、15,000 IOPSの条件を十分に満たします。コスト面でもUltra Diskより経済的です。Ultra Diskは最大160,000 IOPSまで対応可能ですが、この要件には過剰なスペックとなりコスト増になります。Standard SSDは最大約6,000 IOPS程度の対応にとどまるため、15,000 IOPSの条件をクリアできません。",
      "category": "compute",
      "tags": [
        "virtual-machines"
      ]
    },
    {
      "id": 6,
      "question": "Azure Blob StorageにおけるポイントインタイムリストアがサポートするBlobの種類として正しいのはどれですか？",
      "choices": [
        "A. ブロックBlob",
        "B. ページBlob",
        "C. 追加Blob"
      ],
      "answer": 0,
      "explanation": "ポイントインタイムリストアで対応しているのはブロックBlobのみです。ブロックBlobのデータを指定した時点の状態へ復元できます。ページBlobはVMディスクなどの用途で使われますが、ポイントインタイムリストアの対象外です。追加Blobはログデータなど追記のみのシナリオで利用されますが、こちらも同機能のサポート対象ではありません。",
      "category": "data",
      "tags": [
        "resource-locks",
        "blob-storage",
        "virtual-machines"
      ]
    },
    {
      "id": 7,
      "question": "ポイントインタイムリストアを利用するために、あらかじめ有効化しておくべき機能はどれですか？",
      "choices": [
        "A. アクセスポリシー",
        "B. 変更フィード",
        "C. 不変ストレージ",
        "D. オブジェクトレプリケーション"
      ],
      "answer": 1,
      "explanation": "ポイントインタイムリストアの利用には、変更フィード（Change Feed）の有効化が前提条件となります。変更フィードはBlobの作成・変更・削除に関する操作ログを提供し、特定時点の状態を復元するための情報源となります。なお、Blobのバージョン管理と論理的な削除も併せて有効にする必要があります。アクセスポリシーはアクセス制御の設定です。不変ストレージはデータの改変・削除を防止する機能です。オブジェクトレプリケーションはBlob間の非同期コピー機能であり、ポイントインタイムリストアの前提条件には含まれません。",
      "category": "data",
      "tags": [
        "entra-connect",
        "blob-storage",
        "bcdr-fundamentals",
        "storage-redundancy"
      ]
    },
    {
      "id": 8,
      "question": "AKS上で動作するマイクロサービスを外部公開する必要があります。プライベートIPアドレスでの接続、MTLS（相互TLS）認証、レート制限が要件です。どの構成を採用すべきですか？",
      "choices": [
        "A. Application Gateway + WAF",
        "B. API Management Standard + セルフホステッドゲートウェイ",
        "C. Azure Front Door + WAF",
        "D. API Management Premium + VNet統合"
      ],
      "answer": 3,
      "explanation": "API Management PremiumティアはVNet統合に対応しており、プライベートIPアドレス経由での接続を実現できます。加えて、MTLS（相互TLS認証）やレート制限（スロットリング）の機能も標準装備されています。Application Gateway + WAFはL7のロードバランシングとWAF保護を提供しますが、MTLSやレート制限の細かな制御にはAPI Managementの方が優れています。API Management StandardティアではVNet統合がサポートされないため、プライベートIPの条件を満たせません。Front Door + WAFはグローバルL7ロードバランシングを担いますが、プライベートIP接続やMTLSの要件には合致しません。",
      "category": "network",
      "tags": [
        "load-balancers",
        "containers",
        "api-management",
        "vnet",
        "network-security"
      ]
    },
    {
      "id": 9,
      "question": "ExpressRoute Global Reachを利用する際に、動的ルーティングを実現し、障害発生時に自動で経路を切り替えられるプロトコルはどれですか？",
      "choices": [
        "A. BGP",
        "B. デフォルトルート",
        "C. ユーザー定義ルート"
      ],
      "answer": 0,
      "explanation": "BGP（Border Gateway Protocol）は、ExpressRouteにおいて使用される動的ルーティングプロトコルです。BGPによってルート情報が自動交換され、障害が起きた場合には経路の再計算と自動切り替えが実行されます。デフォルトルートは静的設定であり、動的なルーティングや障害時の自動切り替えには対応しません。ユーザー定義ルート（UDR）も静的に設定するルーティングのため、動的な経路変更は行えません。",
      "category": "network",
      "tags": [
        "on-premises-connectivity"
      ]
    },
    {
      "id": 10,
      "question": "フェールオーバーが発生した後、トラフィックを自動的に適切な経路へ振り分けるために採用すべきプロトコルはどれですか？",
      "choices": [
        "A. HSRP",
        "B. VRRP",
        "C. BGP"
      ],
      "answer": 2,
      "explanation": "BGP（Border Gateway Protocol）は、Azureネットワーク環境においてフェールオーバー後の自動トラフィックルーティングに用いられるプロトコルです。ExpressRouteやVPN Gatewayと連携し、障害発生時に代替経路を自動検出して切り替えを行います。HSRP（Hot Standby Router Protocol）はCisco独自のプロトコルで、Azure環境では利用されません。VRRP（Virtual Router Redundancy Protocol）はオンプレミスのルーター冗長化向けプロトコルであり、Azureクラウド環境では直接的に使われません。",
      "category": "network",
      "tags": [
        "bcdr-fundamentals",
        "site-recovery",
        "storage-redundancy",
        "on-premises-connectivity"
      ]
    }
  ]
};
