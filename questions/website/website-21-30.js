var QUIZ_DATA_website_21_30 = {
  "source": "original",
  "questions": [
    {
      "id": 21,
      "question": "Azure BlueprintsとARMテンプレートの相違点について、正しいのはどれですか？",
      "choices": [
        "A. ARMテンプレートはデプロイ後もリソースとの接続を維持する",
        "B. Azure Blueprintsはデプロイ後もリソースとの接続を維持する",
        "C. ARMテンプレートのみがAzure Policyをデプロイできる",
        "D. Azure BlueprintsのみがAzure Policyをデプロイできる"
      ],
      "answer": 1,
      "explanation": "Azure Blueprintsはデプロイ後もリソースとのリレーションシップ（接続）を保持し続けます。そのため、ブループリントを更新するとデプロイ済みのリソースにも反映されます。一方、ARMテンプレートはデプロイ完了後にリソースとの関連を持たず、テンプレートの変更が既存リソースに影響することはありません。なお、ARMテンプレートでもAzure Policyのデプロイは可能なため、選択肢CとDは正しくありません。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "blueprints"
      ]
    },
    {
      "id": 22,
      "question": "SQL Server（SQL1）上にある50個のデータベースをオフラインでAzureへ移行する必要があります。管理負荷を最も軽減できるサービスはどれですか？",
      "choices": [
        "A. Data Migration Assistant (DMA)",
        "B. Azure Migrate",
        "C. SQL Server Migration Assistant (SSMA)",
        "D. Azure Database Migration Service (DMS)"
      ],
      "answer": 3,
      "explanation": "Azure Database Migration Service（DMS）は、大規模データベース移行を行うためのフルマネージドサービスです。50個のデータベースをオフライン移行する場合も効率的に処理でき、管理負荷を最小限に抑えられます。DMAは移行前のアセスメントツールで、大量移行の実行には向きません。Azure Migrateはサーバーやアプリ全般の移行評価・実行向けですが、データベース専用の移行にはDMSがより適しています。SSMAはOracle・MySQLなど非SQL ServerのDBからSQL Serverへ移行するためのツールであり、SQL Server間の移行には使いません。",
      "category": "migration",
      "tags": [
        "data-migration",
        "db-migration"
      ]
    },
    {
      "id": 23,
      "question": "3Dジオメトリの演算処理を実行したい場合、大規模並列コンピューティングを実現するために利用すべき2つの機能やサービスはどれですか？（2つ選択）",
      "choices": [
        "A. 並列タスクの有効化",
        "B. Azure Batch",
        "C. 並列ファイルシステム",
        "D. Virtual Machine Scale Sets (VMSS)",
        "E. 仮想マシン"
      ],
      "answer": [
        0,
        1
      ],
      "explanation": "Azure Batchは大規模並列コンピューティングやHPCワークロードの実行に適したサービスです。並列タスクの有効化と組み合わせることで、3Dジオメトリの演算を複数ノードで並列に処理できます。VMSSはスケーラブルなVM群を構成できますが、バッチジョブの管理機能は備えていません。並列ファイルシステムはストレージ面の話であり、演算の並列化とは直接関係しません。単体のVMでは大規模な並列演算には不十分です。",
      "category": "compute",
      "tags": [
        "vmss",
        "virtual-machines",
        "batch"
      ]
    },
    {
      "id": 24,
      "question": "Azure Batchで初回ジョブ（Linux環境、開発/テスト用途）を実行する場合、コストを最も抑えられる構成はどれですか？",
      "choices": [
        "A. ユーザーサブスクリプションモード + 低優先度VM",
        "B. Batchサービスモード + 専用VM",
        "C. ユーザーサブスクリプションモード + 専用VM"
      ],
      "answer": 0,
      "explanation": "開発/テスト目的でコストを最小化するなら、低優先度VMの利用が最適です。低優先度VMはAzureの余剰キャパシティを活用するため、通常VMと比べて最大80%の費用削減が見込めます。ユーザーサブスクリプションモードでは低優先度VMが利用可能です。専用VMは高可用性を確保できますが、開発/テスト段階ではそこまでの必要性は低く、費用が膨らみます。LinuxではAzure Hybrid Benefitは適用されないため、その面でのコスト削減はありません。",
      "category": "compute",
      "tags": [
        "subscription-design",
        "batch"
      ]
    },
    {
      "id": 25,
      "question": "Azure Batchで2つ目のジョブ（本番環境、MPI対応、長時間実行のタスク）を走らせる場合、適切な構成はどれですか？",
      "choices": [
        "A. ユーザーサブスクリプションモード + 低優先度VM",
        "B. Batchサービスモード + 専用VM",
        "C. ユーザーサブスクリプションモード + 専用VM"
      ],
      "answer": 2,
      "explanation": "本番環境でMPI（Message Passing Interface）を利用する長時間タスクには、専用VMが不可欠です。低優先度VMは予期しない中断が発生する可能性があり、長時間実行タスクや本番ワークロードには適しません。ユーザーサブスクリプションモードを選ぶことで、VNetへの展開やカスタムイメージの活用が可能となり、MPI通信に必要なネットワーク設定を柔軟に行えます。",
      "category": "compute",
      "tags": [
        "subscription-design",
        "batch",
        "vnet"
      ]
    },
    {
      "id": 26,
      "question": ".NETで構築されたWebサービスをホスティングしたいと考えています。一時ファイルの書き込み、イベントログの記録が必要で、コストもなるべく低く抑えたい場合、どのサービスが適切ですか？",
      "choices": [
        "A. Azure Functions",
        "B. Virtual Machine Scale Sets (VMSS)",
        "C. App Service Environment (ASE)",
        "D. App Service Web Apps"
      ],
      "answer": 3,
      "explanation": "App Service Web Appsは.NET Webサービスのホスティングに最適であり、一時ファイルの書き込み（一時ストレージ提供）やイベントログ記録にも対応しています。VMSSやASEと比べてコストも低く抑えられます。Azure Functionsはイベント駆動型のサーバーレスサービスで、常時稼働のWebサービスホスティングには最善の選択ではありません。VMSSは高いスケーラビリティがありますが、管理・運用コストが増大します。ASEは専用の隔離環境を提供しますが、選択肢の中で最もコストがかかります。",
      "category": "compute",
      "tags": [
        "vmss",
        "virtual-machines",
        "app-service",
        "azure-functions",
        "event-driven"
      ]
    },
    {
      "id": 27,
      "question": "Azure Functionsにおいて5～20分を要する処理を実行する必要があり、イベント駆動のスケーリングも求められます。選ぶべきホスティングプランはどれですか？",
      "choices": [
        "A. 従量課金プラン",
        "B. 専用（App Service）プラン",
        "C. Premiumプラン",
        "D. App Serviceプラン"
      ],
      "answer": 2,
      "explanation": "Premiumプランは実行時間の上限が実質的になく（デフォルト30分、最大60分まで拡張可能）、イベント駆動型のスケーリングにも対応しています。従量課金プランでは実行時間が最大10分（デフォルト5分）に制限されるため、20分の処理には対応できません。専用（App Service）プランは実行時間制限こそありませんが、イベント駆動型のスケーリングはサポートされず、手動またはスケジュールによるスケーリングに限定されます。",
      "category": "compute",
      "tags": [
        "app-service",
        "azure-functions",
        "event-driven"
      ]
    },
    {
      "id": 28,
      "question": "Azure Blob Storage内のデータを変換し、Azure Data Lake Storageへ格納する必要があります。マッピングデータフローを活用したい場合に選ぶべきサービスはどれですか？",
      "choices": [
        "A. Azure Storage Sync",
        "B. Azure Data Factory",
        "C. Azure Databricks",
        "D. Azure Data Box Gateway"
      ],
      "answer": 1,
      "explanation": "Azure Data Factoryにはマッピングデータフロー機能が備わっており、コーディング不要でデータ変換をビジュアルに設計できます。Blob StorageからData Lake Storageへのデータ移動と変換を効率よく実行可能です。Azure Storage Syncはオンプレミスとクラウド間のファイル同期サービスです。Azure Databricksはコードベースのデータ処理基盤で、マッピングデータフローの機能は持っていません。Data Box Gatewayはオンプレミスからクラウドへのデータ転送用デバイスです。",
      "category": "data",
      "tags": [
        "entra-connect",
        "blob-storage",
        "data-analytics",
        "file-sync",
        "data-migration"
      ]
    },
    {
      "id": 29,
      "question": "データベースに格納された電話番号のうち末尾4桁のみを表示し、他の部分をマスク処理したい場合、どの機能を使うべきですか？",
      "choices": [
        "A. 列の暗号化",
        "B. 透過的データ暗号化（TDE）",
        "C. 動的データマスキング",
        "D. Always Encrypted"
      ],
      "answer": 2,
      "explanation": "動的データマスキングを使えば、クエリ結果でデータの一部をマスクして表示するルールを設定できます。電話番号の末尾4桁だけを見せるカスタムマスクの定義も可能です。データそのものは暗号化されず、表示の段階でのみマスクが適用されます。列の暗号化はデータを暗号化しますが、部分表示の制御はできません。TDEはデータベース全体の保存時暗号化で、表示制御とは無関係です。Always Encryptedはクライアント側暗号化のため、部分的なデータ表示の制御には使いません。",
      "category": "security",
      "tags": [
        "sql-security"
      ]
    },
    {
      "id": 30,
      "question": "データベース内のSSN（社会保障番号）を、データベース管理者も含め一切閲覧できないように保護する必要があります。適切な機能はどれですか？",
      "choices": [
        "A. 列の暗号化",
        "B. 透過的データ暗号化（TDE）",
        "C. 動的データマスキング",
        "D. Always Encrypted"
      ],
      "answer": 3,
      "explanation": "Always Encryptedはクライアント側でデータを暗号化し、データベースエンジン上では暗号化されたまま保持する仕組みです。暗号化キーはクライアントアプリケーション側で管理されるため、データベース管理者であっても復号してデータを参照することはできません。列の暗号化やTDEはサーバー側での暗号化であり、管理者がデータにアクセスできてしまいます。動的データマスキングは表示時のマスク処理ですが、管理者はマスクを外せるため「管理者含め閲覧不可」の条件を満たしません。",
      "category": "security",
      "tags": [
        "sql-security"
      ]
    }
  ]
};
