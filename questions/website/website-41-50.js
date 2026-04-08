var QUIZ_DATA_website_41_50 = {
  "source": "original",
  "questions": [
    {
      "id": 41,
      "question": "OracleデータベースからデータをAzure Databricksで処理し、Azure Synapse Analyticsへ格納するパイプラインを構築したいと考えています。利用すべき2つのサービスはどれですか？（2つ選択）",
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
      "explanation": "Azure Data FactoryはOracleからのデータ抽出とパイプライン全体のオーケストレーションを担います。Azure Data Lake Storage（ADLS）はDatabricksとの連携に最適な中間ストレージとして機能し、大量データの効率的な格納・処理を可能にします。Data FactoryでOracleからADLSへデータを取り込み、Databricksで加工し、結果をSynapseへ格納するという構成になります。Data Box GatewayやData Box Edgeはオンプレミスからのデータ転送用デバイスであり、このパイプラインには不要です。Import/Exportは物理ディスクを使ったデータ転送サービスです。",
      "category": "data",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 42,
      "question": "AKSでWindowsコンテナを運用しています。負荷に応じてノード数を自動的にスケールアウトし、未使用リソースを最小限にできる機能はどれですか？",
      "choices": [
        "A. 水平ポッドオートスケーラー",
        "B. Kubernetes 1.20.2へのアップグレード",
        "C. クラスターオートスケーラー",
        "D. 仮想ノード（ACI）"
      ],
      "answer": 2,
      "explanation": "クラスターオートスケーラーは、ポッドのリソース要求に基づきノード数を自動でスケールアウト/スケールインし、未使用リソースの削減にも寄与します。水平ポッドオートスケーラーはポッド数の調整であり、ノード数の変更は行いません。Kubernetesバージョンのアップグレードはスケーリング機能とは無関係です。仮想ノード（ACI）はLinuxコンテナのみが対象で、Windowsコンテナには利用できません。",
      "category": "compute",
      "tags": [
        "containers"
      ]
    },
    {
      "id": 43,
      "question": "Azure VM上でSQL Serverを稼働させています。トランザクションログ用ディスクに設定すべきホストキャッシュはどれですか？",
      "choices": [
        "A. Read/Write",
        "B. None",
        "C. Read-only"
      ],
      "answer": 1,
      "explanation": "SQL Serverのトランザクションログディスクでは、ホストキャッシュをNone（無効）に設定するのが適切です。トランザクションログは順次書き込みが中心であり、書き込みの整合性が最も重視されます。キャッシュを有効にすると、障害時にキャッシュ内データが失われてトランザクションの整合性が損なわれるリスクがあります。Read/Writeキャッシュは書き込みキャッシュを含むため整合性上のリスクがあり、Read-onlyキャッシュはログの書き込み主体のパターンには効果がありません。",
      "category": "compute",
      "tags": [
        "caching"
      ]
    },
    {
      "id": 44,
      "question": "同一SQL Server VMのデータディスクに設定すべきホストキャッシュはどれですか？",
      "choices": [
        "A. Read/Write",
        "B. None",
        "C. Read-only"
      ],
      "answer": 2,
      "explanation": "SQL Serverのデータディスクには、Read-only（読み取り専用）キャッシュの設定が推奨されます。データファイルへのアクセスは読み取りが主体のため、キャッシュによって読み取り性能が向上します。Read-onlyキャッシュでは書き込みはキャッシュを介さず直接ディスクに書き込まれるため、データ整合性も確保されます。Read/Writeキャッシュは書き込みキャッシュに起因するデータ損失リスクがあります。Noneではキャッシュの恩恵が得られず、パフォーマンスが低下します。",
      "category": "compute",
      "tags": [
        "caching"
      ]
    },
    {
      "id": 45,
      "question": "2つのリージョンそれぞれにVMをデプロイし、Azure Traffic Managerで負荷分散する構成は実現できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "はい、この構成は実現可能です。Azure Traffic ManagerはDNSベースのグローバルトラフィック分散サービスであり、複数リージョンに配置されたVMやサービスへトラフィックを振り分けることができます。パフォーマンス、優先順位、加重などのルーティング方式を活用して、リージョン間の負荷分散やフェールオーバーを実現できます。",
      "category": "network",
      "tags": [
        "site-recovery",
        "storage-redundancy",
        "load-balancers"
      ]
    },
    {
      "id": 46,
      "question": "2つのリージョンにVMをデプロイし、Application Gatewayで負荷分散する構成は実現できますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "いいえ、Application Gatewayは単一リージョン内のサービスであり、リージョンをまたいだ負荷分散には対応していません。Application Gatewayは特定リージョンのVNet内にデプロイされ、同リージョン内のバックエンドにのみトラフィックを振り分けます。リージョン間の負荷分散が必要な場合はTraffic ManagerやAzure Front Doorを利用する必要があります。",
      "category": "network",
      "tags": [
        "load-balancers",
        "vnet"
      ]
    },
    {
      "id": 47,
      "question": "2つのリージョンにそれぞれ2つの可用性ゾーンを使ってVMを展開する場合、必要となるVNetの数はいくつですか？",
      "choices": [
        "A. 1",
        "B. 2",
        "C. 3",
        "D. 4"
      ],
      "answer": 1,
      "explanation": "VNet（仮想ネットワーク）はリージョン単位のリソースであり、1つのVNetは1つのリージョンにしか存在できません。ただし、VNet内のサブネットは同一リージョン内の複数の可用性ゾーンにまたがることが可能です。そのため、2リージョン構成では2つのVNetが必要となります。各VNet内で可用性ゾーンにVMを分散するため、VNet数は可用性ゾーンの数には左右されません。",
      "category": "network",
      "tags": [
        "availability-zones",
        "vnet"
      ]
    },
    {
      "id": 48,
      "question": "CPUクレジットモデルを採用しているAzure VMシリーズはどれですか？",
      "choices": [
        "A. Aシリーズ",
        "B. Bシリーズ",
        "C. Dシリーズ",
        "D. Mシリーズ"
      ],
      "answer": 1,
      "explanation": "Bシリーズ（バースト可能）VMがCPUクレジットモデルを採用しています。CPU使用率がベースラインを下回る間はクレジットを蓄え、負荷が高まった際にクレジットを消費してベースラインを超えるパフォーマンスを発揮します。コスト効率が高く、開発/テスト環境やCPU使用率に変動があるワークロードに向いています。Aシリーズは基本的な開発/テスト向け、Dシリーズは汎用向け、Mシリーズはメモリ最適化向けであり、いずれもクレジットモデルは使用していません。",
      "category": "compute",
      "tags": ["virtual-machines"]
    },
    {
      "id": 49,
      "question": "SQLインジェクション攻撃への防御とL7ロードバランシングの両方を実現するために選択すべきサービスはどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. WAF",
        "C. Application Gateway",
        "D. URLベースルーティング",
        "E. Traffic Manager",
        "F. SSLオフロード"
      ],
      "answer": 2,
      "explanation": "Application GatewayはL7（アプリケーション層）のロードバランサーであり、この設問のサービス選択ではApplication Gatewayが正解です。Application GatewayにWAF機能を統合することで、SQLインジェクション防御とL7ロードバランシングの双方を提供できます。Azure Load BalancerはL4ロードバランサーでL7機能は持ちません。Traffic ManagerはDNSベースのルーティングです。WAF、URLベースルーティング、SSLオフロードはいずれもApplication Gatewayが持つ個別機能です。",
      "category": "network",
      "tags": [
        "load-balancers",
        "network-security"
      ]
    },
    {
      "id": 50,
      "question": "前問のシナリオにおいて、SQLインジェクションからの保護を直接担う具体的な機能はどれですか？",
      "choices": [
        "A. Azure Load Balancer",
        "B. WAF",
        "C. Application Gateway",
        "D. URLベースルーティング",
        "E. Traffic Manager",
        "F. SSLオフロード"
      ],
      "answer": 1,
      "explanation": "WAF（Web Application Firewall）はOWASPコアルールセットに基づき、SQLインジェクションやクロスサイトスクリプティング（XSS）などのWeb攻撃を防御する機能です。Application GatewayやFront DoorにWAFを組み込んで利用します。Application Gateway自体はL7ロードバランサーですが、SQLインジェクション防御の具体的な機能を担うのはWAFです。他の選択肢（Load Balancer、URLルーティング、Traffic Manager、SSLオフロード）はセキュリティ防御の機能ではありません。",
      "category": "security",
      "tags": [
        "load-balancers",
        "network-security"
      ]
    }
  ]
};
