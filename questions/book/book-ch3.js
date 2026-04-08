var QUIZ_DATA_book_ch3 = {
  "source": "original",
  "questions": [
    {
      "id": 1,
      "question": "社内で運用している3つのシステムについて、それぞれ異なるBCDR要件があります。\n・システA: 障害発生時に即座に別環境へ切り替えたい\n・システムB: 定期的なバックアップが必要で、復旧までの許容時間は24時間\n・システムC: データを7年間保管する義務があり、復旧は10分以内に完了させたい\n各システムに最も適したAzureサービスの組み合わせを選んでください。",
      "choices": [
        "A. A: Azure Site Recovery、B: Azure Backup、C: Azure Backup + Azure Site Recovery",
        "B. A: Azure Backup、B: Azure Site Recovery、C: Azure Backup",
        "C. A: Azure Site Recovery、B: Azure Site Recovery、C: Azure Backup",
        "D. A: Azure Backup、B: Azure Backup、C: Azure Site Recovery"
      ],
      "answer": 0,
      "explanation": "Azure Site Recoveryは環境の切り替え（フェールオーバー）を提供し、数分でのリカバリを可能にします（システムA向き）。Azure Backupは24時間以内のRTOで十分なバックアップ要件をカバーします（システムB向き）。システムCでは7年間の長期保管（Backup）と10分以内の迅速な復旧（Site Recovery）の両立が求められるため、両サービスの併用が最適解となります。",
      "category": "bcdr",
      "tags": [
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 2,
      "question": "オンプレミス環境で稼働しているファイルサーバーに障害が起きた際、速やかにファイルへのアクセスを回復させたいと考えています。さらに、クラウドとの継続的な同期も求められています。どのサービスの組み合わせが適切でしょうか。",
      "choices": [
        "A. Azure Blob Storage + Azure CDN",
        "B. Azure Files + Azure File Sync",
        "C. Azure Managed Disks + Azure Site Recovery",
        "D. Azure NetApp Files + VPN Gateway"
      ],
      "answer": 1,
      "explanation": "Azure FilesはSMBプロトコルに対応したクラウド上のファイル共有サービスであり、Azure File Syncを組み合わせることでオンプレミスのファイルサーバーとクラウド間の同期が実現します。障害が起きた場合には、クラウド側のファイル共有へ直接アクセスすることで素早い復旧が可能です。また、クラウド階層化機能によりアクセス頻度の高いファイルをローカルにキャッシュし、パフォーマンスを維持できます。",
      "category": "bcdr",
      "tags": [
        "entra-connect",
        "blob-storage",
        "site-recovery",
        "file-sync",
        "caching",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 3,
      "question": "80TBのデータを扱うAzure SQL Databaseの構築が必要です。どのサービスティアを採用すべきでしょうか。",
      "choices": [
        "A. General Purpose",
        "B. Business Critical",
        "C. Hyperscale",
        "D. Basic"
      ],
      "answer": 2,
      "explanation": "Azure SQL DatabaseのHyperscaleティアは、最大100TBまでのデータベース容量に対応しています。80TBのデータを扱うにはHyperscaleの選択が必須です。General PurposeおよびBusiness Criticalは、vCoreモデルの構成次第で最大4TB～16TB程度までのデータベースに対応します。BasicティアはDTUモデルのエントリレベルで、格納可能なデータ量は非常に限られています。",
      "category": "bcdr",
      "tags": [
        "sql-database"
      ]
    },
    {
      "id": 4,
      "question": "Azure SQL Databaseを可用性ゾーン障害に耐えられるようにしたいのですが、費用はなるべく抑えたいです。どのサービスティアとモデルの組み合わせが最善でしょうか。",
      "choices": [
        "A. DTU Basic",
        "B. 仮想コア General Purpose（ゾーン冗長構成）",
        "C. 仮想コア Business Critical",
        "D. DTU Premium"
      ],
      "answer": 1,
      "explanation": "仮想コアモデルのGeneral Purposeティアではゾーン冗長構成が利用でき、可用性ゾーン障害からデータベースを守ることができます。Business Criticalでも同様にゾーン冗長に対応していますが、General Purposeと比べるとコストが高くなります。DTUモデルのBasicやStandardではゾーン冗長構成を利用できません。コスト最小化の条件を踏まえると、General Purposeのゾーン冗長構成が最も合理的な選択です。",
      "category": "bcdr",
      "tags": [
        "sql-database",
        "availability-zones"
      ]
    },
    {
      "id": 5,
      "question": "Azure SQL Databaseのバックアップを5年間保持したいと考えています。Premiumティアの自動バックアップ機能だけで、この要件に対応できるでしょうか。",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 1,
      "explanation": "Azure SQL Databaseの自動バックアップ（PITR: Point-In-Time Restore）で保持できる期間は最長35日です。5年にわたるバックアップ保持を実現するには、長期保持ポリシー（LTR: Long-Term Retention）を追加で設定する必要があります。LTRを使えば、フルバックアップをAzure Blob Storageに最長10年間保管できます。したがって、Premiumティアの自動バックアップのみでは5年間の保持要件を充足できません。",
      "category": "bcdr",
      "tags": [
        "blob-storage",
        "sql-database",
        "bcdr-fundamentals",
        "azure-backup"
      ]
    },
    {
      "id": 6,
      "question": "Azureストレージアカウントをリージョン規模の障害から保護するには、どの冗長性構成を選べばよいですか。",
      "choices": [
        "A. LRS（ローカル冗長ストレージ）",
        "B. ZRS（ゾーン冗長ストレージ）",
        "C. GRS（geo冗長ストレージ）またはGZRS（geoゾーン冗長ストレージ）",
        "D. Premium LRS"
      ],
      "answer": 2,
      "explanation": "リージョン全体の障害に備えるためには、データを地理的に離れた別リージョンへ複製する必要があります。GRS（geo冗長ストレージ）はプライマリリージョンでLRS、セカンダリリージョンでもLRSを構成します。GZRS（geoゾーン冗長ストレージ）はプライマリ側がZRS、セカンダリ側がLRSの構成です。LRSは単一データセンター内、ZRSは単一リージョン内に限られた冗長性なので、リージョン障害には耐えられません。",
      "category": "bcdr",
      "tags": [
        "azure-storage"
      ]
    },
    {
      "id": 7,
      "question": "Azure BackupのバックアップポリシーにおけるStandardポリシーとEnhancedポリシーの相違点として適切なものはどれですか。",
      "choices": [
        "A. Enhancedは1日に複数回のバックアップをサポートするが、Standardは1日1回のみ",
        "B. StandardはAzure VMのバックアップをサポートするが、Enhancedはサポートしない",
        "C. Enhancedはインスタントリストアのスナップショット保持期間が最大30日だが、Standardは最大5日",
        "D. AとCの両方"
      ],
      "answer": 3,
      "explanation": "Enhancedポリシーでは、1日に複数回（例: 4時間間隔）のバックアップ取得が可能で、インスタントリストア用スナップショットの保持期間も最大30日まで拡張されます。一方、Standardポリシーでは1日1回の取得で、スナップショット保持は最大5日間です。Azure VMのバックアップはどちらのポリシーでも対応しています。Enhancedを利用することで、より短いRPOとRTOの達成が見込めます。",
      "category": "bcdr",
      "tags": [
        "bcdr-fundamentals",
        "azure-backup"
      ]
    },
    {
      "id": 8,
      "question": "Azure Site RecoveryによるAzure VMのレプリケーションでは、どのレプリケーション方式が使われますか。",
      "choices": [
        "A. 同期レプリケーション",
        "B. 非同期レプリケーション",
        "C. スナップショットベースのレプリケーション",
        "D. バックアップベースのレプリケーション"
      ],
      "answer": 1,
      "explanation": "Azure Site Recoveryでは非同期方式でAzure VMをセカンダリリージョンへ複製します。この方式により、プライマリVMの処理性能への影響を抑えつつ、データの継続的な複製が行われます。RPO（目標復旧時点）は一般的に数分程度となります。同期レプリケーションは性能面での負荷が大きく、距離のあるリージョン間の複製には不向きです。",
      "category": "bcdr",
      "tags": [
        "entra-connect",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery"
      ]
    },
    {
      "id": 9,
      "question": "以下の条件を満たすロードバランシングサービスを選ぶ必要があります。世界規模のHTTP/HTTPSトラフィック分散、WAF機能、SSL終端に対応するものはどれでしょうか。",
      "choices": [
        "A. Azure Load Balancer",
        "B. Azure Application Gateway",
        "C. Azure Traffic Manager",
        "D. Azure Front Door"
      ],
      "answer": 3,
      "explanation": "Azure Front Doorはグローバル規模のHTTP/HTTPSトラフィック分散を行い、WAF（Web Application Firewall）やSSL終端にも対応しています。Application Gatewayはリージョン内で動作するレイヤー7ロードバランサーでWAFに対応しますが、グローバルな分散は行えません。Load Balancerはレイヤー4（TCP/UDP）の負荷分散でHTTP/HTTPS固有の機能を持ちません。Traffic ManagerはDNSベースのグローバル分散ですが、WAFやSSL終端には対応していません。",
      "category": "bcdr",
      "tags": [
        "load-balancers",
        "network-security"
      ]
    },
    {
      "id": 10,
      "question": "Azure Key Vaultが所在するリージョンで障害が発生した場合、フェールオーバーの切り替え先はどこになりますか。",
      "choices": [
        "A. 最も近いリージョン",
        "B. ペアリージョン",
        "C. ユーザーが指定したリージョン",
        "D. フェールオーバーはサポートされていない"
      ],
      "answer": 1,
      "explanation": "Azure Key Vaultでは、リージョン障害の発生時にペアリージョンへ自動的にフェールオーバーが行われます。ペアリージョンとは、Azureが地理的に近い場所に事前定義したリージョンの組み合わせです（例: 東日本と西日本）。この切り替えは自動で実行されるため、利用者による操作は不要です。なお、切り替え先を利用者が任意に選ぶことはできません。",
      "category": "bcdr",
      "tags": [
        "key-vault",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 11,
      "question": "Azure Key Vaultがフェールオーバー中の場合、実行できなくなる操作はどれですか。",
      "choices": [
        "A. シークレットの読み取り",
        "B. キーを使用した暗号化操作",
        "C. シークレットの作成・更新・削除",
        "D. 証明書の参照"
      ],
      "answer": 2,
      "explanation": "Key Vaultのフェールオーバー中は、読み取り系の操作（シークレットの取得、暗号化キーの利用、証明書の参照など）は引き続き使用可能ですが、書き込み系の操作（新規作成・更新・削除）は利用できません。フェールオーバー中のKey Vaultは読み取り専用の状態で稼働し、フェールバックが完了してから書き込み操作が再び有効になります。",
      "category": "bcdr",
      "tags": [
        "key-vault",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 12,
      "question": "Azure Database for MySQLで高可用性を確保するために、最低限必要となるサービスティアとオプションの組み合わせはどれですか。",
      "choices": [
        "A. Burstable + 単一ゾーン",
        "B. General Purpose以上 + ゾーン冗長高可用性",
        "C. Business Critical + geo冗長バックアップ",
        "D. Burstable + ゾーン冗長高可用性"
      ],
      "answer": 1,
      "explanation": "Azure Database for MySQLのフレキシブルサーバーでゾーン冗長高可用性を有効化するには、General Purpose以上のティアが必要です。Burstableティアではこの構成は利用できません。Business Criticalでも対応可能ですが、最低限のティアとしてはGeneral Purposeが該当します。geo冗長バックアップは災害復旧用途としては有効ですが、自動フェールオーバーを伴う高可用性とは役割が異なります。",
      "category": "bcdr",
      "tags": [
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "storage-redundancy"
      ]
    },
    {
      "id": 13,
      "question": "Azure SQL Databaseで、読み取り処理を別リージョンのレプリカにオフロードしたい場合、どの機能を利用すべきですか。",
      "choices": [
        "A. 読み取りレプリカ",
        "B. geoバックアップ",
        "C. アクティブgeoレプリケーション",
        "D. ポイントインタイムリストア"
      ],
      "answer": 2,
      "explanation": "アクティブgeoレプリケーションを使うと、Azure SQL Databaseのデータが非同期で別リージョンに複製され、読み取り可能なセカンダリが提供されます。これにより読み取り処理をセカンダリへ分散できます。geoバックアップは障害復旧向けのバックアップであり、読み取りのオフロード用途には使えません。読み取りレプリカはMySQL/PostgreSQL系のサービスで使われる用語です。ポイントインタイムリストアは、指定した時点へデータベースを復元する機能です。",
      "category": "bcdr",
      "tags": [
        "entra-connect",
        "sql-database",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery"
      ]
    },
    {
      "id": 14,
      "question": "Azure SQL Databaseにおいて、自動でのフェールオーバーを実現し、かつ切り替え後もアプリケーション側の接続先を変更せずに済む機能はどれですか。",
      "choices": [
        "A. アクティブgeoレプリケーション",
        "B. 自動フェールオーバーグループ",
        "C. geoバックアップ",
        "D. ゾーン冗長構成"
      ],
      "answer": 1,
      "explanation": "自動フェールオーバーグループは、自動フェールオーバー機能に加えて、読み書き用と読み取り専用のリスナーエンドポイントを提供します。フェールオーバーが起きてもエンドポイントはそのまま維持されるため、アプリケーション側で接続文字列を変更する必要がありません。アクティブgeoレプリケーションでは手動での切り替えが必要であり、接続先の変更も伴います。geoバックアップは復元処理であって自動フェールオーバーではありません。ゾーン冗長は同一リージョン内での冗長性にとどまります。",
      "category": "bcdr",
      "tags": [
        "azure-storage",
        "sql-database",
        "bcdr-fundamentals",
        "azure-backup",
        "site-recovery",
        "storage-redundancy",
        "sql-ha"
      ]
    },
    {
      "id": 15,
      "question": "Azure Backupにおいて、バックアップの削除などの重要操作を不正に実行されないよう保護するために使うリソースはどれですか。",
      "choices": [
        "A. Azure Policy",
        "B. Azure Resource Guard",
        "C. Azure Key Vault",
        "D. Microsoft Defender for Cloud"
      ],
      "answer": 1,
      "explanation": "Azure Resource Guardは、バックアップの削除やポリシーの変更、論理削除の無効化といったAzure Backupの重要操作に対して追加の保護層を設けます。Resource Guardを構成すると、こうした操作を行うには別サブスクリプションに配置されたResource Guardリソースへのアクセス権限が求められるようになります。Azure Policyはコンプライアンスの監査や強制が主な用途であり、バックアップ操作そのものの保護とは異なります。Key Vaultは暗号化キーやシークレットの管理サービスです。",
      "category": "bcdr",
      "tags": [
        "subscription-design",
        "azure-policy",
        "purview",
        "key-vault",
        "bcdr-fundamentals",
        "azure-backup"
      ]
    }
  ]
};
