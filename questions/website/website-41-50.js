var QUIZ_DATA_website_41_50 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 41,
      "question": "OracleデータベースからAzure Databricksで処理し、Azure Synapse Analyticsに格納するデータパイプラインを構築する必要があります。使用すべき2つのサービスはどれですか？（2つ選択）",
      "choices": [
        "A. Azure Data Lake Storage (ADLS)",
        "B. Azure Data Box Gateway",
        "C. Azure Data Box Edge",
        "D. Azure Import/Export",
        "E. Azure Data Factory"
      ],
      "answer": [
        0,
        4
      ],
      "explanation": "Azure Data Factoryは、Oracleからのデータ抽出とパイプラインのオーケストレーションを提供します。Azure Data Lake Storage（ADLS）は、Databricksとの統合に最適な中間ストレージとして機能し、大量のデータを効率的に格納・処理できます。OracleからADLSにData Factoryでデータを取り込み、DatabricksでADLS上のデータを処理し、結果をSynapseに格納するアーキテクチャとなります。Data Box GatewayとData Box Edgeはオンプレミスからのデータ転送デバイスであり、このパイプラインには不要です。Import/Exportは物理ディスクによるデータ転送サービスです。",
      "category": "data",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 42,
      "question": "AKSでWindowsコンテナを使用しています。負荷に応じてノード数を自動的にスケールアウトし、リソースの未使用を最小化する機能はどれですか？",
      "choices": [
        "A. 水平ポッドオートスケーラー",
        "B. Kubernetes 1.20.2へのアップグレード",
        "C. クラスターオートスケーラー",
        "D. 仮想ノード（ACI）"
      ],
      "answer": 2,
      "explanation": "クラスターオートスケーラーは、ポッドのリソース要求に基づいてノード数を自動的にスケールアウト/スケールインします。未使用リソースの最小化にも貢献します。水平ポッドオートスケーラーはポッド数のスケーリングであり、ノード数は変更しません。Kubernetesのバージョンアップグレードはスケーリング機能とは無関係です。仮想ノード（ACI）はLinuxコンテナのみをサポートしており、Windowsコンテナでは使用できません。",
      "category": "compute",
      "tags": [
        "containers"
      ]
    },
    {
      "id": 43,
      "question": "Azure VMでSQL Serverを実行しています。トランザクションログディスクのホストキャッシュ設定はどれが適切ですか？",
      "choices": [
        "A. Read/Write",
        "B. None",
        "C. Read-only"
      ],
      "answer": 1,
      "explanation": "SQL Serverのトランザクションログディスクには、ホストキャッシュをNone（なし）に設定すべきです。トランザクションログは順次書き込みが主であり、書き込みの整合性が最も重要です。キャッシュを使用すると、障害時にキャッシュ内のデータが失われ、トランザクションの整合性が損なわれる可能性があります。Read/Writeキャッシュは書き込みキャッシュを含むため、ログの整合性リスクがあります。Read-onlyキャッシュはログの読み取りパターン（順次書き込み）には効果がありません。",
      "category": "compute",
      "tags": [
        "caching"
      ]
    },
    {
      "id": 44,
      "question": "同じSQL Server VMのデータディスクのホストキャッシュ設定はどれが適切ですか？",
      "choices": [
        "A. Read/Write",
        "B. None",
        "C. Read-only"
      ],
      "answer": 2,
      "explanation": "SQL Serverのデータディスクには、Read-only（読み取り専用）キャッシュが推奨されます。データファイルは読み取りが多いワークロードであり、キャッシュにより読み取りパフォーマンスが向上します。Read-onlyキャッシュでは書き込みはキャッシュを経由せず直接ディスクに書き込まれるため、データの整合性も維持されます。Read/Writeキャッシュは書き込みキャッシュによるデータ損失リスクがあります。Noneはキャッシュの恩恵を受けられず、パフォーマンスが低下します。",
      "category": "compute",
      "tags": [
        "caching"
      ]
    },
    {
      "id": 45,
      "question": "2つのリージョンにVMをデプロイし、Azure Traffic Managerで負荷分散する構成は実現可能ですか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "はい、実現可能です。Azure Traffic ManagerはDNSベースのグローバルトラフィック分散サービスであり、複数のリージョンに配置されたVMやサービスに対してトラフィックをルーティングできます。パフォーマンス、優先順位、加重などのルーティング方法を使用して、リージョン間の負荷分散やフェールオーバーを実現できます。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers"
      ]
    },
    {
      "id": 46,
      "question": "2つのリージョンにVMをデプロイし、Application Gatewayで負荷分散する構成は実現可能ですか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "いいえ、Application Gatewayは単一リージョン内のサービスであり、複数リージョンにまたがる負荷分散はできません。Application Gatewayは特定のリージョンのVNet内にデプロイされ、そのリージョン内のバックエンドにのみトラフィックを分散します。リージョン間の負荷分散にはTraffic ManagerやAzure Front Doorを使用する必要があります。",
      "category": "network",
      "tags": [
        "load-balancers",
        "vnet"
      ]
    },
    {
      "id": 47,
      "question": "2つのリージョンにそれぞれ2つの可用性ゾーンを使用してVMをデプロイする場合、必要なVNetの数はいくつですか？",
      "choices": [
        "A. 1",
        "B. 2",
        "C. 3",
        "D. 4"
      ],
      "answer": 1,
      "explanation": "VNet（仮想ネットワーク）はリージョンスコープのリソースであり、1つのVNetは1つのリージョンにのみ存在できます。ただし、VNet内のサブネットは同一リージョン内の複数の可用性ゾーンにまたがることができます。したがって、2つのリージョンには2つのVNetが必要です。各VNet内で可用性ゾーンにVMを分散させるため、VNetの数は可用性ゾーンの数に影響されません。",
      "category": "network",
      "tags": [
        "availability-zones",
        "vnet"
      ]
    },
    {
      "id": 48,
      "question": "CPUクレジットモデルを使用するAzure VMシリーズはどれですか？",
      "choices": [
        "A. Aシリーズ",
        "B. Bシリーズ",
        "C. Dシリーズ",
        "D. Mシリーズ"
      ],
      "answer": 1,
      "explanation": "Bシリーズ（バースト可能）VMは、CPUクレジットモデルを使用します。ベースラインのCPU使用率を下回っている間はクレジットを蓄積し、負荷が高い時にクレジットを消費してベースラインを超えるパフォーマンスを発揮できます。コスト効率が高く、開発/テスト環境やCPU使用率が変動するワークロードに適しています。Aシリーズは基本的な開発/テスト向け、Dシリーズは汎用、Mシリーズはメモリ最適化であり、いずれもクレジットモデルは使用しません。",
      "category": "compute",
      "tags": ["virtual-machines"]
    },
    {
      "id": 49,
      "question": "SQLインジェクション攻撃からの保護とL7ロードバランシングを実現するために使用すべきサービスはどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. WAF",
        "C. Application Gateway",
        "D. URLベースルーティング",
        "E. Traffic Manager",
        "F. SSLオフロード"
      ],
      "answer": 2,
      "explanation": "Application GatewayはL7（アプリケーション層）ロードバランサーであり、この問題のサービス選択としてはApplication Gatewayが正解です。Application GatewayにはWAF機能を統合でき、SQLインジェクション保護とL7ロードバランシングの両方を提供します。Azure Load BalancerはL4ロードバランサーであり、L7の機能は持ちません。Traffic ManagerはDNSベースのルーティングです。WAF、URLベースルーティング、SSLオフロードはApplication Gatewayの機能の一部です。",
      "category": "network",
      "tags": [
        "load-balancers",
        "network-security"
      ]
    },
    {
      "id": 50,
      "question": "前問のシナリオで、SQLインジェクション保護を提供する具体的な機能はどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. WAF",
        "C. Application Gateway",
        "D. URLベースルーティング",
        "E. Traffic Manager",
        "F. SSLオフロード"
      ],
      "answer": 1,
      "explanation": "WAF（Web Application Firewall）は、OWASPコアルールセットに基づいてSQLインジェクション、クロスサイトスクリプティング（XSS）などのWeb攻撃から保護する機能です。Application GatewayやFront DoorにWAFを統合して使用します。Application Gateway自体はL7ロードバランサーですが、SQLインジェクション保護の具体的な機能はWAFが担います。その他の選択肢（Load Balancer、URLルーティング、Traffic Manager、SSLオフロード）はセキュリティ保護の機能ではありません。",
      "category": "security",
      "tags": [
        "load-balancers",
        "network-security"
      ]
    }
  ]
};
