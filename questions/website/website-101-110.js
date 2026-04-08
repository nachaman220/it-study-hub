var QUIZ_DATA_website_101_110 = {
  "source": "original",
  "questions": [
    {
      "id": 101,
      "question": "contoso.com および fabrikam.com という 2 つの Microsoft Entra ID テナントが存在し、それぞれ 50 個の Azure サブスクリプションと関連付けられています。Contoso.com テナントには User1 と User2 の 2 名のユーザーが登録されています。以下の条件を最小権限の原則に基づいて実現するには、各ユーザーにどのロールを付与すべきですか。 User1 について: ・ User1 が特定の Azure サブスクリプションの関連付け先となる Microsoft Entra テナントを切り替えられるようにする。・ サブスクリプションが別の Microsoft Entra テナントへ移行された後、そのサブスクリプションに対してフルレベルの権限を持つ Microsoft Entra ID アカウントが存在しない状況で、User2 のアクセス権限をサブスクリプションに対して引き上げられるようにする。",
      "choices": [
        "サービス管理者",
        "共同管理者",
        "所有者"
      ],
      "answer": 2,
      "explanation": "User1 には「所有者」ロールを割り当てる必要があります。Azure サブスクリプションに紐づく Microsoft Entra テナントの変更を行うためには、所有者レベルの十分な権限が求められるためです。サブスクリプションのディレクトリ変更操作には、この権限が最低限必要となります。https://learn.microsoft.com/ja-jp/entra/fundamentals/how-subscriptions-associated-directory#before-you-begin",
      "category": "",
      "tags": [
        "entra-id",
        "rbac",
        "pim",
        "subscription-design"
      ]
    },
    {
      "id": 102,
      "question": "contoso.com および fabrikam.com という 2 つの Microsoft Entra ID テナントが存在し、それぞれ 50 個の Azure サブスクリプションと関連付けられています。Contoso.com テナントには User1 と User2 の 2 名のユーザーが登録されています。以下の条件を最小権限の原則に基づいて実現するには、各ユーザーにどのロールを付与すべきですか。 User2 について: ・ User1 が特定の Azure サブスクリプションの関連付け先となる Microsoft Entra テナントを切り替えられるようにする。・ サブスクリプションが別の Microsoft Entra テナントへ移行された後、そのサブスクリプションに対してフルレベルの権限を持つ Microsoft Entra ID アカウントが存在しない状況で、User2 のアクセス権限をサブスクリプションに対して引き上げられるようにする。",
      "choices": [
        "サービス管理者",
        "共同管理者",
        "所有者"
      ],
      "answer": 2,
      "explanation": "User2 にも「所有者」ロールの付与が必要です。サブスクリプションに対するフルレベルのアクセス権限を持つ Microsoft Entra ID アカウントが見つからない場合に、User2 のアクセスを昇格させる必要があるためです。所有者ロールはあらゆるリソースに対する完全なアクセス権と、他のユーザーへのアクセス委任権限を含んでおり、このシナリオにおいて User2 がサブスクリプションを管理するために不可欠です。https://learn.microsoft.com/ja-jp/entra/fundamentals/how-subscriptions-associated-directory#before-you-begin",
      "category": "",
      "tags": [
        "entra-id",
        "rbac",
        "pim",
        "subscription-design"
      ]
    },
    {
      "id": 103,
      "question": "Windows Server が稼働するオンプレミスのサーバー 10 台があります。これらのサーバーを Recovery Services コンテナーに毎日バックアップする必要があり、以下の条件を満たすソリューションが求められています。サーバー側の構成として適切なものはどれですか。・ 各サーバーの全ファイルおよびフォルダーをバックアップ対象とする。・ Azure 上にバックアップのコピーを 3 つ維持する。・ コストを可能な限り抑える。",
      "choices": [
        "Azure Site Recovery モビリティ サービス",
        "ボリューム シャドウ コピー サービス (VSS)",
        "Microsoft Azure Recovery Service (MARS) エージェント"
      ],
      "answer": 2,
      "explanation": "サーバーのファイルとフォルダーを Azure にバックアップするには、MARS エージェントが適しています。MARS エージェントを使えば、ファイルレベルでのバックアップが可能であり、Recovery Services コンテナーへの直接バックアップを実現できます。",
      "category": "",
      "tags": [
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "containers"
      ]
    },
    {
      "id": 104,
      "question": "Windows Server が稼働するオンプレミスのサーバー 10 台があります。これらのサーバーを Recovery Services コンテナーに毎日バックアップする必要があり、以下の条件を満たすソリューションが求められています。ストレージの設定として適切なものはどれですか。・ 各サーバーの全ファイルおよびフォルダーをバックアップ対象とする。・ Azure 上にバックアップのコピーを 3 つ維持する。・ コストを可能な限り抑える。",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 0,
      "explanation": "LRS は Azure Backup において最もコスト効率に優れたストレージの選択肢です。プライマリリージョンの単一データセンター内でデータを 3 回複製するため、大半のワークロードに十分な耐久性を備えています。コスト最小化の観点から最適な選択となります。",
      "category": "",
      "tags": [
        "azure-storage",
        "bcdr-fundamentals",
        "azure-backup",
        "containers"
      ]
    },
    {
      "id": 105,
      "question": "以下の条件を満たすデータストレージソリューションとして、どれを推奨すべきですか。・ アプリケーションが REST 接続でデータにアクセスできること。・ サイズや利用パターンが異なる 20 個の独立したテーブルを格納できること。・ 別の Azure リージョンへデータが自動的にレプリケートされること。・ コストを最小限にすること。",
      "choices": [
        "geo 冗長ストレージ (GRS) を使用する Azure ストレージ アカウント内のテーブル",
        "アクティブな geo レプリケーションを使用する Azure SQL Database エラスティック プール",
        "アクティブ geo レプリケーションを使用する Azure SQL データベース",
        "読み取りアクセス geo 冗長ストレージ (RA-GRS) を使用する Azure ストレージ アカウント内のテーブル"
      ],
      "answer": 0,
      "explanation": "Azure Table Storage はスキーマレスな NoSQL データストアであり、異なるサイズや使用パターンを持つ複数の独立テーブルのホスティングに向いています。REST API でのアクセスが可能で、GRS を選択すればセカンダリリージョンへの自動レプリケーションが行われます。コスト面では GRS は RA-GRS より低コストであり、一般的に Azure SQL Database の選択肢と比較しても経済的です。https://learn.microsoft.com/ja-jp/azure/storage/common/geo-redundant-design",
      "category": "",
      "tags": [
        "data-fundamentals",
        "azure-storage",
        "sql-database",
        "bcdr-fundamentals",
        "sql-ha"
      ]
    },
    {
      "id": 106,
      "question": "以下の条件をすべて満たす Azure Storage ソリューションとして、どれを推奨すべきですか。・ 1 PB 規模のデータ容量に対応する。・ BLOB ストレージ形式でデータを保持する。・ 3 階層のサブフォルダー構造に対応する。・ アクセス制御リスト (ACL) による権限管理が可能である。",
      "choices": [
        "ページ BLOB 用に構成された Premium ストレージ アカウント",
        "ブロック BLOB 用に構成された Premium ストレージ アカウント",
        "ファイル共有用に構成され、大規模なファイル共有をサポートする Premium ストレージ アカウント",
        "階層名前空間が有効になっている汎用 v2 ストレージ アカウント"
      ],
      "answer": 3,
      "explanation": "Azure Blob Storage はペタバイト規模の非構造化データ保存に対応しており、汎用 v2 アカウントは GB あたりの容量料金が最も安価です。階層名前空間を有効にすることで、ディレクトリやサブフォルダーの複数レベルの構造をサポートでき、さらに Azure Data Lake Storage Gen2 を通じてきめ細かい ACL ベースのアクセス制御が利用可能になります。https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/management/azure-subscription-service-limits#storage-limits",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "data-analytics"
      ]
    },
    {
      "id": 107,
      "question": "2 TB のデータファイルを保有するオンプレミスのファイルサーバーがあり、これらを西ヨーロッパ Azure リージョンの Azure Blob Storage へ移行する計画です。以下の条件を満たすストレージアカウントの種類を推奨してください。・ 単一の Azure データセンターで障害が発生しても利用を継続できる。・ ストレージの階層化に対応している。・ コストを可能な限り抑える。",
      "choices": [
        "Standard 汎用 v2",
        "Premium ブロック BLOB",
        "Standard 汎用 v1"
      ],
      "answer": 0,
      "explanation": "Standard 汎用 v2 は、BLOB、ファイル共有、キュー、テーブルに対応する標準的なストレージアカウントです。ストレージ階層化をサポートし、Azure Storage を利用する大半のシナリオに推奨されるアカウント種類です。コストの観点でも最適な選択肢となります。https://learn.microsoft.com/ja-jp/azure/storage/common/storage-account-overview",
      "category": "",
      "tags": [
        "resource-locks",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals",
        "messaging"
      ]
    },
    {
      "id": 108,
      "question": "2 TB のデータファイルを保有するオンプレミスのファイルサーバーがあり、これらを西ヨーロッパ Azure リージョンの Azure Blob Storage へ移行する計画です。以下の条件を満たす冗長性オプションを推奨してください。・ 単一の Azure データセンターで障害が発生しても利用を継続できる。・ ストレージの階層化に対応している。・ コストを可能な限り抑える。",
      "choices": [
        "ゾーン冗長ストレージ (ZRS)",
        "Geo 冗長ストレージ (GRS)",
        "読み取りアクセス geo 冗長ストレージ (RA-GRS)",
        "ローカル冗長ストレージ (LRS)"
      ],
      "answer": 0,
      "explanation": "ZRS はプライマリリージョン内の 3 つの可用性ゾーン間でデータを同期的にレプリケートします。各可用性ゾーンには独立した電源、冷却設備、ネットワークが備わっており、単一データセンターの障害に耐えることができます。ZRS は年間 99.9999999999%（12 ナイン）以上の耐久性を実現し、GRS や RA-GRS と比べてコストを抑えつつデータセンター障害からの保護を提供します。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-redundancy",
      "category": "",
      "tags": [
        "entra-connect",
        "azure-storage",
        "blob-storage",
        "bcdr-fundamentals",
        "availability-zones"
      ]
    },
    {
      "id": 109,
      "question": "オンプレミスの Microsoft SQL Server データベースを Azure へ移行する計画があります。以下の条件を満たすデプロイソリューションとして適切なものはどれですか。・ ユーザーが手動で開始するバックアップに対応する。・ Azure リージョン間で自動レプリケーションされる複数インスタンスをサポートする。・ 事業継続性の実装・維持にかかる管理作業を最小化する。",
      "choices": [
        "Azure SQL Managed Instance",
        "Azure SQL Database の単一データベース",
        "Azure Virtual Machines 上の SQL Server"
      ],
      "answer": 0,
      "explanation": "重要なポイントは「複数インスタンスの自動レプリケーション対応」という点です。ユーザーが開始するバックアップもサポートし、かつ管理負荷を抑えられる選択肢は Azure SQL Managed Instance のみです。https://learn.microsoft.com/ja-jp/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql",
      "category": "",
      "tags": [
        "sql-database",
        "bcdr-fundamentals",
        "azure-backup",
        "virtual-machines",
        "data-migration"
      ]
    },
    {
      "id": 110,
      "question": "オンプレミスの Microsoft SQL Server データベースを Azure へ移行する計画があります。以下の条件を満たす回復力ソリューションとして適切なものはどれですか。・ ユーザーが手動で開始するバックアップに対応する。・ Azure リージョン間で自動レプリケーションされる複数インスタンスをサポートする。・ 事業継続性の実装・維持にかかる管理作業を最小化する。",
      "choices": [
        "自動フェールオーバー グループ",
        "アクティブ geo レプリケーション",
        "ゾーン冗長デプロイメント"
      ],
      "answer": 0,
      "explanation": "Azure SQL Managed Instance ではアクティブ geo レプリケーションがサポートされていないため、リージョン間の冗長性を確保するには自動フェールオーバーグループを使用する必要があります。https://learn.microsoft.com/ja-jp/azure/well-architected/service-guides/azure-sql-managed-instance/reliability",
      "category": "",
      "tags": [
        "sql-database",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "storage-redundancy",
        "sql-ha",
        "data-migration"
      ]
    }
  ]
};
