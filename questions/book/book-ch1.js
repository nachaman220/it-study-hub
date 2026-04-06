var QUIZ_DATA_book_ch1 = {
  "source": "book-az305",
  "questions": [
    {
      "id": 1,
      "question": "あなたはAzure環境を管理しています。デプロイしたAzureリソースに部門名を追加して、リソースの管理を容易にしたいと考えています。どの機能を使用すべきですか？",
      "choices": [
        "A. タグ",
        "B. 管理グループ",
        "C. リソースグループ",
        "D. サブスクリプション"
      ],
      "answer": 0,
      "explanation": "タグはAzureリソースにメタデータ（キーと値のペア）を付与し、部門名やコストセンターなどの情報を追加できます。管理グループはサブスクリプションの階層管理に使用され、リソース単位の情報付与には適しません。リソースグループはリソースの論理的なグループ化であり、部門名のような柔軟なメタデータの付与はできません。サブスクリプションは課金単位であり、個別リソースへの情報付与には使用しません。",
      "category": "governance",
      "tags": [
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "tagging"
      ]
    },
    {
      "id": 2,
      "question": "あなたは300台のWindows Server 2022のシステムログを一元的に監視する必要があります。Azure Monitorエージェントをインストールすることで、この要件を満たすことができますか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "Azure Monitorエージェント（AMA）は、Windows/Linuxサーバーからログやパフォーマンスデータを収集し、Log Analyticsワークスペースに送信できます。データ収集ルール（DCR）を使用して、収集するログの種類を柔軟に設定でき、300台のサーバーのシステムログを一元監視する要件を満たせます。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics"
      ]
    },
    {
      "id": 3,
      "question": "あなたはAzure Monitor ログを使用してLinuxサーバーのログを分析しています。1日あたり約120GBのログが取り込まれており、コストを最小限に抑える必要があります。どのような変更を行うべきですか？",
      "choices": [
        "A. 基本ログに変更する",
        "B. 分析ログのままにする",
        "C. ログの保持期間を短縮する",
        "D. ワークスペースを分割する"
      ],
      "answer": 0,
      "explanation": "基本ログ（Basic Logs）は、分析ログ（Analytics Logs）と比較して取り込みコストが大幅に安くなります（約半額）。大量のログデータを取り込むが高度な分析が不要な場合、基本ログに変更することでコストを最小限に抑えられます。ただし、基本ログはKQLクエリの機能が一部制限され、クエリ実行時に追加料金が発生します。保持期間の短縮やワークスペース分割はコスト削減効果が限定的です。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics"
      ]
    },
    {
      "id": 4,
      "question": "あなたはAzure VM内のデータをLog Analyticsに転送し、転送時にログを変換する必要があります。ログの転送先とログの変換方法として正しい組み合わせはどれですか？",
      "choices": [
        "A. ログ転送: データ収集エンドポイント、ログ変換: KQLクエリ",
        "B. ログ転送: Azure Event Hubs、ログ変換: Azure Functions",
        "C. ログ転送: ストレージアカウント、ログ変換: Logic Apps",
        "D. ログ転送: Azure Monitor API、ログ変換: PowerShellスクリプト"
      ],
      "answer": 0,
      "explanation": "データ収集ルール（DCR）ではデータ収集エンドポイント（DCE）を使用してログを転送し、KQLクエリによるインジェスト時変換が可能です。これにより、Log Analyticsに取り込む前にデータのフィルタリングや変換を行えます。Event HubsやストレージアカウントはLog Analyticsへの直接転送には使用しません。Azure FunctionsやLogic Appsはログ変換には過剰な構成です。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics",
        "azure-storage",
        "azure-functions",
        "event-driven",
        "api-management"
      ]
    },
    {
      "id": 5,
      "question": "Azure Monitor ログにおいて、WindowsイベントログとLinux Syslogのデータが格納されるテーブル名の組み合わせとして正しいものはどれですか？",
      "choices": [
        "A. WindowsイベントログのテーブルはEvent、Linux SyslogのテーブルはSyslog",
        "B. WindowsイベントログのテーブルはWindowsEvent、Linux SyslogのテーブルはLinuxSyslog",
        "C. WindowsイベントログのテーブルはSecurityEvent、Linux SyslogのテーブルはSyslogData",
        "D. WindowsイベントログのテーブルはEventLog、Linux SyslogのテーブルはSyslogMessages"
      ],
      "answer": 0,
      "explanation": "Log Analyticsワークスペースにおいて、WindowsイベントログはEventテーブルに、Linux SyslogはSyslogテーブルに格納されます。SecurityEventはセキュリティイベント専用のテーブルです。WindowsEventやLinuxSyslogなどのテーブル名は存在しません。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics",
        "event-driven"
      ]
    },
    {
      "id": 6,
      "question": "あなたはAzureサブスクリプションを監視しています。Network Insights、Application Insights、VM Insightsのすべてを使用する場合、必要なLog Analyticsワークスペースの最小数はいくつですか？",
      "choices": [
        "A. 1",
        "B. 2",
        "C. 3",
        "D. 4"
      ],
      "answer": 0,
      "explanation": "Network Insights、Application Insights、VM Insightsはすべて同じLog Analyticsワークスペースを共有できます。そのため、必要なワークスペースの最小数は1つです。複数のInsightsソリューションを1つのワークスペースに統合することで、データの相関分析が容易になり、管理コストも削減できます。",
      "category": "monitoring",
      "tags": [
        "subscription-design",
        "azure-monitor",
        "log-analytics",
        "app-insights",
        "monitor-insights"
      ]
    },
    {
      "id": 7,
      "question": "あなたはAzureサブスクリプション内のリソース一覧を月次レポートとして作成する必要があります。どのサービスの組み合わせを使用すべきですか？",
      "choices": [
        "A. Azure Resource Graph、Azure Functions",
        "B. アクティビティログ、Log Analyticsワークスペース",
        "C. Azure Advisor、ストレージアカウント",
        "D. Azure Monitor メトリック、Azure Dashboard"
      ],
      "answer": 1,
      "explanation": "アクティビティログはサブスクリプション内のリソース操作（作成・変更・削除）を記録します。Log Analyticsワークスペースにアクティビティログを送信することで、KQLクエリを使用して月次レポートに必要なデータを集計・分析できます。Resource Graphはリアルタイムのリソース照会に適していますが、履歴データの分析には向きません。Azure Advisorは推奨事項の提供であり、リソース一覧の作成には適しません。",
      "category": "monitoring",
      "tags": [
        "subscription-design",
        "azure-monitor",
        "log-analytics",
        "activity-log",
        "azure-storage",
        "azure-functions"
      ]
    },
    {
      "id": 8,
      "question": "あなたはAzure Cost Managementを使用して、部門ごとのコストを監視したいと考えています。どの機能を使用すべきですか？",
      "choices": [
        "A. 管理グループ",
        "B. リソースグループ",
        "C. リソースのタグ",
        "D. サブスクリプション"
      ],
      "answer": 2,
      "explanation": "リソースのタグ（例：Department: Sales）を使用することで、Cost Managementでタグごとにコストをフィルタリング・分析できます。部門ごとのコスト配分を柔軟に実現できます。管理グループやサブスクリプションは組織階層の管理には使えますが、部門横断的なリソースがある場合は柔軟性に欠けます。リソースグループは論理的なグループ化ですが、1つのリソースは1つのRGにしか属せないため、部門ごとのコスト配分には不十分です。",
      "category": "governance",
      "tags": [
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "tagging",
        "azure-monitor",
        "cost-management"
      ]
    },
    {
      "id": 9,
      "question": "あなたはNSG（ネットワークセキュリティグループ）の診断データを収集する設定を行っています。ストレージアカウントに保持される期間とLog Analyticsに保持される最大期間の組み合わせとして正しいものはどれですか？",
      "choices": [
        "A. ストレージアカウント: 30日、Log Analytics: 365日",
        "B. ストレージアカウント: 90日、Log Analytics: 730日",
        "C. ストレージアカウント: 180日、Log Analytics: 365日",
        "D. ストレージアカウント: 365日、Log Analytics: 730日"
      ],
      "answer": 1,
      "explanation": "NSGフローログの診断データは、ストレージアカウントにデフォルトで最大90日間保持されます。Log Analyticsワークスペースでは最大730日（2年）間データを保持できます。これらの保持期間を理解することは、コンプライアンス要件やコスト管理において重要です。",
      "category": "monitoring",
      "tags": [
        "purview",
        "log-analytics",
        "cost-management",
        "azure-storage",
        "network-security"
      ]
    },
    {
      "id": 10,
      "question": "あなたは社員向けアプリケーションにSSOを実装する必要があります。アプリケーションは独自のHTMLログインページを持ち、パスワードによる認証を使用しています。どのSSO方式を使用すべきですか？",
      "choices": [
        "A. SAML",
        "B. パスワードベース",
        "C. リンクされたSSO",
        "D. 統合Windows認証"
      ],
      "answer": 1,
      "explanation": "パスワードベースSSOは、独自のHTMLログインページを持つアプリケーションに適しています。Microsoft Entra IDがユーザーの資格情報を安全に保存し、ログインページに自動的に入力します。SAMLはSAMLプロトコルをサポートするアプリケーション向けであり、独自HTMLページには対応しません。リンクされたSSOは既存のSSO実装がある場合に使用します。統合Windows認証はオンプレミスのKerberos認証環境向けです。",
      "category": "identity",
      "tags": [
        "entra-id",
        "sso"
      ]
    },
    {
      "id": 11,
      "question": "あなたはオンプレミスのWebアプリケーションを外部ユーザーに公開する必要があります。VPN接続は不要で、DMZ（非武装地帯）の構築も避けたいと考えています。どのサービスを使用すべきですか？",
      "choices": [
        "A. Azure Front Door",
        "B. Azure Application Gateway",
        "C. Azure VPN Gateway",
        "D. Microsoft Entra アプリケーションプロキシ"
      ],
      "answer": 3,
      "explanation": "Microsoft Entraアプリケーションプロキシは、オンプレミスのWebアプリケーションをVPNやDMZなしで外部に安全に公開できます。軽量なコネクタをオンプレミスにインストールするだけで、Microsoft Entra IDによる認証と条件付きアクセスを適用できます。Front DoorやApplication Gatewayはクラウド上のアプリケーション向けです。VPN Gatewayは外部公開ではなくプライベート接続に使用します。",
      "category": "identity",
      "tags": [
        "entra-id",
        "external-users",
        "app-proxy",
        "conditional-access",
        "load-balancers",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 12,
      "question": "Microsoft Entra IDのアクセスレビューに関して、以下の記述のうち正しいものの組み合わせはどれですか？\n・アプリケーションへのアクセス権をレビューできる\n・グループメンバーシップをレビューできる\n・Microsoft 365 E5ライセンスでアクセスレビューを利用できる",
      "choices": [
        "A. すべて正しい",
        "B. アプリケーションへのアクセス権とグループメンバーシップのみ正しい",
        "C. グループメンバーシップとM365 E5のみ正しい",
        "D. アプリケーションへのアクセス権のみ正しい"
      ],
      "answer": 0,
      "explanation": "Microsoft Entra IDのアクセスレビューは、アプリケーションへのアクセス権とグループメンバーシップの両方をレビューできます。また、Microsoft 365 E5ライセンスにはMicrosoft Entra ID P2が含まれているため、アクセスレビュー機能を利用できます。アクセスレビューはMicrosoft Entra ID P2またはMicrosoft Entra ID Governanceライセンスが必要です。",
      "category": "identity",
      "tags": [
        "entra-id",
        "entra-governance",
        "entra-license"
      ]
    },
    {
      "id": 13,
      "question": "Azure RBACのロール継承に関して、管理グループにOwnerロールを割り当てた場合、その配下のサブスクリプションとリソースグループにも同じロールが継承されますか？",
      "choices": [
        "A. はい、サブスクリプションとリソースグループの両方に継承される",
        "B. サブスクリプションのみに継承され、リソースグループには継承されない",
        "C. リソースグループのみに継承され、サブスクリプションには継承されない",
        "D. どちらにも継承されない"
      ],
      "answer": 0,
      "explanation": "Azure RBACでは、上位スコープで割り当てたロールは下位のすべてのスコープに継承されます。管理グループにOwnerロールを割り当てると、その配下のすべてのサブスクリプション、リソースグループ、および個々のリソースにOwner権限が継承されます。これはRBACの基本的な継承モデルです。",
      "category": "governance",
      "tags": [
        "rbac",
        "resource-hierarchy",
        "management-groups",
        "subscription-design"
      ]
    },
    {
      "id": 14,
      "question": "あなたはAzureサブスクリプションとMicrosoft Entraテナントの関連付けを変更する必要があります。この操作を実行するために必要な最小権限のロールはどれですか？",
      "choices": [
        "A. 所有者（Owner）",
        "B. 共同作成者（Contributor）",
        "C. ユーザーアクセス管理者",
        "D. 全体管理者"
      ],
      "answer": 0,
      "explanation": "サブスクリプションのディレクトリ（Entraテナント）変更には、サブスクリプションの所有者（Owner）ロールが必要です。共同作成者はリソースの管理はできますが、サブスクリプション自体のディレクトリ変更はできません。ユーザーアクセス管理者はロール割り当ての管理のみです。全体管理者はEntra IDの管理者であり、サブスクリプションレベルの操作には直接的な権限を持ちません。",
      "category": "governance",
      "tags": [
        "entra-id",
        "rbac",
        "subscription-design"
      ]
    },
    {
      "id": 15,
      "question": "あなたは経理部のユーザーのパスワードリセットを管理するため、管理単位「Accounting」を作成しました。User1に最小権限でAccountingのパスワードリセット権限を付与するには、どの操作を行うべきですか？",
      "choices": [
        "A. テナント全体のヘルプデスク管理者ロールにUser1を追加する",
        "B. テナント全体のパスワード管理者ロールにUser1を追加する",
        "C. Accounting管理単位のパスワード管理者ロールにUser1を追加する",
        "D. Accounting管理単位のヘルプデスク管理者ロールにUser1を追加する"
      ],
      "answer": 3,
      "explanation": "管理単位（Administrative Unit）を使用すると、特定のユーザーグループに対してのみ管理権限を付与できます。ヘルプデスク管理者ロールにはパスワードリセットの権限が含まれており、Accounting管理単位に限定して割り当てることで最小権限の原則を満たせます。テナント全体のロールは権限が広すぎます。パスワード管理者もパスワードリセットは可能ですが、ヘルプデスク管理者の方がより制限された権限であり、最小権限の原則に合致します。",
      "category": "identity",
      "tags": [
        "entra-id",
        "rbac",
        "admin-units"
      ]
    },
    {
      "id": 16,
      "question": "あなたは2つのAzureサブスクリプションを管理しています。Sub1はcontoso.comテナント、Sub2はfabrikam.comテナントに関連付けられています。fabrikam.comのユーザーにSub1のApp Serviceへのアクセスを許可するには、どうすべきですか？",
      "choices": [
        "A. fabrikam.comのユーザーをcontoso.comに同期する",
        "B. fabrikam.comのユーザーをcontoso.comにゲストユーザーとして招待する",
        "C. Sub2をcontoso.comテナントに移動する",
        "D. 両テナント間にVNet ピアリングを構成する"
      ],
      "answer": 1,
      "explanation": "Microsoft Entra B2Bコラボレーションを使用して、fabrikam.comのユーザーをcontoso.comテナントにゲストユーザーとして招待できます。招待されたユーザーは自身の資格情報でサインインし、contoso.comのリソースにアクセスできます。同期は異なるテナント間では直接できません。サブスクリプションの移動は大規模な変更であり、最小限の変更ではありません。VNetピアリングはネットワーク接続であり、認証・認可の問題は解決しません。",
      "category": "identity",
      "tags": [
        "entra-id",
        "external-users",
        "entra-connect",
        "subscription-design",
        "app-service",
        "vnet"
      ]
    },
    {
      "id": 17,
      "question": "あなたは5つのAzureサブスクリプション（それぞれ異なるEntraテナントに関連付け）のWindows VMからイベントログを収集する必要があります。データ収集ルール（DCR）を使用します。イベントログの転送、DCRの実行、複数テナントのデータ収集に適したサービスの組み合わせはどれですか？",
      "choices": [
        "A. イベントログ: Azure Storage、DCR: Log Analytics エージェント、複数テナント: Azure Arc",
        "B. イベントログ: Azure Event Hubs、DCR: Azure Monitorエージェント、複数テナント: Azure Lighthouse",
        "C. イベントログ: Log Analytics直接取込、DCR: Azure Functions、複数テナント: Azure AD B2B",
        "D. イベントログ: Azure Storage、DCR: Azure Monitorエージェント、複数テナント: 管理グループ"
      ],
      "answer": 1,
      "explanation": "Azure Event Hubsは大規模なイベントログの転送に適しています。Azure Monitorエージェント（AMA）はDCRを使用してデータ収集を実行する新しいエージェントです。Azure Lighthouseは複数テナントのリソースを一元管理でき、異なるテナントのサブスクリプションを横断してデータ収集が可能です。Log AnalyticsエージェントはレガシーでありDCRをサポートしません。管理グループは単一テナント内の管理階層です。",
      "category": "monitoring",
      "tags": [
        "entra-id",
        "external-users",
        "lighthouse",
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "azure-monitor",
        "log-analytics",
        "azure-functions",
        "event-driven"
      ]
    },
    {
      "id": 18,
      "question": "あなたは全体管理者がAzureポータルにアクセスする際にMFA（多要素認証）を必須にする必要があります。どの機能を使用すべきですか？",
      "choices": [
        "A. セキュリティの既定値群",
        "B. 条件付きアクセス",
        "C. Microsoft Entra ID Protection",
        "D. ユーザーごとのMFA"
      ],
      "answer": 1,
      "explanation": "条件付きアクセスポリシーを使用すると、特定のロール（全体管理者）がAzureポータルにアクセスする際にMFAを要求する条件を設定できます。セキュリティの既定値群はすべてのユーザーにMFAを要求しますが、全体管理者のみに限定できません。ID Protectionはリスクベースの条件付きアクセスであり、常にMFAを要求する設定には適しません。ユーザーごとのMFAは旧式の方法であり、条件（ポータルアクセス時のみ）の設定ができません。",
      "category": "identity",
      "tags": [
        "entra-id",
        "auth-methods",
        "rbac",
        "conditional-access"
      ]
    },
    {
      "id": 19,
      "question": "あなたはAzure Key Vaultを管理しています。開発者に一時的なKey Vaultへのアクセス権を付与し、使用後に自動的に権限を失効させたいと考えています。どの機能を使用すべきですか？",
      "choices": [
        "A. アクセスレビュー",
        "B. 条件付きアクセス",
        "C. マネージドID",
        "D. Microsoft Entra PIM（Privileged Identity Management）"
      ],
      "answer": 3,
      "explanation": "Microsoft Entra PIM（Privileged Identity Management）を使用すると、ジャストインタイム（JIT）アクセスとして、一時的な権限の付与と自動失効を実現できます。開発者は必要な時にアクセス権をアクティブ化し、設定された期間後に自動的に失効します。アクセスレビューは定期的なレビューであり、一時的なアクセス管理には適しません。条件付きアクセスはアクセス条件の制御であり、一時的な権限付与ではありません。マネージドIDはアプリケーション向けの機能です。",
      "category": "identity",
      "tags": [
        "entra-governance",
        "conditional-access",
        "pim",
        "managed-identity",
        "key-vault"
      ]
    },
    {
      "id": 20,
      "question": "あなたはAzure BlobストレージにアクセスするアプリケーションにSAS（Shared Access Signature）を使用しています。共有キーの使用を禁止し、時間制限を設け、最大のセキュリティを確保する必要があります。どの種類のSASを使用すべきですか？",
      "choices": [
        "A. サービスSAS",
        "B. アカウントSAS",
        "C. ユーザー委任SAS",
        "D. ストレージアクセスキー"
      ],
      "answer": 2,
      "explanation": "ユーザー委任SASは、Microsoft Entra IDの資格情報で署名されるため、ストレージアカウントの共有キーを使用しません。時間制限の設定が可能で、最も安全なSASの種類です。サービスSASとアカウントSASはストレージアカウントキーで署名されるため、共有キー禁止の要件を満たしません。ストレージアクセスキーは直接的なアクセス方法であり、SASではありません。",
      "category": "identity",
      "tags": [
        "entra-id",
        "access-keys",
        "sas",
        "azure-storage"
      ]
    },
    {
      "id": 21,
      "question": "あなたのアプリケーションはAzure VM上で実行され、Azure SQL Databaseにアクセスする必要があります。コード内にIDや資格情報を保存せず、VMの増加時に管理を最小限にしたいと考えています。どの認証方式を使用すべきですか？",
      "choices": [
        "A. サービスプリンシパル",
        "B. 接続文字列",
        "C. ユーザー割り当てマネージドID",
        "D. システム割り当てマネージドID"
      ],
      "answer": 3,
      "explanation": "システム割り当てマネージドIDは、VMに自動的にIDが付与され、コード内に資格情報を保存する必要がありません。VMのライフサイクルに連動して自動的に作成・削除されるため、管理が最小限で済みます。サービスプリンシパルは資格情報の管理が必要です。接続文字列はコード内に記述する必要があります。ユーザー割り当てマネージドIDも資格情報不要ですが、VMが増加する際にシステム割り当ての方が個別管理の手間が少なくなります。",
      "category": "identity",
      "tags": [
        "auth-methods",
        "app-registration",
        "managed-identity",
        "blob-storage",
        "sql-database"
      ]
    },
    {
      "id": 22,
      "question": "あなたは複数のAzure VM上でアプリケーションを実行しており、すべてのVMからAzure SQL Databaseにアクセスする必要があります。コード内にIDを記述せず、効率的に管理したいと考えています。どの認証方式を使用すべきですか？",
      "choices": [
        "A. サービスプリンシパル",
        "B. 接続文字列",
        "C. ユーザー割り当てマネージドID",
        "D. システム割り当てマネージドID"
      ],
      "answer": 2,
      "explanation": "ユーザー割り当てマネージドIDは、複数のVMで共有できるスタンドアロンのIDです。1つのIDを作成して複数のVMに割り当てることで、SQL Databaseへのアクセス権を一元管理できます。システム割り当てマネージドIDはVM個別に付与されるため、複数VMでの共有管理にはユーザー割り当ての方が効率的です。サービスプリンシパルは資格情報の管理が必要で、接続文字列はコード内に記述が必要です。",
      "category": "identity",
      "tags": [
        "auth-methods",
        "app-registration",
        "managed-identity",
        "sql-database"
      ]
    },
    {
      "id": 23,
      "question": "Azure Policyを割り当てることができるスコープはどれですか？（3つ選択）",
      "choices": [
        "A. サブスクリプション",
        "B. 管理グループ",
        "C. リソースグループ",
        "D. テナント",
        "E. 可用性ゾーン"
      ],
      "answer": [
        0,
        1,
        2
      ],
      "explanation": "Azure Policyは、管理グループ、サブスクリプション、リソースグループの3つのスコープに割り当てることができます。テナントレベルでの直接的なPolicy割り当てはできません（管理グループを通じて間接的に適用）。可用性ゾーンはインフラストラクチャの概念であり、Policyのスコープではありません。",
      "category": "governance",
      "tags": [
        "entra-id",
        "resource-hierarchy",
        "management-groups",
        "subscription-design",
        "azure-policy",
        "availability-zones"
      ]
    },
    {
      "id": 24,
      "question": "あなたは開発者がAzure VMを作成する際に、特定のリージョンとVMサイズに制限したいと考えています。複数のポリシーをまとめて適用するには、どの機能を使用すべきですか？",
      "choices": [
        "A. Azure Policy定義",
        "B. Azure Blueprint",
        "C. 管理グループ",
        "D. Azure Policyのイニシアチブ定義"
      ],
      "answer": 3,
      "explanation": "Azure Policyのイニシアチブ定義（ポリシーセット定義）を使用すると、複数のポリシー定義をグループ化して一括で割り当てることができます。リージョン制限とVMサイズ制限の2つのポリシーを1つのイニシアチブにまとめることで、効率的な管理が可能です。個別のPolicy定義では複数のポリシーをまとめられません。Blueprintは環境全体のテンプレートであり、この要件には過剰です。管理グループはスコープの管理であり、ポリシーのグループ化はできません。",
      "category": "governance",
      "tags": [
        "resource-hierarchy",
        "management-groups",
        "azure-policy",
        "blueprints"
      ]
    },
    {
      "id": 25,
      "question": "あなたはAzure Policyを使用してタグ管理を自動化したいと考えています。新規リソースにリソースグループのタグを継承させ、既存リソースのタグも修正する必要があります。どの効果（effect）を使用すべきですか？",
      "choices": [
        "A. Deny",
        "B. Audit",
        "C. Append",
        "D. Modify"
      ],
      "answer": 3,
      "explanation": "Modify効果は、リソースの作成時または更新時にプロパティ（タグを含む）を追加・変更・削除できます。既存のリソースに対しても修復タスクを実行してタグを修正できます。Denyはリソースの作成を拒否するだけでタグの継承はできません。Auditは非準拠リソースの記録のみで修正はしません。AppendはIPルールなどの配列フィールドの追加に使用され、タグの管理にはModifyが推奨されます。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "tagging",
        "automation-deploy"
      ]
    },
    {
      "id": 26,
      "question": "あなたはアプリケーションで使用するAPIキーをAzure Key Vaultに安全に保管したいと考えています。どのKey Vaultオブジェクトの種類を使用すべきですか？",
      "choices": [
        "A. シークレット",
        "B. キー",
        "C. 証明書",
        "D. ストレージアカウントキー"
      ],
      "answer": 0,
      "explanation": "Key Vaultのシークレットは、APIキー、パスワード、接続文字列などのテキストベースの機密情報を安全に保存するために使用します。キー（Key）は暗号化操作（暗号化・復号化・署名・検証）に使用する暗号化キーです。証明書はTLS/SSL証明書の管理に使用します。ストレージアカウントキーはKey Vaultオブジェクトの種類ではなく、ストレージアカウントのアクセスキーです。",
      "category": "identity",
      "tags": [
        "access-keys",
        "key-vault",
        "azure-storage"
      ]
    }
  ]
};
