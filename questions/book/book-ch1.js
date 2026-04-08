var QUIZ_DATA_book_ch1 = {
  "source": "original",
  "questions": [
    {
      "id": 1,
      "question": "社内のAzureインフラを担当しているとします。Azureリソースに所属部門の情報を付与して、運用管理を効率化したい場合、どの機能を利用すべきですか？",
      "choices": [
        "A. タグ",
        "B. 管理グループ",
        "C. リソースグループ",
        "D. サブスクリプション"
      ],
      "answer": 0,
      "explanation": "タグを使えば、Azureリソースにキーと値の形式でメタデータを付与でき、部門名やコストセンターなどの情報を柔軟に追加できます。管理グループはサブスクリプション間の階層的な管理を目的としており、個々のリソースへの情報付与には不向きです。リソースグループはリソースを論理的にまとめるものであり、部門名のようなカスタムメタデータの設定はできません。サブスクリプションは課金の境界であり、リソース単位での情報追加には利用できません。",
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
      "question": "Windows Server 2022が300台稼働している環境で、すべてのシステムログを集中的に監視する必要があります。Azure Monitorエージェントの導入でこの要件は実現可能ですか？",
      "choices": [
        "A. はい",
        "B. いいえ"
      ],
      "answer": 0,
      "explanation": "Azure Monitorエージェント（AMA）をインストールすれば、Windows/Linuxのサーバーからログやパフォーマンス指標を収集してLog Analyticsワークスペースへ転送できます。データ収集ルール（DCR）によって取得するログの種類を自由に指定できるため、300台規模のシステムログ集中監視という要件にも対応可能です。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics"
      ]
    },
    {
      "id": 3,
      "question": "Azure Monitor ログを利用してLinuxサーバーのログ分析を行っています。日次のログ取り込み量が約120GBあり、費用を抑えたいと考えています。どのような対応が適切ですか？",
      "choices": [
        "A. 基本ログに変更する",
        "B. 分析ログのままにする",
        "C. ログの保持期間を短縮する",
        "D. ワークスペースを分割する"
      ],
      "answer": 0,
      "explanation": "基本ログ（Basic Logs）は分析ログ（Analytics Logs）と比べて取り込み単価がおよそ半額に抑えられます。大量のログを取り込むものの高度な分析が必要ない場面では、基本ログへの切り替えがコスト削減に効果的です。ただしKQLクエリに一部制約があり、クエリ実行ごとに課金が発生する点には注意が必要です。保持期間の変更やワークスペース分割では十分な費用削減が見込めません。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics"
      ]
    },
    {
      "id": 4,
      "question": "Azure VM上のデータをLog Analyticsへ送信する際、転送途中にログの変換処理を行いたいと考えています。転送先とログ変換手段の正しい組み合わせはどれですか？",
      "choices": [
        "A. ログ転送: データ収集エンドポイント、ログ変換: KQLクエリ",
        "B. ログ転送: Azure Event Hubs、ログ変換: Azure Functions",
        "C. ログ転送: ストレージアカウント、ログ変換: Logic Apps",
        "D. ログ転送: Azure Monitor API、ログ変換: PowerShellスクリプト"
      ],
      "answer": 0,
      "explanation": "データ収集ルール（DCR）においてデータ収集エンドポイント（DCE）を利用してログを転送し、KQLクエリによるインジェスト時変換を適用できます。これにより、Log Analyticsへ取り込む前段階でデータのフィルタリングや加工が可能です。Event Hubsやストレージアカウント経由ではLog Analyticsへの直接取り込みに適していません。Azure FunctionsやLogic Appsでの変換は構成が過大になります。",
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
      "question": "Azure Monitor ログにおける、WindowsイベントログとLinux Syslogの格納先テーブル名の正しい組み合わせを選んでください。",
      "choices": [
        "A. WindowsイベントログのテーブルはEvent、Linux SyslogのテーブルはSyslog",
        "B. WindowsイベントログのテーブルはWindowsEvent、Linux SyslogのテーブルはLinuxSyslog",
        "C. WindowsイベントログのテーブルはSecurityEvent、Linux SyslogのテーブルはSyslogData",
        "D. WindowsイベントログのテーブルはEventLog、Linux SyslogのテーブルはSyslogMessages"
      ],
      "answer": 0,
      "explanation": "Log Analyticsワークスペースでは、WindowsイベントログはEventテーブルに、Linux SyslogデータはSyslogテーブルに保存されます。SecurityEventテーブルはセキュリティ関連イベント専用です。WindowsEventやLinuxSyslogという名称のテーブルは実在しません。",
      "category": "monitoring",
      "tags": [
        "azure-monitor",
        "log-analytics",
        "event-driven"
      ]
    },
    {
      "id": 6,
      "question": "あるAzureサブスクリプション上で、Network Insights、Application Insights、VM Insightsの3つを利用する場合、最低限必要なLog Analyticsワークスペースの数はいくつですか？",
      "choices": [
        "A. 1",
        "B. 2",
        "C. 3",
        "D. 4"
      ],
      "answer": 0,
      "explanation": "Network Insights、Application Insights、VM Insightsはいずれも同一のLog Analyticsワークスペースに集約可能です。したがって最低1つあれば運用できます。複数のInsightsを1つのワークスペースに統合することで、データ間の相関分析が容易になるだけでなく、運用コストも抑えられます。",
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
      "question": "Azureサブスクリプション内に存在するリソースの一覧を、毎月のレポートとしてまとめる必要があります。適切なサービスの組み合わせはどれですか？",
      "choices": [
        "A. Azure Resource Graph、Azure Functions",
        "B. アクティビティログ、Log Analyticsワークスペース",
        "C. Azure Advisor、ストレージアカウント",
        "D. Azure Monitor メトリック、Azure Dashboard"
      ],
      "answer": 1,
      "explanation": "アクティビティログにはサブスクリプション内のリソース操作（作成・変更・削除）の履歴が記録されます。Log Analyticsワークスペースへ転送すれば、KQLで集計・分析を行い、月次レポートに必要なデータを抽出できます。Resource Graphはリアルタイムのリソースクエリ向けで、過去の変更履歴の分析には不向きです。Azure Advisorはベストプラクティスの提案サービスであり、リソース一覧の生成用途とは異なります。",
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
      "question": "Azure Cost Managementを利用して、各部門の利用コストを可視化・管理したいと考えています。最適な機能はどれですか？",
      "choices": [
        "A. 管理グループ",
        "B. リソースグループ",
        "C. リソースのタグ",
        "D. サブスクリプション"
      ],
      "answer": 2,
      "explanation": "リソースにタグ（例：Department: Sales）を設定すれば、Cost Managementでタグ単位にコストのフィルタリングや分析が可能になります。部門別のコスト配賦を柔軟に実現できる手段です。管理グループやサブスクリプションは組織構造の管理に使えるものの、複数部門にまたがるリソースがある場合は柔軟性に欠けます。リソースグループは1リソースにつき1つしか所属できないため、部門別コスト管理には不十分です。",
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
      "question": "NSG（ネットワークセキュリティグループ）の診断データを収集する際、ストレージアカウントでの保持期間とLog Analyticsでの最大保持期間の正しい組み合わせはどれですか？",
      "choices": [
        "A. ストレージアカウント: 30日、Log Analytics: 365日",
        "B. ストレージアカウント: 90日、Log Analytics: 730日",
        "C. ストレージアカウント: 180日、Log Analytics: 365日",
        "D. ストレージアカウント: 365日、Log Analytics: 730日"
      ],
      "answer": 1,
      "explanation": "NSGフローログの診断データは、ストレージアカウントではデフォルトで最大90日まで保持されます。一方、Log Analyticsワークスペースでは最大730日（2年間）のデータ保持が可能です。これらの保持期間を把握しておくことは、コンプライアンス対応やコスト最適化の観点で重要です。",
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
      "question": "従業員向けWebアプリケーションにSSOを導入する必要があります。このアプリケーションは独自のHTMLログインフォームを備え、パスワード認証で動作しています。どのSSO方式が適していますか？",
      "choices": [
        "A. SAML",
        "B. パスワードベース",
        "C. リンクされたSSO",
        "D. 統合Windows認証"
      ],
      "answer": 1,
      "explanation": "パスワードベースSSOは、独自のHTMLログインフォームを持つアプリケーションに適した方式です。Microsoft Entra IDがユーザーの認証情報を安全に管理し、ログイン画面へ自動入力します。SAMLはSAMLプロトコル対応のアプリケーション用であり、カスタムHTMLフォームには適合しません。リンクされたSSOは別のSSO基盤が既にある場合に使います。統合Windows認証はKerberosベースのオンプレミス環境向けです。",
      "category": "identity",
      "tags": [
        "entra-id",
        "sso"
      ]
    },
    {
      "id": 11,
      "question": "オンプレミスで運用しているWebアプリケーションを、VPN接続やDMZ構築なしで外部ユーザーに安全に公開したいと考えています。どのサービスを選択すべきですか？",
      "choices": [
        "A. Azure Front Door",
        "B. Azure Application Gateway",
        "C. Azure VPN Gateway",
        "D. Microsoft Entra アプリケーションプロキシ"
      ],
      "answer": 3,
      "explanation": "Microsoft Entraアプリケーションプロキシを使うと、オンプレミス環境に軽量なコネクタを設置するだけで、VPNやDMZを介さずにWebアプリケーションを外部へ安全に公開できます。Microsoft Entra IDの認証や条件付きアクセスも併用可能です。Front DoorやApplication Gatewayはクラウドでホストされるアプリケーション向けです。VPN Gatewayはプライベートネットワーク接続を提供するもので、外部公開の手段ではありません。",
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
      "question": "Microsoft Entra IDのアクセスレビュー機能について、次の記述の正誤の組み合わせとして正しいものはどれですか？\n・アプリケーションのアクセス権限を見直すことができる\n・グループへの所属状況をレビューできる\n・Microsoft 365 E5ライセンスでこの機能を使用できる",
      "choices": [
        "A. すべて正しい",
        "B. アプリケーションへのアクセス権とグループメンバーシップのみ正しい",
        "C. グループメンバーシップとM365 E5のみ正しい",
        "D. アプリケーションへのアクセス権のみ正しい"
      ],
      "answer": 0,
      "explanation": "Microsoft Entra IDのアクセスレビューでは、アプリケーションへのアクセス権とグループメンバーシップの両方を対象に定期的な見直しが可能です。さらに、Microsoft 365 E5ライセンスにはMicrosoft Entra ID P2が含まれるため、アクセスレビュー機能が利用できます。この機能にはMicrosoft Entra ID P2またはMicrosoft Entra ID Governanceライセンスが必要です。",
      "category": "identity",
      "tags": [
        "entra-id",
        "entra-governance",
        "entra-license"
      ]
    },
    {
      "id": 13,
      "question": "Azure RBACのロール継承について質問です。管理グループにOwnerロールを付与した場合、配下のサブスクリプションやリソースグループにもそのロールは引き継がれますか？",
      "choices": [
        "A. はい、サブスクリプションとリソースグループの両方に継承される",
        "B. サブスクリプションのみに継承され、リソースグループには継承されない",
        "C. リソースグループのみに継承され、サブスクリプションには継承されない",
        "D. どちらにも継承されない"
      ],
      "answer": 0,
      "explanation": "Azure RBACでは、上位スコープに割り当てられたロールは配下のすべてのスコープへ自動的に継承されます。管理グループにOwnerロールを設定すると、その下にある全サブスクリプション、リソースグループ、さらに個別のリソースに対してもOwner権限が適用されます。これがRBACの基本的な継承の仕組みです。",
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
      "question": "AzureサブスクリプションとMicrosoft Entraテナントの紐付けを変更する操作を行うために、最低限必要なロールはどれですか？",
      "choices": [
        "A. 所有者（Owner）",
        "B. 共同作成者（Contributor）",
        "C. ユーザーアクセス管理者",
        "D. 全体管理者"
      ],
      "answer": 0,
      "explanation": "サブスクリプションが属するディレクトリ（Entraテナント）を切り替えるには、サブスクリプションの所有者（Owner）ロールが必要です。共同作成者はリソース操作は可能ですが、サブスクリプション自体のディレクトリ変更は行えません。ユーザーアクセス管理者はロール割り当ての操作に限定されます。全体管理者はEntra IDの管理権限であり、サブスクリプション操作への直接的な権限は持ちません。",
      "category": "governance",
      "tags": [
        "entra-id",
        "rbac",
        "subscription-design"
      ]
    },
    {
      "id": 15,
      "question": "経理部門のユーザーのパスワードリセットを管理するため、「Accounting」という管理単位を作成しました。User1に対して、この管理単位の範囲内だけでパスワードリセットが行えるよう、最小権限で設定するにはどうすべきですか？",
      "choices": [
        "A. テナント全体のヘルプデスク管理者ロールにUser1を追加する",
        "B. テナント全体のパスワード管理者ロールにUser1を追加する",
        "C. Accounting管理単位のパスワード管理者ロールにUser1を追加する",
        "D. Accounting管理単位のヘルプデスク管理者ロールにUser1を追加する"
      ],
      "answer": 3,
      "explanation": "管理単位（Administrative Unit）を活用すれば、特定のユーザー群に限定した管理権限を付与できます。ヘルプデスク管理者ロールにはパスワードリセット権限が含まれており、Accounting管理単位にスコープを限定することで最小権限の原則を満たせます。テナント全体に対するロール付与では権限範囲が広すぎます。パスワード管理者でもリセットは行えますが、ヘルプデスク管理者はより限定的な権限セットのため、最小権限に適合します。",
      "category": "identity",
      "tags": [
        "entra-id",
        "rbac",
        "admin-units"
      ]
    },
    {
      "id": 16,
      "question": "2つのAzureサブスクリプションを運用しています。Sub1はcontoso.comテナント、Sub2はfabrikam.comテナントに紐づいています。fabrikam.comのユーザーがSub1内のApp Serviceを利用できるようにするには、どのような対応が必要ですか？",
      "choices": [
        "A. fabrikam.comのユーザーをcontoso.comに同期する",
        "B. fabrikam.comのユーザーをcontoso.comにゲストユーザーとして招待する",
        "C. Sub2をcontoso.comテナントに移動する",
        "D. 両テナント間にVNet ピアリングを構成する"
      ],
      "answer": 1,
      "explanation": "Microsoft Entra B2Bコラボレーションにより、fabrikam.comのユーザーをcontoso.comテナントへゲストとして招待できます。招待を受けたユーザーは自組織の認証情報でサインインし、contoso.com側のリソースを利用可能になります。異なるテナント間の直接同期は行えません。サブスクリプションの移動は影響範囲が大きく、最小限の変更とはいえません。VNetピアリングはネットワーク層の接続であり、認証やアクセス許可の課題は解決しません。",
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
      "question": "5つのAzureサブスクリプション（それぞれ異なるEntraテナントに紐づけ）上のWindows VMからイベントログを収集する必要があります。データ収集ルール（DCR）を使用する前提で、イベントログ転送・DCR実行・複数テナントからのデータ収集に適したサービスの組み合わせはどれですか？",
      "choices": [
        "A. イベントログ: Azure Storage、DCR: Log Analytics エージェント、複数テナント: Azure Arc",
        "B. イベントログ: Azure Event Hubs、DCR: Azure Monitorエージェント、複数テナント: Azure Lighthouse",
        "C. イベントログ: Log Analytics直接取込、DCR: Azure Functions、複数テナント: Azure AD B2B",
        "D. イベントログ: Azure Storage、DCR: Azure Monitorエージェント、複数テナント: 管理グループ"
      ],
      "answer": 1,
      "explanation": "Azure Event Hubsは大規模イベントログの転送に適しています。Azure Monitorエージェント（AMA）はDCRに対応した新世代のエージェントです。Azure Lighthouseを使えば、異なるテナントに属する複数サブスクリプションのリソースを一元的に管理しデータを収集できます。旧式のLog Analyticsエージェントはdcr非対応です。管理グループは同一テナント内の階層管理用であり、テナント横断の管理はできません。",
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
      "question": "全体管理者がAzureポータルへサインインする際に、MFA（多要素認証）を必ず求めるようにしたいと考えています。どの機能を利用すべきですか？",
      "choices": [
        "A. セキュリティの既定値群",
        "B. 条件付きアクセス",
        "C. Microsoft Entra ID Protection",
        "D. ユーザーごとのMFA"
      ],
      "answer": 1,
      "explanation": "条件付きアクセスポリシーを使えば、全体管理者ロールを持つユーザーがAzureポータルにアクセスする場面に限定してMFAを要求できます。セキュリティの既定値群は全ユーザーにMFAを適用しますが、特定ロールだけに絞ることはできません。ID Protectionはリスクベースのポリシーであり、常時MFA強制には適しません。ユーザーごとのMFA設定は従来の方式で、アクセス先に応じた条件指定ができません。",
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
      "question": "Azure Key Vaultを運用しています。開発者に対して一時的にKey Vaultへのアクセスを許可し、一定期間後に自動で権限が取り消される仕組みを導入したい場合、どの機能が適切ですか？",
      "choices": [
        "A. アクセスレビュー",
        "B. 条件付きアクセス",
        "C. マネージドID",
        "D. Microsoft Entra PIM（Privileged Identity Management）"
      ],
      "answer": 3,
      "explanation": "Microsoft Entra PIM（Privileged Identity Management）を活用すると、ジャストインタイム（JIT）方式で一時的な権限付与と自動失効を実装できます。開発者は必要時にアクセスをアクティブ化し、設定した期限が来れば自動的に権限が無効化されます。アクセスレビューは定期的な棚卸し用途であり、即時の一時アクセス管理とは異なります。条件付きアクセスはアクセス条件の制御機能で、期間限定の権限付与には向きません。マネージドIDはアプリケーション用の認証手段です。",
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
      "question": "Azure BlobストレージにアクセスするアプリケーションでSAS（Shared Access Signature）を利用しています。ストレージアカウントの共有キーを使わず、有効期限を設定しつつ最大限のセキュリティを確保するには、どの種類のSASを選ぶべきですか？",
      "choices": [
        "A. サービスSAS",
        "B. アカウントSAS",
        "C. ユーザー委任SAS",
        "D. ストレージアクセスキー"
      ],
      "answer": 2,
      "explanation": "ユーザー委任SASはMicrosoft Entra IDの認証情報を用いて署名されるため、ストレージアカウントの共有キーに依存しません。有効期限の指定も可能で、SASの中で最も安全性が高い方式です。サービスSASやアカウントSASはストレージアカウントキーで署名されるため、共有キー不使用の要件を満たせません。ストレージアクセスキーはキー自体を直接利用する手段であり、SASとは別の仕組みです。",
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
      "question": "Azure VM上で稼働するアプリケーションからAzure SQL Databaseへ接続する必要があります。ソースコードに認証情報を埋め込まず、VMの台数が増えても管理負荷を最小にしたい場合、どの認証方式を採用すべきですか？",
      "choices": [
        "A. サービスプリンシパル",
        "B. 接続文字列",
        "C. ユーザー割り当てマネージドID",
        "D. システム割り当てマネージドID"
      ],
      "answer": 3,
      "explanation": "システム割り当てマネージドIDはVMに自動でIDが付与され、コード内に資格情報を保存する必要がありません。VMのライフサイクルと連動して作成・削除が自動的に行われるため、運用負荷が最小限に抑えられます。サービスプリンシパルは認証情報の管理が別途必要です。接続文字列はコード中に記述することになります。ユーザー割り当てマネージドIDも資格情報は不要ですが、VMが増えるたびにID割り当て管理が必要となり、システム割り当てに比べて手間がかかります。",
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
      "question": "複数のAzure VMで動くアプリケーションが、共通してAzure SQL Databaseにアクセスする必要があります。コード内にID情報を書かず、アクセス権を効率よく一括管理するには、どの認証方式を選ぶべきですか？",
      "choices": [
        "A. サービスプリンシパル",
        "B. 接続文字列",
        "C. ユーザー割り当てマネージドID",
        "D. システム割り当てマネージドID"
      ],
      "answer": 2,
      "explanation": "ユーザー割り当てマネージドIDは独立したIDリソースとして作成でき、複数のVMに共有して紐づけることが可能です。1つのIDを作成して全VMに割り当てれば、SQL Databaseへのアクセス権を一元的に管理できます。システム割り当てマネージドIDはVM個別のIDとなるため、複数VMでの共通管理にはユーザー割り当て方式の方が効率的です。サービスプリンシパルは認証情報の管理が発生し、接続文字列はコード内記述が必要です。",
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
      "question": "Azure Policyの割り当てが可能なスコープを3つ選んでください。",
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
      "explanation": "Azure Policyは管理グループ、サブスクリプション、リソースグループの3階層に対して割り当てが可能です。テナントレベルへの直接割り当てはできず、管理グループを介して間接的にカバーします。可用性ゾーンはインフラの物理的な構成要素であり、Policyの適用スコープとしては定義されていません。",
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
      "question": "開発者がAzure VMを作成する際、利用可能なリージョンとVMサイズを制限したいと考えています。関連する複数のポリシーをまとめて一括で適用するには、どの機能を使うべきですか？",
      "choices": [
        "A. Azure Policy定義",
        "B. Azure Blueprint",
        "C. 管理グループ",
        "D. Azure Policyのイニシアチブ定義"
      ],
      "answer": 3,
      "explanation": "Azure Policyのイニシアチブ定義（ポリシーセット定義）を利用すると、複数のポリシー定義をひとまとめにして一括で割り当てられます。リージョン制限とVMサイズ制限を1つのイニシアチブにまとめれば、管理効率が向上します。個別のPolicy定義では複数ポリシーのグループ化ができません。Blueprintは環境全体のテンプレート化であり、この用途には大がかりすぎます。管理グループはスコープ管理用であり、ポリシーの集約機能はありません。",
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
      "question": "Azure Policyでタグの運用を自動化したいと考えています。新しく作成されるリソースにリソースグループのタグを自動継承させ、既に存在するリソースのタグも修正する場合、どの効果（effect）を指定すべきですか？",
      "choices": [
        "A. Deny",
        "B. Audit",
        "C. Append",
        "D. Modify"
      ],
      "answer": 3,
      "explanation": "Modify効果を使えば、リソースの作成時や更新時にタグなどのプロパティを追加・変更・削除できます。また、修復タスクにより既存リソースのタグも自動修正が可能です。Denyはリソース作成の拒否のみでタグ継承はできません。Auditは非準拠リソースの記録だけで実際の修正は行いません。Appendは配列型フィールドへの追加用途であり、タグ管理にはModifyの使用が推奨されています。",
      "category": "governance",
      "tags": [
        "azure-policy",
        "tagging",
        "automation-deploy"
      ]
    },
    {
      "id": 26,
      "question": "アプリケーションで利用するAPIキーをAzure Key Vaultに安全に保管したい場合、どのKey Vaultオブジェクト種別を使うべきですか？",
      "choices": [
        "A. シークレット",
        "B. キー",
        "C. 証明書",
        "D. ストレージアカウントキー"
      ],
      "answer": 0,
      "explanation": "Key Vaultのシークレットは、APIキーやパスワード、接続文字列といったテキスト形式の機密情報を安全に格納するためのオブジェクト種別です。キー（Key）は暗号化・復号化・署名・検証に使う暗号鍵の管理用です。証明書はTLS/SSL証明書のライフサイクル管理向けです。ストレージアカウントキーはKey Vaultのオブジェクト種別ではなく、ストレージアカウント側のアクセスキーを指します。",
      "category": "identity",
      "tags": [
        "access-keys",
        "key-vault",
        "azure-storage"
      ]
    }
  ]
};
