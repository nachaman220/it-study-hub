var QUIZ_DATA_book_ch2 = {
  "source": "original",
  "questions": [
    {
      "id": 1,
      "question": "Premiumアクセス層で最高のパフォーマンスと最大限の冗長性を確保できるストレージアカウントを構成する必要があります。選択すべきストレージアカウントの種類と冗長性オプションの組み合わせはどれですか？",
      "choices": [
        "A. Premium BlockBlobStorage、LRS",
        "B. Premium BlockBlobStorage、ZRS",
        "C. Premium BlockBlobStorage、GRS",
        "D. General Purpose v2 Premium、RA-GRS"
      ],
      "answer": 1,
      "explanation": "Premiumストレージアカウントで利用可能な冗長性オプションはLRSとZRSに限られます。GRSやRA-GRSはPremiumでは選択できません。より高い冗長性を得るにはZRS（ゾーン冗長ストレージ）が最適で、3つの可用性ゾーンにデータを複製します。LRSは単一データセンター内に3つのコピーを保持するだけなので、ZRSの方が冗長性で優れています。",
      "category": "data",
      "tags": [
        "azure-storage",
        "blob-storage",
        "availability-zones"
      ]
    },
    {
      "id": 2,
      "question": "容量10GB程度のデータを格納し、読み取り速度を高めつつストレージ費用を最小限にしたいと考えています。どのAzureサービスが適切ですか？",
      "choices": [
        "A. Azure Files Premium",
        "B. Azure Blob Storage",
        "C. Azure Managed Disks",
        "D. Azure Table Storage"
      ],
      "answer": 1,
      "explanation": "Azure Blob Storageは非構造化データの格納に最適化されており、アクセス層（Hot/Cool/Cold/Archive）の選択によってストレージコストを調整できます。10GB程度のデータであれば、Hotアクセス層で十分高速な読み取りが可能です。Azure Files Premiumはファイル共有用途で割高になります。Managed Disksは仮想マシン専用のディスクサービスです。Table Storageは構造化されたKey-Valueデータ向けです。",
      "category": "data",
      "tags": [
        "blob-storage",
        "virtual-machines"
      ]
    },
    {
      "id": 3,
      "question": "世界各地に分散するアプリケーションを開発しています。複数リージョンでの書き込みと99.999%の可用性SLAが求められます。どのAzureサービスを選ぶべきですか？",
      "choices": [
        "A. Azure SQL Database geo レプリケーション",
        "B. Azure Cosmos DB",
        "C. Azure Database for PostgreSQL Hyperscale",
        "D. Azure Cache for Redis"
      ],
      "answer": 1,
      "explanation": "Azure Cosmos DBはマルチリージョン書き込み（マルチマスター）に対応しており、複数リージョン構成で99.999%の可用性SLAを提供します。これはAzureサービスの中で最高水準のSLAです。Azure SQL Databaseのgeoレプリケーションは読み取りレプリカ方式のため、マルチリージョン書き込みには対応しません。PostgreSQL HyperscaleはCitusベースの分散DBですが、99.999%のSLA保証はありません。Redis Cacheはキャッシュ層であり、永続的なデータストアとしては設計されていません。",
      "category": "data",
      "tags": [
        "sql-database",
        "cosmosdb",
        "bcdr-fundamentals",
        "sql-ha",
        "caching"
      ]
    },
    {
      "id": 4,
      "question": "Azure Cosmos DBでクエリのスケーラビリティを最適化したいと考えています。クロスパーティションクエリを回避し、効率的にデータへアクセスするために最も重要となる設計上の要素はどれですか？",
      "choices": [
        "A. インデックスポリシー",
        "B. 整合性レベル",
        "C. パーティションキー",
        "D. スループット（RU/s）"
      ],
      "answer": 2,
      "explanation": "適切なパーティションキーの選定は、Cosmos DBのスケーラビリティにおける最重要設計事項です。パーティションキーを正しく選ぶことで、データが均等に分散されクロスパーティションクエリを回避できます。インデックスポリシーはクエリ性能に影響を与えますが、スケーリングの根本的な要素ではありません。整合性レベルはデータの一貫性設定に関するものです。スループットはパフォーマンスの割り当て量であり、データ配置の設計とは別の観点です。",
      "category": "data",
      "tags": [
        "cosmosdb",
        "cosmosdb-params"
      ]
    },
    {
      "id": 5,
      "question": "Azure SQLのデプロイ形態を検討中です。複数のデータベースをまたいでクエリを実行する必要がある場合、どのオプションを選ぶべきですか？",
      "choices": [
        "A. Azure SQL Database 単一データベース",
        "B. Azure SQL Database エラスティックプール",
        "C. Azure SQL Managed Instance",
        "D. Azure SQL Database サーバーレス"
      ],
      "answer": 2,
      "explanation": "Azure SQL Managed Instance（MI）はクロスデータベースクエリをネイティブにサポートしています。複数DB間でのJOINやトランザクション実行が可能です。Azure SQL Database（単一DB、エラスティックプール、サーバーレス）ではクロスデータベースクエリは基本的にサポートされません（エラスティッククエリによる限定的な読み取りは可能）。MIはSQL Serverとの高い互換性を備え、オンプレミスからの移行先としても適しています。",
      "category": "data",
      "tags": [
        "sql-database",
        "azure-functions",
        "data-migration"
      ]
    },
    {
      "id": 6,
      "question": "データウェアハウスおよびOLAP（オンライン分析処理）の基盤を構築する必要があります。大規模な構造化データに対して高度な分析クエリを実行する場合、どのサービスが最適ですか？",
      "choices": [
        "A. Azure SQL Database",
        "B. Azure Synapse Analytics 専用SQLプール",
        "C. Azure Cosmos DB",
        "D. Azure Database for PostgreSQL"
      ],
      "answer": 1,
      "explanation": "Azure Synapse Analytics 専用SQLプールは、超並列処理（MPP）アーキテクチャを採用したエンタープライズ向けデータウェアハウスです。大量データに対するOLAPクエリ向けに最適化されており、列ストア圧縮やパーティション分割で高速な分析処理を実現します。Azure SQL DatabaseはOLTP用途に適しており、大規模OLAPには向きません。Cosmos DBはNoSQLデータベースです。PostgreSQLは汎用RDBMSですが、大規模DWH用途には専用SQLプールが適切です。",
      "category": "data",
      "tags": [
        "data-fundamentals",
        "sql-database",
        "cosmosdb",
        "data-analytics"
      ]
    },
    {
      "id": 7,
      "question": "複数のデータソースからデータを抽出・変換・読み込み（ETL）するパイプラインを構築したいと考えています。最適なAzureサービスはどれですか？",
      "choices": [
        "A. Azure Stream Analytics",
        "B. Azure Data Factory",
        "C. Azure Event Hubs",
        "D. Azure Logic Apps"
      ],
      "answer": 1,
      "explanation": "Azure Data FactoryはETL/ELTパイプラインの構築に特化したフルマネージドサービスで、90種以上のコネクタを備えノーコードでデータフローを設計可能です。Stream Analyticsはリアルタイムのストリーム処理向けです。Event Hubsはイベント取り込みサービスであり、データ変換の機能は持ちません。Logic Appsはワークフロー自動化向けですが、大規模ETL処理には不向きです。",
      "category": "data",
      "tags": [
        "data-sources",
        "data-analytics",
        "event-driven",
        "api-management",
        "automation-deploy"
      ]
    },
    {
      "id": 8,
      "question": "IoTデバイスが送信するリアルタイムのデータストリームを処理する必要があります。毎秒数百万件規模のイベントを受け入れ可能なサービスはどれですか？",
      "choices": [
        "A. Azure Service Bus",
        "B. Azure Event Hubs",
        "C. Azure Queue Storage",
        "D. Azure Notification Hubs"
      ],
      "answer": 1,
      "explanation": "Azure Event Hubsは毎秒数百万件のイベント取り込みが可能な大規模ストリーミングプラットフォームです。IoT端末やアプリケーションから送られる大量のテレメトリデータをリアルタイムで処理するのに最適です。Service Busはエンタープライズ向けメッセージングに強みがありますが、大規模ストリーム処理には不向きです。Queue Storageはシンプルなキュー機能です。Notification Hubsはモバイルプッシュ通知のサービスです。",
      "category": "data",
      "tags": [
        "messaging",
        "event-driven"
      ]
    },
    {
      "id": 9,
      "question": "構造化データを保管し、ACID準拠のトランザクション処理を求めるアプリケーションを開発しています。どのAzureサービスが適していますか？",
      "choices": [
        "A. Azure Cosmos DB",
        "B. Azure SQL Database",
        "C. Azure Blob Storage",
        "D. Azure Table Storage"
      ],
      "answer": 1,
      "explanation": "Azure SQL Databaseはフルマネージドのリレーショナルデータベースで、ACID準拠のトランザクション処理を完全にサポートします。構造化データの格納とSQLクエリに最適な選択肢です。Cosmos DBもトランザクション機能を備えていますが、主にNoSQLワークロード向けに設計されています。Blob Storageは非構造化データ用でトランザクション処理には対応しません。Table StorageはNoSQLのKey-Valueストアであり、完全なACIDトランザクションには対応していません。",
      "category": "data",
      "tags": [
        "data-fundamentals",
        "blob-storage",
        "sql-database",
        "cosmosdb",
        "containers"
      ]
    },
    {
      "id": 10,
      "question": "大量の非構造化データを長期にわたって保管する必要があります。データへのアクセスはほとんど発生せず、ストレージ費用をできる限り抑えたいと考えています。どのストレージオプションが最適ですか？",
      "choices": [
        "A. Azure Blob Storage Hotアクセス層",
        "B. Azure Blob Storage Coolアクセス層",
        "C. Azure Blob Storage Archiveアクセス層",
        "D. Azure Files Premium"
      ],
      "answer": 2,
      "explanation": "Azure Blob StorageのArchiveアクセス層はストレージ単価が最も低く、アクセス頻度が極めて低い長期保存データに適しています。ただしデータの読み出しにはリハイドレーション処理（数時間程度）が必要です。Hotアクセス層はアクセスコストが低い反面ストレージ単価が高く、Coolアクセス層はArchiveよりも保管コストが高くなります。Files Premiumはファイル共有向けで、最もコスト高な選択肢です。",
      "category": "data",
      "tags": [
        "blob-storage"
      ]
    },
    {
      "id": 11,
      "question": "Azure SQL Databaseに保存されているデータをサーバー側で暗号化する必要があります。利用すべき機能はどれですか？",
      "choices": [
        "A. Always Encrypted",
        "B. Transparent Data Encryption（TDE）",
        "C. 動的データマスキング",
        "D. Azure Information Protection"
      ],
      "answer": 1,
      "explanation": "Transparent Data Encryption（TDE）はAzure SQL Databaseの保存データ（Data at Rest）をサーバー側で自動的に暗号化する機能です。データベースファイル、トランザクションログ、バックアップのすべてが暗号化対象となり、Azure SQL Databaseでは既定で有効化されています。Always Encryptedはクライアント側暗号化の仕組みです。動的データマスキングはデータ表示を制限する機能であり、暗号化とは異なります。Azure Information Protectionはドキュメント保護向けのサービスです。",
      "category": "data",
      "tags": [
        "sql-database",
        "sql-security",
        "bcdr-fundamentals",
        "azure-backup"
      ]
    },
    {
      "id": 12,
      "question": "Azure SQL Database内の機密データをクライアント側で暗号化し、DB管理者であっても平文のデータを閲覧できないようにする必要があります。どの機能を利用すべきですか？",
      "choices": [
        "A. Transparent Data Encryption（TDE）",
        "B. Always Encrypted",
        "C. 行レベルセキュリティ",
        "D. 列レベルの暗号化"
      ],
      "answer": 1,
      "explanation": "Always Encryptedはクライアント側でデータを暗号化し、暗号鍵はデータベースエンジンには渡りません。そのためDB管理者（DBA）でさえ平文データを参照することが不可能です。TDEはサーバー側の暗号化であるため、DBAはデータにアクセスできます。行レベルセキュリティはアクセス制御の仕組みで暗号化ではありません。列レベルの暗号化はT-SQLで実装可能ですが、Always Encryptedほどの保護強度はありません。",
      "category": "data",
      "tags": [
        "sql-database",
        "sql-security"
      ]
    },
    {
      "id": 13,
      "question": "オンプレミスで稼働中のMongoDBアプリケーションをAzureへ移行する計画です。コード変更を最小限にとどめたい場合、Azure Cosmos DBのどのAPIを選択すべきですか？",
      "choices": [
        "A. NoSQL API",
        "B. MongoDB API",
        "C. Cassandra API",
        "D. Table API"
      ],
      "answer": 1,
      "explanation": "Azure Cosmos DB for MongoDB（MongoDB API）を利用すれば、既存のMongoDBアプリケーションのコードをほぼ変更せずにCosmos DBへ移行できます。MongoDBのドライバーやツールをそのまま活用でき、クエリ構文も互換性があります。NoSQL APIはCosmos DB独自のネイティブAPIです。Cassandra APIはApache Cassandraワークロード向けです。Table APIはAzure Table Storage互換のインターフェースです。",
      "category": "data",
      "tags": [
        "data-fundamentals",
        "cosmosdb",
        "data-migration"
      ]
    },
    {
      "id": 14,
      "question": "Azure Cosmos DBでSLAに基づく予約済みスループットを確保したいと考えています。適切なスループットモデルと課金単位の組み合わせはどれですか？",
      "choices": [
        "A. サーバーレススループット、DTU",
        "B. プロビジョニングスループット、RU（要求ユニット）",
        "C. 自動スケールスループット、IOPS",
        "D. サーバーレススループット、RU（要求ユニット）"
      ],
      "answer": 1,
      "explanation": "プロビジョニングスループットではRU/s（要求ユニット/秒）で固定のスループットを事前に確保し、SLAに裏付けされたパフォーマンスが保証されます。RU（Request Unit）はCosmos DB固有の課金・パフォーマンス指標です。サーバーレスは従量課金方式であり、SLA保証のレベルが異なります。DTUはAzure SQL Database固有の単位でCosmos DBでは使いません。IOPSはストレージのパフォーマンス指標です。",
      "category": "data",
      "tags": [
        "sql-database",
        "cosmosdb",
        "cosmosdb-params",
        "azure-functions"
      ]
    },
    {
      "id": 15,
      "question": "Azure Data Lake Storage Gen2の特徴として正しいものを2つ選んでください。",
      "choices": [
        "A. 階層型名前空間をサポートする",
        "B. ACL（アクセス制御リスト）によるきめ細かなアクセス制御が可能",
        "C. ページBlobのみをサポートする",
        "D. Standard Storageアカウントでは使用できない",
        "E. Azure Blob Storage APIとは互換性がない"
      ],
      "answer": [
        0,
        1
      ],
      "explanation": "ADLS Gen2は階層型名前空間（Hierarchical Namespace: HNS）に対応しており、ディレクトリ単位の操作を高速に処理できます。さらにPOSIX準拠のACLにより、ファイルやディレクトリ単位できめ細かなアクセス制御を設定可能です。対応するBlobの種類はブロックBlobです。Standard StorageアカウントでもHNSを有効にすればADLS Gen2として利用できます。Blob Storage APIとの互換性も維持されています。",
      "category": "data",
      "tags": [
        "resource-locks",
        "blob-storage",
        "data-analytics"
      ]
    },
    {
      "id": 16,
      "question": "Azure Blob Storageのライフサイクル管理ポリシーの適用対象となるBlobの種類はどれですか？",
      "choices": [
        "A. ブロックBlobのみ",
        "B. ページBlobのみ",
        "C. 追加Blobのみ",
        "D. すべてのBlobの種類"
      ],
      "answer": 0,
      "explanation": "Azure Blob Storageのライフサイクル管理ポリシーはブロックBlobのみを対象とします。この機能を使えば、ブロックBlobのアクセス層移行（Hot→Cool→Cold→Archive）や自動削除をルールベースで運用できます。ページBlob（VMディスク等）や追加Blob（ログ追記用等）はライフサイクル管理の対象外です。",
      "category": "data",
      "tags": [
        "resource-locks",
        "blob-storage",
        "automation-deploy"
      ]
    },
    {
      "id": 17,
      "question": "オンプレミスのHadoop環境で利用しているHDFS（Hadoop Distributed File System）をAzureへ移行する計画です。HDFSの代わりとして最適なAzureサービスはどれですか？",
      "choices": [
        "A. Azure Blob Storage",
        "B. Azure Data Lake Storage Gen2",
        "C. Azure Files",
        "D. Azure Managed Disks"
      ],
      "answer": 1,
      "explanation": "Azure Data Lake Storage Gen2（ADLS Gen2）はHDFS互換のファイルシステムインターフェースを提供しており、SparkやHiveなどのHadoopエコシステムからシームレスに利用可能です。階層型名前空間により高速なディレクトリ操作が可能で、ビッグデータ分析向けに設計されています。Blob StorageもHDFSドライバー経由のアクセスは可能ですが、ADLS Gen2の方がパフォーマンスと機能面で優位です。Azure FilesはSMB/NFSファイル共有用、Managed DisksはVM用のディスクサービスです。",
      "category": "data",
      "tags": [
        "blob-storage",
        "data-analytics",
        "data-migration"
      ]
    },
    {
      "id": 18,
      "question": "規制上の要件により、Azure Blob Storage内のデータを一定期間にわたって変更も削除もできないようにする必要があります。どの機能を使うべきですか？",
      "choices": [
        "A. 論理的な削除",
        "B. 時間ベースの保持ポリシー（不変ストレージ）",
        "C. Blobのバージョン管理",
        "D. ストレージアカウントのロック"
      ],
      "answer": 1,
      "explanation": "時間ベースの保持ポリシー（不変ストレージ）を適用すると、指定期間中はBlobの変更や削除が一切できなくなります。WORM（Write Once, Read Many）ストレージとして機能し、金融や医療分野などの規制要件に適合します。論理的な削除は削除後にデータを復元可能にする機能で、変更防止にはなりません。バージョン管理は変更履歴の追跡が目的であり、変更そのものは許可されます。ストレージアカウントのロックはリソース自体の削除防止用です。",
      "category": "data",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage"
      ]
    },
    {
      "id": 19,
      "question": "Azure Synapse Analyticsについて、以下の2つの記述の正誤の組み合わせとして正しいものはどれですか？\n・ハッシュ分散テーブルは専用SQLプールで利用できる\n・Delta Lakeの更新操作にはSparkプールが必要である",
      "choices": [
        "A. 両方正しい",
        "B. ハッシュ分散テーブルの記述のみ正しい",
        "C. Delta Lakeの記述のみ正しい",
        "D. 両方誤り"
      ],
      "answer": 0,
      "explanation": "ハッシュ分散テーブルは専用SQLプールにおけるテーブル分散方式の1つで、指定カラムの値をもとにデータを60のディストリビューションに振り分けます。大規模なファクトテーブルに向いています。Delta LakeのUPDATE/DELETE/MERGE操作はApache Sparkエンジン上で実行されるため、Synapse AnalyticsではSparkプールを使う必要があります。専用SQLプールからDelta Lakeテーブルの読み取りは可能ですが、更新処理にはSparkプールが不可欠です。",
      "category": "data",
      "tags": [
        "data-analytics"
      ]
    },
    {
      "id": 20,
      "question": "Azure DatabricksでAzure Active Directoryの資格情報パススルーを有効にしたい場合、どの価格レベルのDatabricksが必要ですか？",
      "choices": [
        "A. Standard",
        "B. Premium",
        "C. Trial",
        "D. StandardまたはPremium"
      ],
      "answer": 1,
      "explanation": "Azure Active Directory（Microsoft Entra ID）の資格情報パススルー機能は、Azure Databricks Premiumプラン限定の機能です。この機能により、ユーザーのEntra ID認証情報を使ってAzure Data Lake Storageなどのリソースにアクセスできるようになります。Standardプランでは利用できません。Trialプランは評価目的であり、本番環境での利用は想定されていません。",
      "category": "data",
      "tags": [
        "entra-id",
        "data-analytics"
      ]
    },
    {
      "id": 21,
      "question": "Azure Synapse Analyticsで、Azure Cosmos DBのデータをETLプロセスなしにリアルタイムで分析するために利用する機能はどれですか？",
      "choices": [
        "A. Azure Data Factory統合",
        "B. Synapse Link",
        "C. PolyBase",
        "D. COPY INTO ステートメント"
      ],
      "answer": 1,
      "explanation": "Synapse Linkは、Azure Cosmos DBのデータをETLパイプラインを構築せずにSynapse Analyticsへリアルタイム同期する機能です。Cosmos DBの分析ストア（列ストア形式）を活用し、OLTPワークロードへの影響なく分析クエリを実行できます。Data FactoryはETLパイプラインを構築する方式でリアルタイムではありません。PolyBaseやCOPY INTOは外部データのロード手段であり、Cosmos DBとのリアルタイム連携機能ではありません。",
      "category": "data",
      "tags": [
        "entra-connect",
        "cosmosdb",
        "data-analytics"
      ]
    },
    {
      "id": 22,
      "question": "Azure Cosmos DB for PostgreSQLの機能に関する記述として正しいものはどれですか？",
      "choices": [
        "A. マルチリージョン分散とマルチマスター書き込みの両方をサポートする",
        "B. マルチリージョン分散をサポートするが、マルチマスター書き込みはサポートしない",
        "C. マルチマスター書き込みをサポートするが、マルチリージョン分散はサポートしない",
        "D. マルチリージョン分散もマルチマスター書き込みもサポートしない"
      ],
      "answer": 1,
      "explanation": "Azure Cosmos DB for PostgreSQL（旧Hyperscale (Citus)）はPostgreSQL互換の分散データベースであり、データの複数リージョンへの分散配置をサポートします。ただしマルチマスター書き込み（マルチリージョン書き込み）には対応しておらず、書き込みはコーディネーターノード経由で行われます。マルチマスター書き込みはCosmos DBのNoSQL APIなどで提供される機能です。",
      "category": "data",
      "tags": [
        "data-fundamentals",
        "sql-database",
        "cosmosdb"
      ]
    }
  ]
};
