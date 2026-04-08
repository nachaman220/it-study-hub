var QUIZ_DATA_website_141_150 = {
  "source": "original",
  "questions": [
    {
      "id": 141,
      "question": "機密データ向けの Azure Storage ソリューションを計画しています。データは毎日アクセスされ、データセットの容量は 10 GB 未満です。以下の条件を満たすストレージアカウントの種類はどれですか。・ 書き込まれたすべてのデータは 5 年間保持しなければならない。・ 書き込み後はデータの読み取りのみ可能とし、変更と削除を阻止する。・ 5 年経過後はデータの削除は可能だが、変更は引き続き禁止する。・ データアクセスにかかる料金を最小限にする。",
      "choices": [
        "BLOB のクール アクセス層を備えた汎用 v2",
        "Premium ブロック BLOB",
        "BLOB のホット アクセス層を備えた汎用 v2"
      ],
      "answer": 2,
      "explanation": "データに毎日アクセスするため、ホットアクセス層がデータアクセス料金の面で最適です。クール層はストレージ単価は安いですが、アクセスごとの料金が割高になるため、日常的にアクセスするシナリオには不向きです。Premium ブロック BLOB は高パフォーマンス向けであり、10 GB 未満の小規模データセットには過剰です。https://azure.microsoft.com/ja-jp/pricing/details/storage/blobs/",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 142,
      "question": "機密データ向けの Azure Storage ソリューションを計画しています。データは毎日アクセスされ、データセットの容量は 10 GB 未満です。以下の条件を満たすために、変更と削除を防止する構成として適切なものはどれですか。・ 書き込まれたすべてのデータは 5 年間保持しなければならない。・ 書き込み後はデータの読み取りのみ可能とし、変更と削除を阻止する。・ 5 年経過後はデータの削除は可能だが、変更は引き続き禁止する。・ データアクセスにかかる料金を最小限にする。",
      "choices": [
        "ストレージ アカウントのリソース ロック",
        "不変ポリシー",
        "コンテナーのアクセス レベル"
      ],
      "answer": 1,
      "explanation": "不変ポリシーを使えば、読み取り専用のアクセス許可を設定し 5 年間の保持期間を指定できます。このポリシーにより、保持期間中はデータの変更・削除が防止されます。期間満了後はデータの削除は許可されますが変更は不可のままです。リソースロックやコンテナーアクセスレベルでは、このような細かい粒度でのデータ制御はできません。https://learn.microsoft.com/ja-jp/azure/storage/blobs/immutable-storage-overview",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "containers"
      ]
    },
    {
      "id": 143,
      "question": "以下の表（※1）に示す Azure サブスクリプションがあり、contoso.onmicrosoft.com テナントには User1 というユーザーが存在します。ランサムウェア対策のソリューションをデプロイする必要があり、以下の要件（※2）を満たす必要があります。Sub1 に作成すべきリソースはどれですか。※1 名前 | 場所 | Microsoft Entra テナント --- Sub1 | 米国東部 | contoso.onmicrosoft.com / Sub2 | 米国東部 | contoso-recovery.onmicrosoft.com ※2 Sub1 の全リソースが Azure Backup で保護されていること。バックアップ構成への重大な変更を行う前に、User1 に Sub2 でのロール割り当てが必要となること。",
      "choices": [
        "Azure Site Recovery ジョブ",
        "Microsoft Azure Backup Server (MABS)",
        "Recovery Services コンテナー",
        "Microsoft Azure Recovery Services (MARS) エージェント",
        "Resource Guard"
      ],
      "answer": 2,
      "explanation": "Sub1 には Recovery Services コンテナーを作成します。Azure Backup を使用してサブスクリプション内のリソースをバックアップするためのインフラストラクチャとして Recovery Services コンテナーが必要です。",
      "category": "",
      "tags": [
        "entra-id",
        "rbac",
        "subscription-design",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "containers"
      ]
    },
    {
      "id": 144,
      "question": "以下の表（※1）に示す Azure サブスクリプションがあり、contoso.onmicrosoft.com テナントには User1 というユーザーが存在します。ランサムウェア対策のソリューションをデプロイする必要があり、以下の要件（※2）を満たす必要があります。Sub2 に作成すべきリソースはどれですか。※1 名前 | 場所 | Microsoft Entra テナント --- Sub1 | 米国東部 | contoso.onmicrosoft.com / Sub2 | 米国東部 | contoso-recovery.onmicrosoft.com ※2 Sub1 の全リソースが Azure Backup で保護されていること。バックアップ構成への重大な変更を行う前に、User1 に Sub2 でのロール割り当てが必要となること。",
      "choices": [
        "Azure Site Recovery ジョブ",
        "Microsoft Azure Backup Server (MABS)",
        "Recovery Services コンテナー",
        "Microsoft Azure Recovery Services (MARS) エージェント",
        "Resource Guard"
      ],
      "answer": 4,
      "explanation": "Sub2 には Resource Guard を作成します。Azure Backup のマルチユーザー認可（MUA）を構成することで、Recovery Services コンテナーへの重要な操作に追加の保護レイヤーを設けることができます。別テナントに Resource Guard を配置することで最大限の保護が実現され、Microsoft Entra Privileged Identity Management との連携により、重要操作の要求と承認のプロセスを管理できます。https://learn.microsoft.com/ja-jp/azure/backup/multi-user-authorization?tabs=azure-portal&pivots=vaults-recovery-services-vault",
      "category": "",
      "tags": [
        "entra-id",
        "rbac",
        "pim",
        "subscription-design",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "containers"
      ]
    },
    {
      "id": 145,
      "question": "オンプレミスにストレージソリューションがあり、これを Azure へ移行する必要があります。移行先のソリューションは Hadoop 分散ファイルシステム (HDFS) との互換性が求められます。どのサービスを使用すべきですか。",
      "choices": [
        "Azure Data Share",
        "Azure Data Lake Storage Gen2",
        "Azure Table Storage",
        "Azure NetApp Files"
      ],
      "answer": 1,
      "explanation": "Azure Data Lake Storage Gen2 は HDFS と互換性のあるファイルシステムを提供し、Hadoop エコシステムとのシームレスな統合が可能です。既存の HDFS ワークロードの移行先として最適な選択肢です。",
      "category": "",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 146,
      "question": "Web アプリケーションを支えるマイクロサービスアーキテクチャを設計しています。以下の要件を満たすテクノロジーとしてどれを推奨すべきですか。・ オンプレミスと Azure の両方にデプロイ可能であること。・ 低レイテンシかつハイパースケールのオペレーションに対応すること。・ 各マイクロサービスの独立したアップグレードが可能であること。・ マイクロサービスの自動修復ポリシーを設定できること。",
      "choices": [
        "Azure Service Fabric",
        "Azure Container Instance",
        "Azure Logic App",
        "Azure Virtual Machine Scale Sets"
      ],
      "answer": 0,
      "explanation": "Azure Service Fabric はオンプレミスやその他のクラウド環境にもクラスターを作成でき、低レイテンシ動作と数千台規模のスケールアップに対応します。マイクロサービスごとの独立したデプロイ・アップグレードや自動修復機能も備えています。https://azure.microsoft.com/ja-jp/products/service-fabric/",
      "category": "",
      "tags": [
        "sql-database",
        "vmss",
        "virtual-machines",
        "app-service",
        "containers"
      ]
    },
    {
      "id": 147,
      "question": "ある企業がオンプレミスデータセンターで稼働する販売、財務、レポートの各アプリケーションをホストする仮想マシンについて、事業継続性と災害復旧の目標を定めています。コストを最小限に抑えつつ、これらの目標を満たすサービスを推奨する必要があります。販売アプリケーションに推奨すべきサービスはどれですか。・ 販売アプリケーション: 2 番目のオンプレミスデータセンターへのフェイルオーバーが必要。・ レポートアプリケーション: 日次粒度でのポイントインタイムリカバリが必要。RTO は 8 時間。・ 財務アプリケーション: データを 7 年間保持し、災害時は Azure から実行可能にする。RTO は 10 分。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 0,
      "explanation": "販売アプリケーションには Azure Site Recovery が適しています。Site Recovery は仮想マシンや物理サーバーのレプリケーション、フェイルオーバー、フェイルバックを調整し、DR コピーは数秒から数分の遅延で維持されます。2 番目のデータセンターへの迅速なフェイルオーバーを実現でき、カスタマイズ可能な復旧計画とリモート監視機能を提供します。https://learn.microsoft.com/ja-jp/azure/site-recovery/site-recovery-overview",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-monitor",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "virtual-machines"
      ]
    },
    {
      "id": 148,
      "question": "ある企業がオンプレミスデータセンターで稼働する販売、財務、レポートの各アプリケーションをホストする仮想マシンについて、事業継続性と災害復旧の目標を定めています。コストを最小限に抑えつつ、これらの目標を満たすサービスを推奨する必要があります。レポートアプリケーションに推奨すべきサービスはどれですか。・ 販売アプリケーション: 2 番目のオンプレミスデータセンターへのフェイルオーバーが必要。・ レポートアプリケーション: 日次粒度でのポイントインタイムリカバリが必要。RTO は 8 時間。・ 財務アプリケーション: データを 7 年間保持し、災害時は Azure から実行可能にする。RTO は 10 分。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 1,
      "explanation": "レポートアプリケーションには Azure Backup が適しています。Azure Backup はオンプレミスおよびクラウドのデータをバックアップし、VM バックアップは通常日次、データベースバックアップは最短 15 分間隔で取得可能です。コンプライアンス要件に応じて数年にわたるデータ保持にも対応できます。RTO が 8 時間と比較的長いため、バックアップからの復元で十分に対応可能です。",
      "category": "",
      "tags": [
        "purview",
        "blob-storage",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "virtual-machines"
      ]
    },
    {
      "id": 149,
      "question": "ある企業がオンプレミスデータセンターで稼働する販売、財務、レポートの各アプリケーションをホストする仮想マシンについて、事業継続性と災害復旧の目標を定めています。コストを最小限に抑えつつ、これらの目標を満たすサービスを推奨する必要があります。財務アプリケーションに推奨すべきサービスはどれですか。・ 販売アプリケーション: 2 番目のオンプレミスデータセンターへのフェイルオーバーが必要。・ レポートアプリケーション: 日次粒度でのポイントインタイムリカバリが必要。RTO は 8 時間。・ 財務アプリケーション: データを 7 年間保持し、災害時は Azure から実行可能にする。RTO は 10 分。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 2,
      "explanation": "財務アプリケーションには Azure Site Recovery と Azure Backup の両方が必要です。Azure Backup により 7 年間のデータ保持要件を満たしつつデータの安全性と回復性を確保し、Site Recovery により災害発生時に Azure 上でのワークロード実行と 10 分という短い RTO を実現します。",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "virtual-machines"
      ]
    },
    {
      "id": 150,
      "question": "Azure Cosmos DB を活用して複数国の売上データを集約するアプリケーションを設計しています。以下の要件を満たす API としてどれを推奨すべきですか。・ SQL クエリに対応している。・ geo レプリケーションをサポートしている。・ データをリレーショナル形式で保存・アクセスできる。",
      "choices": [
        "MongoDB",
        "Apache Cassandra",
        "PostgreSQL",
        "NoSQL"
      ],
      "answer": 2,
      "explanation": "Azure Cosmos DB の PostgreSQL 用 API は、SQL クエリの完全サポート、geo レプリケーション対応、リレーショナル形式でのデータ保存・アクセスを提供し、すべての要件を満たします。自動的かつ即時のスケーラビリティとグローバル分散を備えています。Apache Cassandra は SQL をネイティブサポートせず、完全なリレーショナルモデルではありません。MongoDB も NoSQL 型であり、リレーショナルデータモデルは非対応です。NoSQL は特定の API ではなく、データベース設計のカテゴリです。https://learn.microsoft.com/ja-jp/azure/cosmos-db/choose-api",
      "category": "",
      "tags": [
        "data-fundamentals",
        "sql-database",
        "cosmosdb",
        "bcdr-fundamentals",
        "sql-ha"
      ]
    }
  ]
};
