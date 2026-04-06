var QUIZ_DATA_website_101_110 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 101,
      "question": "contoso.com と fabrikam.com という名前の 2 つの Microsoft Entra IDD テナントがあります。各テナントは 50 の Azure サブスクリプションにリンクされています。 Contoso.com には、User1 と User2 という名前の 2 人のユーザーが含まれています。 次の要件を満たす必要があります。 ソリューションでは、最小特権の原則を使用する必要があります。 各ユーザーにどの役割を割り当てる必要がありますか。 User1:・ User1 は、特定の Azure サブスクリプションにリンクされた Microsoft Entra テナントを変更できることを確認する。・ Azure サブスクリプションが新しい Microsoft Entra テナントに関連付けられており、そのサブスクリプションに対する完全なサブスクリプション レベルのアクセス許可を持つ使用可能な Microsoft Entra ID アカウントがない場合は、User2 のアクセスをサブスクリプションに昇格させる。",
      "choices": [
        "サービス管理者",
        "共同管理者",
        "所有者"
      ],
      "answer": 2,
      "explanation": "特定の Azure サブスクリプションにリンクされた Microsoft Entra テナントを変更する必要がある User1 には、「所有者」のロールを割り当てる必要があります。サブスクリプションにリンクされている Microsoft Entra テナントを変更するには、ユーザーが所有者レベルで使用できる十分なアクセス許可を持っている必要があるためです。https://learn.microsoft.com/ja-jp/entra/fundamentals/how-subscriptions-associated-directory#before-you-begin",
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
      "question": "contoso.com と fabrikam.com という名前の 2 つの Microsoft Entra IDD テナントがあります。各テナントは 50 の Azure サブスクリプションにリンクされています。 Contoso.com には、User1 と User2 という名前の 2 人のユーザーが含まれています。 次の要件を満たす必要があります。 ソリューションでは、最小特権の原則を使用する必要があります。 各ユーザーにどの役割を割り当てる必要がありますか。 User2:・ User1 は、特定の Azure サブスクリプションにリンクされた Microsoft Entra テナントを変更できることを確認する。・ Azure サブスクリプションが新しい Microsoft Entra テナントに関連付けられており、そのサブスクリプションに対する完全なサブスクリプション レベルのアクセス許可を持つ使用可能な Microsoft Entra ID アカウントがない場合は、User2 のアクセスをサブスクリプションに昇格させる。",
      "choices": [
        "サービス管理者",
        "共同管理者",
        "所有者"
      ],
      "answer": 2,
      "explanation": "利用可能な Microsoft Entra ID アカウントにサブスクリプションに対する完全なサブスクリプション レベルのアクセス許可がない場合に、サブスクリプションに昇格されたアクセス権が必要な User2 には、「所有者」ロールも割り当てる必要があります。この役割は、他のリソースにアクセスを委任する権利を含む、すべてのリソースへの完全なアクセスを提供します。このシナリオでは、「所有者」ロールにより、完全な権限を持つ他のアカウントが存在しない場合でも、User2 がサブスクリプションにアクセスできるようになります。https://learn.microsoft.com/ja-jp/entra/fundamentals/how-subscriptions-associated-directory#before-you-begin",
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
      "question": "Windows Server を実行するオンプレミス サーバーが 10 台あります。 Recovery Services コンテナーへのサーバーのバックアップを毎日実行する必要があります。ソリューションは次の要件を満たす必要があります。 何を設定すればよいでしょうか。 サーバー:・ サーバー上のすべてのファイルとフォルダーをバックアップする。・ Azure にバックアップのコピーを 3 つ保持する。・ コストを最小限に抑える。",
      "choices": [
        "Azure Site Recovery モビリティ サービス",
        "ボリューム シャドウ コピー サービス (VSS)",
        "Microsoft Azure Recovery Service (MARS) エージェント"
      ],
      "answer": 2,
      "explanation": "・ サーバー上のすべてのファイルとフォルダーをバックアップする。・ Azure にバックアップのコピーを 3 つ保持する。・ コストを最小限に抑える。",
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
      "question": "Windows Server を実行するオンプレミス サーバーが 10 台あります。 Recovery Services コンテナーへのサーバーのバックアップを毎日実行する必要があります。ソリューションは次の要件を満たす必要があります。 何を設定すればよいでしょうか。 ストレージ:・ サーバー上のすべてのファイルとフォルダーをバックアップする。・ Azure にバックアップのコピーを 3 つ保持する。・ コストを最小限に抑える。",
      "choices": [
        "ローカル冗長ストレージ (LRS)",
        "Geo 冗長ストレージ (GRS)",
        "ゾーン冗長ストレージ (ZRS)"
      ],
      "answer": 0,
      "explanation": "ローカル冗長ストレージ (LRS)LRS は、Azure Backup にとって最もコスト効率の高いストレージ オプションです。プライマリ リージョンの単一データ センター内でデータを 3 回レプリケートするため、ほとんどのワークロードに対して十分な耐久性が提供されます。",
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
      "question": "次の要件を満たすデータ ストレージ ソリューションを推奨する必要があります。 何を勧めるべきですか。・ アプリケーションが REST 接続を使用してデータにアクセスできることを保証します。・ さまざまなサイズと使用パターンの 20 の独立したテーブルをホスト・ データを 2 番目の Azure リージョンに自動的にレプリケートします・ コストを最小限に抑える",
      "choices": [
        "geo 冗長ストレージ (GRS) を使用する Azure ストレージ アカウント内のテーブル",
        "アクティブな geo レプリケーションを使用する Azure SQL Database エラスティック プール",
        "アクティブ geo レプリケーションを使用する Azure SQL データベース",
        "読み取りアクセス geo 冗長ストレージ (RA-GRS) を使用する Azure ストレージ アカウント内のテーブル"
      ],
      "answer": 0,
      "explanation": "geo 冗長ストレージ (GRS) を使用する Azure ストレージ アカウント内のテーブルAzure Table Storage は NoSQL 機能を提供し、スキーマレス設計のキー属性ストアを提供します。そのため、さまざまなサイズや使用パターンの独立したテーブルをホストするのに適しています。 Table Storage データには REST API 経由でアクセスでき、GRS はデータをセカンダリ リージョンに自動的にレプリケートして、リージョンの停止から保護します。コスト最小化の要件に従って、GRS は RA-GRS よりも安価であり、一般に Azure Table Storage は Azure SQL Database オプションよりもコスト効率が高くなります。https://learn.microsoft.com/ja-jp/azure/storage/common/geo-redundant-design",
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
      "question": "次の要件を満たす Azure Storage ソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。・ ストレージは 1 PB のデータをサポートする必要がある。・ データは BLOB ストレージに保存する必要がある。・ ストレージは 3 レベルのサブフォルダーをサポートする必要がある。・ ストレージはアクセス制御リスト (ACL) をサポートする必要がある。",
      "choices": [
        "ページ BLOB 用に構成された Premium ストレージ アカウント",
        "ブロック BLOB 用に構成された Premium ストレージ アカウント",
        "ファイル共有用に構成され、大規模なファイル共有をサポートする Premium ストレージ アカウント",
        "階層名前空間が有効になっている汎用 v2 ストレージ アカウント"
      ],
      "answer": 3,
      "explanation": "Azure Blob Storage は、テキスト データやバイナリ データなどの大量の非構造化オブジェクト データを保存するように設計されており、ペタバイト規模のデータを保存できます。汎用 v2 アカウントは、Azure Storage のギガバイトあたりの容量料金が最も低く、業界競争力のあるトランザクション価格を提供します。階層名前空間を使用すると、BLOB ストレージで複数のレベルのディレクトリとサブフォルダーをサポートできます。さらに、階層名前空間を有効にすると、アカウント内のデータは、きめ細かいアクセス許可のアクセス制御リスト (ACL) をサポートする Azure Data Lake Storage Gen2 を通じてアクセスできるようになります。https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/management/azure-subscription-service-limits#storage-limits",
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
      "question": "2 TB のデータ ファイルを保存するオンプレミスのファイル サーバーがあります。 データ ファイルを西ヨーロッパ Azure リージョンの Azure Blob Storage に移動する予定です。 データ ファイルを保存するためのストレージ アカウントの種類と、ストレージ アカウントのレプリケーション ソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 何を勧めるべきですか。 ストレージ アカウントの種類:・ 単一の Azure データセンターに障害が発生した場合でも利用できるようにする。・ ストレージ階層をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "Standard 汎用 v2",
        "Premium ブロック BLOB",
        "Standard 汎用 v1"
      ],
      "answer": 0,
      "explanation": "Standard 汎用 v2BLOB、ファイル共有、キュー、テーブル用の Standard タイプのストレージ アカウント。 Azure Storage を使用するほとんどのシナリオにお勧めします。 Azure Files の ネットワーク ファイル システム (NFS) のサポートが必要な場合は、Premium ファイル共有タイプのアカウントを使用してください。https://learn.microsoft.com/ja-jp/azure/storage/common/storage-account-overview",
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
      "question": "2 TB のデータ ファイルを保存するオンプレミスのファイル サーバーがあります。 データ ファイルを西ヨーロッパ Azure リージョンの Azure Blob Storage に移動する予定です。 データ ファイルを保存するためのストレージ アカウントの種類と、ストレージ アカウントのレプリケーション ソリューションを推奨する必要があります。ソリューションは次の要件を満たす必要があります。 何を勧めるべきですか。 冗長性:・ 単一の Azure データセンターに障害が発生した場合でも利用できるようにする。・ ストレージ階層をサポートする。・ コストを最小限に抑える。",
      "choices": [
        "ゾーン冗長ストレージ (ZRS)",
        "Geo 冗長ストレージ (GRS)",
        "読み取りアクセス geo 冗長ストレージ (RA-GRS)",
        "ローカル冗長ストレージ (LRS)"
      ],
      "answer": 0,
      "explanation": "ゾーン冗長ストレージ (ZRS) は、プライマリ リージョンの 3 つの Azure 可用性ゾーン間でストレージ アカウントを同期的にレプリケートします。 各可用性ゾーンは、独立した電源、冷却装置、ネットワークを備えた独立した物理的な場所です。 ZRS は、ストレージ リソースに年間 99.9999999999% (トゥエルブ ナイン) 以上の持続性を実現します。ZRS はコストを最小限に抑えながら、データセンターの障害から保護します。https://docs.microsoft.com/ja-jp/azure/storage/common/storage-redundancy",
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
      "question": "\"オンプレミスの Microsoft SQL Server データベースを Azure に移行することを計画しています。 次の要件を満たす展開および復元ソリューションを推奨する必要があります。 何を勧めるべきですか。 デプロイメント ソリューション:\"・ ユーザー開始のバックアップをサポートする。・ Azure リージョン間で自動的にレプリケートされる複数のインスタンスをサポートする。・ ビジネス継続性を実装および維持するための管理労力を最小限に抑える。",
      "choices": [
        "Azure SQL Managed Instance",
        "Azure SQL Database の単一データベース",
        "Azure Virtual Machines 上の SQL Server"
      ],
      "answer": 0,
      "explanation": "キーワードが「複数の自動的にレプリケートされたインスタンスをサポート」です。また、ユーザーが開始したバックアップもサポートする唯一の選択肢はAzure SQL Managed Instanceになります。https://learn.microsoft.com/ja-jp/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql",
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
      "question": "オンプレミスの Microsoft SQL Server データベースを Azure に移行することを計画しています。 次の要件を満たす展開および復元ソリューションを推奨する必要があります。 何を勧めるべきですか。 回復力 ソリューション:・ ユーザー開始のバックアップをサポートする。・ Azure リージョン間で自動的にレプリケートされる複数のインスタンスをサポートする。・ ビジネス継続性を実装および維持するための管理労力を最小限に抑える。",
      "choices": [
        "自動フェールオーバー グループ",
        "アクティブ geo レプリケーション",
        "ゾーン冗長デプロイメント"
      ],
      "answer": 0,
      "explanation": "Azure SQL Managed Instanceがアクティブな geo レプリケーションをサポートしていないため、自動フェールオーバーが正解です。https://learn.microsoft.com/ja-jp/azure/well-architected/service-guides/azure-sql-managed-instance/reliability",
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
