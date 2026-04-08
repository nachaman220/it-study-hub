var QUIZ_DATA_book_ch4 = {
  "source": "original",
  "questions": [
    {
      "id": 1,
      "question": "SQL Serverを稼働させるAzure VMを選定する必要があります。条件はSR-IOV対応、15,000 IOPSの確保、そしてコストの最小化です。適切なVMシリーズとディスク種別の組み合わせはどれでしょうか。",
      "choices": [
        "A. NCシリーズ + Ultra Disk",
        "B. DSシリーズ + Premium SSD",
        "C. NVシリーズ + Standard SSD",
        "D. Fシリーズ + Premium SSD"
      ],
      "answer": 1,
      "explanation": "DSシリーズはPremium Storageに対応した汎用仮想マシンで、SR-IOVもサポートしています。Premium SSDは最大20,000 IOPSまで対応でき、15,000 IOPSの要件を満たしつつUltra Diskよりも費用を抑えられます。NCシリーズはGPUコンピューティング用途、NVシリーズはGPUによるビジュアライゼーション向けのため、SQL Serverにはオーバースペックです。FシリーズはCPU最適化型ですが、Premium Storageへの対応が限定的です。",
      "category": "compute",
      "tags": [
        "virtual-machines"
      ]
    },
    {
      "id": 2,
      "question": "Azure VM上でSQL Serverを動かす場合、ログファイル用ディスクとデータファイル用ディスクそれぞれに推奨されるホストキャッシュの設定はどれですか。",
      "choices": [
        "A. ログ: Read-only、データ: Read/Write",
        "B. ログ: None、データ: Read-only",
        "C. ログ: Read-only、データ: None",
        "D. ログ: None、データ: None"
      ],
      "answer": 1,
      "explanation": "SQL Server VMにおけるベストプラクティスとして、ログファイル用ディスクのホストキャッシュはNoneに設定します。ログは順次書き込みが主体であり、読み取りキャッシュのメリットがないためです。データファイル用ディスクにはRead-onlyキャッシュを設定します。データファイルはランダムな読み取りが頻繁に発生するため、キャッシュがパフォーマンス改善に寄与します。Read/Writeキャッシュはデータ破損を招くおそれがあるため推奨されません。",
      "category": "compute",
      "tags": [
        "caching"
      ]
    },
    {
      "id": 3,
      "question": "Azure App Serviceでデプロイスロットを利用するには、最低でもどのサービスプランが必要ですか。",
      "choices": [
        "A. Free",
        "B. Basic",
        "C. Standard",
        "D. Premium"
      ],
      "answer": 2,
      "explanation": "デプロイスロットはStandard以上のApp Serviceプランで使用できます。この機能を活用すると、本番環境に影響を及ぼさずにアプリをテストでき、スワップ操作で即時デプロイが可能になります。FreeプランやBasicプランではデプロイスロットは利用できません。Standardプランでは5スロット、Premiumプランでは20スロットまで作成できます。",
      "category": "compute",
      "tags": [
        "entra-license",
        "app-service"
      ]
    },
    {
      "id": 4,
      "question": "AKS（Azure Kubernetes Service）上でWindowsコンテナーのワークロードを自動スケーリングしたいと考えています。どのスケーリング方式を採用すべきでしょうか。",
      "choices": [
        "A. 仮想ノード",
        "B. クラスターオートスケーラー",
        "C. 水平ポッドオートスケーラー（HPA）のみ",
        "D. KEDA"
      ],
      "answer": 1,
      "explanation": "クラスターオートスケーラーはノードプール内のノード数を需要に応じて自動増減させる仕組みで、Windowsノードプールにも対応しています。仮想ノード（Virtual Nodes）はAzure Container Instancesと連携して拡張しますが、Linuxコンテナー限定のためWindowsには使えません。HPAはポッド単位のスケーリングであり、ノード自体の追加は行いません。KEDAはイベントドリブンのスケーリングを実現しますが、ノードの自動追加にはクラスターオートスケーラーとの併用が必要です。",
      "category": "compute",
      "tags": [
        "containers",
        "event-driven"
      ]
    },
    {
      "id": 5,
      "question": "Azure Functionsを使って、実行に5分から20分を要する処理を動かす必要があります。どのホスティングプランを選ぶべきですか。",
      "choices": [
        "A. 従量課金プラン",
        "B. Premium プラン",
        "C. App Service プラン（Free）",
        "D. 従量課金プラン（タイムアウト延長）"
      ],
      "answer": 1,
      "explanation": "Azure FunctionsのPremiumプランは実行時間の上限を柔軟に設定でき（既定30分、最大無制限）、5～20分の処理にも対応可能です。従量課金プランは既定5分、最大10分のタイムアウトがあり、20分の処理には対応できません。App ServiceプランのFreeティアにもタイムアウト制約があります。加えてPremiumプランではVNET統合やウォームアップインスタンスといった付加機能も利用できます。",
      "category": "compute",
      "tags": [
        "entra-license",
        "app-service",
        "azure-functions"
      ]
    },
    {
      "id": 6,
      "question": "大量の並列バッチ処理を実行する計画があります。ジョブの特性に応じて異なるVM構成を使い分けたい場合、どのAzureサービスが最適でしょうか。",
      "choices": [
        "A. Azure Functions",
        "B. Azure Batch",
        "C. Azure Container Instances",
        "D. Azure Logic Apps"
      ],
      "answer": 1,
      "explanation": "Azure Batchは大規模並列バッチ処理に特化しており、ジョブの特性ごとに異なるプール（VM構成）を構築できます。CPU集約型、GPU搭載型、メモリ最適化型など、ジョブに最も適した構成を柔軟に選択可能です。Azure Functionsはイベント駆動型の短時間処理向けです。Container Instancesは個別のコンテナー実行に適しています。Logic Appsはワークフロー自動化のためのサービスです。",
      "category": "compute",
      "tags": [
        "containers",
        "azure-functions",
        "batch",
        "event-driven",
        "api-management",
        "automation-deploy"
      ]
    },
    {
      "id": 7,
      "question": "メッセージングシステムの設計において、FIFO（先入先出）での順序保証が求められています。どのAzureサービスおよび機能を利用すべきですか。",
      "choices": [
        "A. Azure Queue Storage",
        "B. Azure Event Hubs パーティション",
        "C. Azure Service Bus セッション",
        "D. Azure Event Grid"
      ],
      "answer": 2,
      "explanation": "Azure Service Busのセッション機能を使うと、メッセージのFIFO順序が保証されます。セッションIDを基にメッセージの順序が管理され、関連するメッセージを正しい順番で処理できます。Queue Storageは基本的なキュー機能を提供しますが、厳密なFIFO保証はありません。Event Hubsはパーティション内での順序を保ちますが、メッセージングにおけるFIFO保証にはService Busのセッションの方が適しています。Event Gridはイベント配信のサービスで、順序保証の仕組みはありません。",
      "category": "compute",
      "tags": [
        "messaging",
        "event-driven"
      ]
    },
    {
      "id": 8,
      "question": "イベントドリブンアーキテクチャを構築中です。Azureリソースの状態変化を検知し、複数のサブスクライバーへ通知を送る必要があります。Azure Event GridとAzure Event Hubsのどちらが適していますか。",
      "choices": [
        "A. Event Grid（イベントの反応・ルーティングに特化）",
        "B. Event Hubs（イベントの反応・ルーティングに特化）",
        "C. Event Grid（大規模ストリーム取り込みに特化）",
        "D. Event Hubs（リソース状態変更の通知に特化）"
      ],
      "answer": 0,
      "explanation": "Azure Event Gridはイベント駆動型アーキテクチャ向けに設計されており、Azureリソースの状態変化を検知して、Azure FunctionsやLogic Appsなどの複数サブスクライバーへルーティングします。Event Hubsは大量のデータストリーム取り込みを得意とし、IoTデータやログの大規模取り込みに向いています。リソースの状態変化に対する通知用途にはEvent Gridが最適です。",
      "category": "compute",
      "tags": [
        "azure-functions",
        "event-driven",
        "api-management"
      ]
    },
    {
      "id": 9,
      "question": "Azure API Managementで仮想ネットワーク（VNet）統合を使い、バックエンドAPIをプライベートネットワーク内に配置したいと考えています。どの価格レベルが必要でしょうか。",
      "choices": [
        "A. Developer",
        "B. Basic",
        "C. Standard",
        "D. Premium"
      ],
      "answer": 3,
      "explanation": "Azure API ManagementにおけるVNet統合（内部モード・外部モード）は、Premiumティアで利用可能です。Developerティアでも技術的にはVNet統合に対応していますが、SLAが提供されず本番運用には不向きです。BasicおよびStandardティアではVNet統合がサポートされていません。PremiumティアではさらにマルチリージョンへのデプロイやAvailability Zonesへの対応も可能です。",
      "category": "network",
      "tags": [
        "availability-zones",
        "api-management",
        "vnet"
      ]
    },
    {
      "id": 10,
      "question": "Webアプリケーションの応答速度を改善したいと考えています。画像やCSS、JavaScriptなどの静的コンテンツを世界中に配信するサービスと、セッション情報やDBクエリ結果などの動的データをキャッシュするサービスは、それぞれどれを使うべきですか。",
      "choices": [
        "A. 静的コンテンツ: Azure CDN、動的データ: Azure CDN",
        "B. 静的コンテンツ: Azure Cache for Redis、動的データ: Azure CDN",
        "C. 静的コンテンツ: Azure CDN、動的データ: Azure Cache for Redis",
        "D. 静的コンテンツ: Azure Front Door、動的データ: Azure Table Storage"
      ],
      "answer": 2,
      "explanation": "Azure CDNは世界各地のエッジサーバーを通じて静的コンテンツを高速配信し、遅延を軽減します。Azure Cache for Redisはインメモリデータストアとして、セッション情報やデータベースクエリの結果など動的データのキャッシュに最適です。CDNは動的データのキャッシュには向いておらず、Redis Cacheは静的ファイルの配信用途には使いません。",
      "category": "compute",
      "tags": [
        "load-balancers",
        "caching"
      ]
    },
    {
      "id": 11,
      "question": "インフラのデプロイを自動化したいと考えています。宣言的なテンプレートでリソースを定義し、何度実行しても同じ結果になる冪等性のあるデプロイを実現するには、どのサービスが適切ですか。",
      "choices": [
        "A. Azure Automation Runbook",
        "B. ARM テンプレート / Bicep",
        "C. Azure CLI スクリプト",
        "D. Azure PowerShell スクリプト"
      ],
      "answer": 1,
      "explanation": "ARMテンプレートおよびBicepは、Azureリソースを宣言的に記述するIaC（Infrastructure as Code）ツールです。冪等性を備えており、同一テンプレートを複数回デプロイしても結果は変わりません。Azure Automation Runbookは手続き的にスクリプトを実行するもので、宣言的なアプローチとは異なります。Azure CLIやPowerShellのスクリプトも手続き型の手法に分類されます。",
      "category": "compute",
      "tags": [
        "automation-deploy"
      ]
    },
    {
      "id": 12,
      "question": "オンプレミスネットワークとAzure VNetをインターネット経由で暗号化された常時接続で結び、複数の拠点を接続する必要があります。どのVPN接続方式を選ぶべきでしょうか。",
      "choices": [
        "A. ポイント対サイト（P2S）VPN",
        "B. サイト間（S2S）VPN",
        "C. VNet ピアリング",
        "D. ExpressRoute"
      ],
      "answer": 1,
      "explanation": "サイト間（S2S）VPNは、オンプレミスのVPN機器とAzure VPN Gateway間にIPsecトンネルを構築し、暗号化された常時接続の通信を確立します。複数拠点の接続にも対応できます。ポイント対サイト（P2S）VPNは個々の端末からの接続に使うもので、拠点全体の接続には向きません。VNetピアリングはAzure内のVNet同士を結ぶサービスです。ExpressRouteはインターネットを経由しない専用回線接続です。",
      "category": "network",
      "tags": [
        "vnet",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 13,
      "question": "オンプレミス環境とAzureの間に、高帯域・低遅延の専用接続を確保する必要があります。インターネットを通さない通信が求められています。どのサービスを選択すべきですか。",
      "choices": [
        "A. VPN Gateway（S2S）",
        "B. ExpressRoute",
        "C. Azure Front Door",
        "D. VPN Gateway（P2S）"
      ],
      "answer": 1,
      "explanation": "ExpressRouteは接続プロバイダーを介して、オンプレミスとAzure間にプライベートな専用回線を提供します。インターネットを経由しないため、最大100Gbpsの高帯域と低遅延を実現できます。VPN GatewayはIPsecトンネルによる接続ですが、インターネットを通る経路となります。Front DoorはグローバルHTTPロードバランサーであり、専用接続の用途ではありません。",
      "category": "network",
      "tags": [
        "load-balancers",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 14,
      "question": "Azure Virtual WANのBasic SKUとStandard SKUにはどのような違いがありますか。正しい記述を選んでください。",
      "choices": [
        "A. BasicはS2S VPNのみサポートし、StandardはS2S VPN、P2S VPN、ExpressRoute、VNet間接続をサポートする",
        "B. BasicはExpressRouteのみサポートし、StandardはVPNのみサポートする",
        "C. BasicとStandardは同じ機能を持つ",
        "D. BasicはP2S VPNのみサポートし、StandardはすべてのVPN種類をサポートする"
      ],
      "answer": 0,
      "explanation": "Virtual WANのBasic SKUが対応する接続タイプはサイト間（S2S）VPNのみです。Standard SKUではS2S VPN、ポイント対サイト（P2S）VPN、ExpressRoute、仮想ネットワーク間の接続、ハブ間接続など、すべての接続タイプが利用可能です。複数種類の接続を必要とする場合はStandard SKUを選択する必要があります。",
      "category": "network",
      "tags": [
        "vnet",
        "on-premises-connectivity"
      ]
    },
    {
      "id": 15,
      "question": "Azure Private Linkに関して、サービスエンドポイントとプライベートエンドポイントの違いを正しく説明しているものはどれですか。",
      "choices": [
        "A. サービスエンドポイントはVNet内のプライベートIPを割り当て、プライベートエンドポイントはパブリックIPを使用する",
        "B. プライベートエンドポイントはVNet内のプライベートIPを割り当て、サービスエンドポイントはサービスへのルートを最適化する",
        "C. 両方ともプライベートIPを割り当てる",
        "D. 両方ともパブリックIPを使用する"
      ],
      "answer": 1,
      "explanation": "プライベートエンドポイントはVNet内のサブネットにプライベートIPアドレスを付与し、Azureサービスへのプライベート接続を実現します。通信はMicrosoftのバックボーンネットワーク内で完結します。サービスエンドポイントはVNetからAzureサービスへの経路をAzureバックボーン経由に最適化しますが、サービス側のパブリックIPアドレスはそのまま残ります。セキュリティ面ではプライベートエンドポイントの方が優れており、オンプレミスやピアリングVNetからの接続もサポートしています。",
      "category": "network",
      "tags": [
        "vnet",
        "private-link"
      ]
    },
    {
      "id": 16,
      "question": "Azure環境のネットワークセキュリティを設計しています。サブネット単位のトラフィック制御にはNSGを使いますが、ネットワーク全体を集中管理できるセキュリティサービスとしてはどれを選ぶべきですか。",
      "choices": [
        "A. Azure DDoS Protection",
        "B. Azure Firewall",
        "C. Azure WAF",
        "D. Azure Front Door"
      ],
      "answer": 1,
      "explanation": "Azure Firewallは集中型のネットワークセキュリティ管理を担うマネージドファイアウォールです。L3～L7のフィルタリング、脅威インテリジェンス連携、FQDNフィルタリング、URLフィルタリングなどの高度な機能を備えています。NSGはサブネットやNIC単位での基本的なフィルタリングに適していますが、高度なセキュリティ機能は限られます。DDoS ProtectionはDDoS攻撃への防御に特化したサービスです。WAFはWebアプリケーション層の防御を担います。",
      "category": "network",
      "tags": [
        "load-balancers",
        "vnet",
        "network-security"
      ]
    },
    {
      "id": 17,
      "question": "Azure環境をDDoS攻撃から守る必要があります。Azure DDoS Protectionのプランについて正しい説明はどれですか。",
      "choices": [
        "A. DDoS Protectionは無料で全リソースに自動適用される",
        "B. DDoS Network Protection（有料）はVNetに対して適用され、テレメトリとアラートを提供する",
        "C. DDoS Protectionは個別のVMに対してのみ適用される",
        "D. DDoS ProtectionはApplication Gatewayでのみ使用可能"
      ],
      "answer": 1,
      "explanation": "Azure DDoS Network Protection（旧称Standard）は有料のプランで、仮想ネットワーク内のリソースに対し高度なDDoS軽減機能を提供します。攻撃に関するテレメトリ、診断ログ、アラート機能、コスト保護保証が含まれます。Azureプラットフォーム自体には無料の基本DDoS保護（Infrastructure Protection）が組み込まれていますが、より高度な防御を行うにはNetwork Protectionの導入が必要です。",
      "category": "network",
      "tags": [
        "diagnostic-settings",
        "alerts",
        "load-balancers",
        "vnet",
        "network-security"
      ]
    },
    {
      "id": 18,
      "question": "Azure WAF（Web Application Firewall）をデプロイ可能なサービスはどれですか。（3つ選択）",
      "choices": [
        "A. Azure Application Gateway",
        "B. Azure Front Door",
        "C. Azure CDN",
        "D. Azure Load Balancer",
        "E. Azure Traffic Manager"
      ],
      "answer": [
        0,
        1,
        2
      ],
      "explanation": "Azure WAFのデプロイ先として対応しているのは、Application Gateway、Front Door、CDN（Azure CDN from Microsoft）の3つです。WAFはOWASP Top 10に含まれる脆弱性（SQLインジェクション、XSSなど）からWebアプリケーションを防御します。Load BalancerはL4レベルのロードバランサーであるためWAFには対応しません。Traffic ManagerはDNSベースの負荷分散サービスで、こちらもWAF非対応です。",
      "category": "network",
      "tags": [
        "load-balancers",
        "caching",
        "network-security"
      ]
    },
    {
      "id": 19,
      "question": "オンプレミスで稼働中のサーバーやアプリケーションをAzureへ移行する計画を進めています。移行の評価・計画・実行を一つの場所で管理できるサービスはどれですか。",
      "choices": [
        "A. Azure Site Recovery",
        "B. Azure Migrate",
        "C. Azure Resource Mover",
        "D. Azure Advisor"
      ],
      "answer": 1,
      "explanation": "Azure Migrateはオンプレミスからのクラウド移行を一元的に管理するハブサービスです。サーバー、データベース、Webアプリケーションの検出から評価、実際の移行までを統合的に実施できます。Site Recoveryは災害復旧や移行実行のツールですが、事前の評価機能は備えていません。Resource MoverはAzureのリージョン間でリソースを移動するためのサービスです。Advisorは運用上の推奨事項を提示するサービスであり、移行管理の機能はありません。",
      "category": "compute",
      "tags": [
        "site-recovery",
        "data-migration"
      ]
    },
    {
      "id": 20,
      "question": "データベースの移行を検討しています。DMS（Database Migration Service）、DMA（Data Migration Assistant）、SSMA（SQL Server Migration Assistant）の役割の違いについて、正しい説明はどれですか。",
      "choices": [
        "A. DMSはオンライン移行（最小ダウンタイム）をサポートし、DMAはSQL Serverの互換性評価を行い、SSMAは非SQL Server DBからSQL Serverへの移行を支援する",
        "B. DMAはオンライン移行をサポートし、DMSは互換性評価を行い、SSMAはSQL Server間の移行を支援する",
        "C. SSMAはオンライン移行をサポートし、DMSは非SQL Server DBからの移行を支援し、DMAは互換性評価を行う",
        "D. 3つとも同じ機能を提供する"
      ],
      "answer": 0,
      "explanation": "DMS（Azure Database Migration Service）はダウンタイムを最小限に抑えたオンライン移行に対応し、SQL Server、MySQL、PostgreSQLなどのデータベースをAzureへ移行できます。DMA（Data Migration Assistant）はSQL ServerからAzure SQL DatabaseやManaged Instanceへの移行に先立ち、互換性の評価や改善の提案を行うツールです。SSMA（SQL Server Migration Assistant）はOracle、MySQL、Accessなど、SQL Server以外のデータベースからSQL Serverへのスキーマ変換とデータ移行を支援します。",
      "category": "data",
      "tags": [
        "sql-database",
        "data-migration",
        "db-migration"
      ]
    }
  ]
};
