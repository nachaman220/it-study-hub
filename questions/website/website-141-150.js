var QUIZ_DATA_website_141_150 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 141,
      "question": "あなたは機密データ用の Azure Storage ソリューションを計画しています。データは毎日アクセスされます。データセットは 10 GB 未満です。 次の要件を満たすストレージ ソリューションを推奨する必要があります。 何を勧めるべきですか。 ストレージ アカウントの種類:・ ストレージに書き込まれたすべてのデータは 5 年間保持する必要がある。・ データが書き込まれた後は、データの読み取りのみが可能になる。変更と削除は防止する必要がある。・ 5 年が経過すると、データは削除できるが、変更することはできない。・ データアクセス料金は最小限に抑える必要がある。",
      "choices": [
        "BLOB のクール アクセス層を備えた汎用 v2",
        "Premium ブロック BLOB",
        "BLOB のホット アクセス層を備えた汎用 v2"
      ],
      "answer": 2,
      "explanation": "ホット アクセス層は、クール アクセス層に比べてデータ アクセス コストが低いため、毎日データにアクセスする場合の料金を最小限に抑えるのに適しています。クール層はストレージ コストが低くなりますが、データ アクセス料金が高くなるため、お客様のシナリオには理想的ではありません。 Premium ブロック BLOB は高パフォーマンスのシナリオ向けであり、10 GB 未満の小さなデータセットには必要ありません。https://azure.microsoft.com/ja-jp/pricing/details/storage/blobs/",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 142,
      "question": "あなたは機密データ用の Azure Storage ソリューションを計画しています。データは毎日アクセスされます。データセットは 10 GB 未満です。 次の要件を満たすストレージ ソリューションを推奨する必要があります。 何を勧めるべきですか。 変更と削除を防ぐための構成:・ ストレージに書き込まれたすべてのデータは 5 年間保持する必要がある。・ データが書き込まれた後は、データの読み取りのみが可能になる。変更と削除は防止する必要がある。・ 5 年が経過すると、データは削除できるが、変更することはできない。・ データアクセス料金は最小限に抑える必要がある。",
      "choices": [
        "ストレージ アカウントのリソース ロック",
        "不変ポリシー",
        "コンテナーのアクセス レベル"
      ],
      "answer": 1,
      "explanation": "特定のアクセス許可 (この場合は読み取り専用) を持つ不変ポリシーを作成し、5 年の有効期限を設定できます。このポリシーは、データの読み取りを許可しながら、変更や削除を防ぎます。 5 年後にポリシーは期限切れになり、データは削除できますが、変更することはできません。ストレージ アカウントのリソース ロックとコンテナーのアクセス レベル設定では、コンテナー アクセス ポリシーと同じ粒度でデータを制御できません。https://learn.microsoft.com/ja-jp/azure/storage/blobs/immutable-storage-overview",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "containers"
      ]
    },
    {
      "id": 143,
      "question": "※1の表に示す Azure サブスクリプションがあります。 Contoso.onmicrosft.com には、User1 という名前のユーザーが含まれています。 ランサムウェア攻撃から保護するソリューションを展開する必要があります。ソリューションは※2の要件を満たす必要があります。 各サブスクリプションで何を作成する必要がありますか。 Sub1:※1名前 | ロケーション | Microsoft Entra テナント--------------------------------------------------Sub1 | 米国東部 | contoso.onmicrosoft.comSub2 | 米国東部 | contoso-recovery.onmicrosoft.com※2・ Sub1 のすべてのリソースが Azure Backup を使用してバックアップされていることを確認する。・ ユーザーがバックアップ構成に大きな変更を加える前に、まず User1 に Sub2 のロールを割り当てる必要がある。",
      "choices": [
        "Azure Site Recovery ジョブ",
        "Microsoft Azure Backup Server (MABS)",
        "Recovery Services コンテナー",
        "Microsoft Azure Recovery Services (MARS) エージェント",
        "Resource Guard"
      ],
      "answer": 2,
      "explanation": "※1名前 | ロケーション | Microsoft Entra テナント--------------------------------------------------Sub1 | 米国東部 | contoso.onmicrosoft.comSub2 | 米国東部 | contoso-recovery.onmicrosoft.com※2・ Sub1 のすべてのリソースが Azure Backup を使用してバックアップされていることを確認する。・ ユーザーがバックアップ構成に大きな変更を加える前に、まず User1 に Sub2 のロールを割り当てる必要がある。",
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
      "question": "※1の表に示す Azure サブスクリプションがあります。 Contoso.onmicrosft.com には、User1 という名前のユーザーが含まれています。 ランサムウェア攻撃から保護するソリューションを展開する必要があります。ソリューションは※2の要件を満たす必要があります。 各サブスクリプションで何を作成する必要がありますか。 Sub2:※1名前 | ロケーション | Microsoft Entra テナント--------------------------------------------------Sub1 | 米国東部 | contoso.onmicrosoft.comSub2 | 米国東部 | contoso-recovery.onmicrosoft.com※2・ Sub1 のすべてのリソースが Azure Backup を使用してバックアップされていることを確認する。・ ユーザーがバックアップ構成に大きな変更を加える前に、まず User1 に Sub2 のロールを割り当てる必要がある。",
      "choices": [
        "Azure Site Recovery ジョブ",
        "Microsoft Azure Backup Server (MABS)",
        "Recovery Services コンテナー",
        "Microsoft Azure Recovery Services (MARS) エージェント",
        "Resource Guard"
      ],
      "answer": 4,
      "explanation": "この記事では、Azure Backup のマルチユーザー承認 (MUA) を構成して、Recovery Services コンテナーに対する重要な操作に保護レイヤーを追加する方法について説明します。 この記事では、最大限の保護を提供する別のテナントでの Resource Guard の作成について説明します。 Resource Guard を収容するテナントで Microsoft Entra Privileged Identity Management を使用して、重要な操作を実行するための要求を行う方法と、その要求を承認する方法についても説明します。 必要に応じて、他のメカニズムを使用して、設定に従って Resource Guard に対する JIT アクセス許可を管理できます。https://learn.microsoft.com/ja-jp/azure/backup/multi-user-authorization?tabs=azure-portal&pivots=vaults-recovery-services-vault",
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
      "question": "オンプレミスのストレージ ソリューションがあります。 ソリューションを Azure に移行する必要があります。ソリューションは Hadoop 分散ファイル システム (HDFS) をサポートする必要があります。 何を使えばよいですか。",
      "choices": [
        "Azure Data Share",
        "Azure Data Lake Storage Gen2",
        "Azure Table Storage",
        "Azure NetApp Files"
      ],
      "answer": 1,
      "explanation": "オンプレミスのストレージ ソリューションがあります。 ソリューションを Azure に移行する必要があります。ソリューションは Hadoop 分散ファイル システム (HDFS) をサポートする必要があります。 何を使えばよいですか。",
      "category": "",
      "tags": [
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 146,
      "question": "あなたは、Web アプリケーションをサポートするマイクロサービス アーキテクチャを設計しています。 ソリューションは次の要件を満たす必要があります。 テクノロジーを推奨する必要があります。 何を勧めるべきですか。・ ソリューションをオンプレミスと Azure にデプロイする。・ 低遅延およびハイパースケールの操作をサポートする。・ 各マイクロサービスへの独立したアップグレードを許可する。・ マイクロサービスの自動修復を実行するためのポリシーを設定する。",
      "choices": [
        "Azure Service Fabric",
        "Azure Container Instance",
        "Azure Logic App",
        "Azure Virtual Machine Scale Sets"
      ],
      "answer": 0,
      "explanation": "Azure Service Fabric を使用すると、オンプレミスまたは他のクラウドに Service Fabric クラスターを作成できます。Azure Service Fabric は待機時間が短く、数千台のマシンまでスケールアップできます。https://azure.microsoft.com/ja-jp/products/service-fabric/",
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
      "question": "あなたの会社は、社内のオンプレミス データ センターで販売、財務、およびレポート アプリケーションをホストする仮想マシンのビジネス継続性とディザスタ リカバリの次の目標を特定しています。 ビジネス継続性と災害復旧の目標を満たすサービスを推奨する必要があります。 ソリューションではコストを最小限に抑える必要があります。 それぞれのアプリケーションに何を推奨する必要がありますか。 販売アプリケーション:・ 販売アプリケーションは、2 番目のオンプレミス データ センターにフェイルオーバーできる必要があります。・ レポート アプリケーションは、毎日の粒度でポイントインタイム データを回復できなければなりません。 RTO は 8 時間です。・ 財務アプリケーションでは、データを 7 年間保持する必要があります。災害が発生した場合、アプリケーションは Azure から実行できる必要があります。目標復旧時間 (RTO) は 10 分です。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 0,
      "explanation": "Azure Site Recovery 仮想マシンと物理サーバーのレプリケーション、フェイルオーバー、フルバックを調整します。 DR ソリューションの目標復旧時点は低いです。 DR コピーは数秒/数分遅れる可能性があります。 DR には運用上のリカバリ データのみが必要ですが、これには数時間から 1 日かかる場合があります。きめ細かいデータキャプチャが行われるため、DR データを長期保存に使用することはお勧めできません。 災害復旧ソリューションは、ソースとの同期がより高いため、目標復旧時間は短くなります。 マシンの状態をリモート監視し、カスタマイズ可能な復旧計画を作成します。https://learn.microsoft.com/ja-jp/azure/site-recovery/site-recovery-overview",
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
      "question": "あなたの会社は、社内のオンプレミス データ センターで販売、財務、およびレポート アプリケーションをホストする仮想マシンのビジネス継続性とディザスタ リカバリの次の目標を特定しています。 ビジネス継続性と災害復旧の目標を満たすサービスを推奨する必要があります。 ソリューションではコストを最小限に抑える必要があります。 それぞれのアプリケーションに何を推奨する必要がありますか。 レポートアプリケーション:・ 販売アプリケーションは、2 番目のオンプレミス データ センターにフェイルオーバーできる必要があります。・ レポート アプリケーションは、毎日の粒度でポイントインタイム データを回復できなければなりません。 RTO は 8 時間です。・ 財務アプリケーションでは、データを 7 年間保持する必要があります。災害が発生した場合、アプリケーションは Azure から実行できる必要があります。目標復旧時間 (RTO) は 10 分です。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 1,
      "explanation": "Azure Backup は、オンプレミスとクラウドのデータをバックアップします。許容可能な目標復旧時点には大きなばらつきがあります。 VM のバックアップは通常 1 日ですが、データベースのバックアップは最短 15 分です。バックアップ データは通常 30 日以内に保持されます。コンプライアンスの観点から、データは何年にもわたって保存する必要がある場合があります。このような場合のアーカイブには、バックアップ データが最適です。目標復旧時点が大きいため、バックアップ ソリューションで処理する必要があるデータの量は通常より多くなり、目標復旧時間も長くなります。",
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
      "question": "あなたの会社は、社内のオンプレミス データ センターで販売、財務、およびレポート アプリケーションをホストする仮想マシンのビジネス継続性とディザスタ リカバリの次の目標を特定しています。 ビジネス継続性と災害復旧の目標を満たすサービスを推奨する必要があります。 ソリューションではコストを最小限に抑える必要があります。 それぞれのアプリケーションに何を推奨する必要がありますか。 財務アプリケーション:・ 販売アプリケーションは、2 番目のオンプレミス データ センターにフェイルオーバーできる必要があります。・ レポート アプリケーションは、毎日の粒度でポイントインタイム データを回復できなければなりません。 RTO は 8 時間です。・ 財務アプリケーションでは、データを 7 年間保持する必要があります。災害が発生した場合、アプリケーションは Azure から実行できる必要があります。目標復旧時間 (RTO) は 10 分です。",
      "choices": [
        "Azure Site Recovery のみ",
        "Azure Backupのみ",
        "Azure Site Recovery と Azure Backup"
      ],
      "answer": 2,
      "explanation": "Azure Site Recovery と Azure BackupAzure Backupにより、データの安全性と回復可能性が確保され、Site Recovery により、停止が発生した場合でもワークロードを利用できる状態が維持されます。",
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
      "question": "あなたは、Azure Cosmos DB を使用して複数の国からの売上を照合するアプリを設計しています。 アプリの API を推奨する必要があります。ソリューションは次の要件を満たす必要があります。 どの API をお勧めしますか。・ SQL クエリをサポートする。・ geo レプリケーションをサポートする。・ データをリレーショナルに保存し、アクセスする。",
      "choices": [
        "MongoDB",
        "Apache Cassandra",
        "PostgreSQL",
        "NoSQL"
      ],
      "answer": 2,
      "explanation": "Azure Cosmos DB の PostgreSQL 用 API は、SQL クエリ、geo レプリケーションを完全にサポートし、データをリレーショナルに保存してアクセスできるようにします。これは、自動かつ即時のスケーラビリティ、グローバル分散、Azure リージョン間でのデータの簡単なレプリケーションを提供するため、要件をすべて満たします。Apache Cassandra は、SQL クエリをネイティブにサポートしない NoSQL データベースです。 SQL に似た機能をいくつか提供していますが、完全なリレーショナル データベースではありません。MongoDB は NoSQL データベースであり、SQL に似たクエリ言語を提供しますが、リレーショナル データ モデルをサポートしません。NoSQL はデータを保存および取得できるデータベース設計の一種ですが、特定の API ではありません。また、すべての NoSQL データベースが SQL クエリとリレーショナル データ ストレージをサポートしているわけではありません。https://learn.microsoft.com/ja-jp/azure/cosmos-db/choose-api",
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
