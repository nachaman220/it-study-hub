INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.2', 4, 2, 'アプリケーションアーキテクチャ', 'app-architecture', '<h1>4.2 アプリケーションアーキテクチャ</h1>

      <!-- ==================== メッセージング ==================== -->
      <h2 id="messaging">メッセージングサービス</h2>
      <p>分散アプリケーションにおいてコンポーネント間の通信を疎結合化するために、メッセージングサービスを利用する。メッセージングにはキュー（1 対 1）とトピック（パブリッシュ/サブスクライブ、1 対多）の 2 つの基本パターンがある。</p>

      <h3>Azure Queue Storage</h3>
      <p>Azure Storage アカウントの一機能として提供されるシンプルなキューサービス。</p>
      <ul>
        <li>メッセージの最大サイズは <strong>64 KB</strong></li>
        <li>キューの容量は事実上<strong>無制限</strong>（Storage アカウントの容量まで）</li>
        <li>REST API でアクセス。シンプルなキューイングに適している</li>
      </ul>

      <h3>Azure Service Bus</h3>
      <p>エンタープライズ向けのフルマネージドメッセージブローカー。キューとトピックの両方をサポートする。</p>
      <ul>
        <li><strong>キュー</strong> — 1 対 1 のメッセージ配信（1 つのコンシューマーが処理）</li>
        <li><strong>トピック</strong> — パブリッシュ/サブスクライブ（1 つのメッセージを複数のサブスクライバーが受信）</li>
        <li>メッセージの最大サイズは <strong>256 KB</strong>（Standard）/ <strong>100 MB</strong>（Premium）</li>
        <li>キュー容量は最大 <strong>80 GB</strong></li>
        <li><strong>FIFO 保証</strong>にはセッション機能を使用する</li>
        <li>トランザクション、重複検出、デッドレター キューなどのエンタープライズ機能を装備</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「FIFO（先入先出）が必要」→ <strong>Service Bus + セッション</strong></li>
          <li>「1 対多のメッセージ配信」→ <strong>Service Bus トピック</strong></li>
          <li>「シンプルなキュー + 大容量」→ <strong>Azure Queue Storage</strong></li>
          <li>Queue Storage は 64 KB / 無制限容量、Service Bus は 256 KB / 80 GB</li>
        </ul>
      </div>

      <!-- ==================== イベントドリブン ==================== -->
      <h2 id="event-driven">イベントドリブンアーキテクチャ</h2>

      <h3>Azure Event Grid</h3>
      <p>パブリッシュ/サブスクライブ型のイベントルーティングサービス。Azure サービスやカスタムアプリからの「出来事（イベント）」を、サブスクライバーに配信する。リソースの状態変更（Blob の作成、リソースグループの変更など）をトリガーに、Functions や Logic Apps などを起動するシナリオに最適。</p>

      <h3>Azure Event Hubs</h3>
      <p>大量のイベントやテレメトリデータを受信するための高スループットなデータストリーミングサービス。毎秒<strong>数百万件</strong>のイベントを処理できる。</p>
      <ul>
        <li><strong>キャプチャ機能</strong> — 受信したイベントを Azure Data Lake Storage Gen2 に自動保存。保存形式は <strong>Avro</strong>、<strong>Parquet</strong>、<strong>Delta Lake</strong> に対応</li>
        <li>IoT デバイスからのテレメトリ、ログ集約、クリックストリーム分析に適している</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>Event Grid</strong> → Azure サービス間の統合・イベントルーティング（「Blob が作成されたら Functions を実行」など）</li>
          <li><strong>Event Hubs</strong> → 大量データのストリーミング・取り込み（「毎秒百万件のテレメトリを処理」など）</li>
          <li>この 2 つの使い分けは頻出。サービス統合 = Event Grid、大量データ処理 = Event Hubs</li>
        </ul>
      </div>

      <!-- ==================== キャッシュ ==================== -->
      <h2 id="caching">キャッシュソリューション</h2>

      <h3>Azure CDN</h3>
      <p>コンテンツ配信ネットワーク。世界各地のポイント オブ プレゼンス（PoP）にコンテンツをキャッシュし、ユーザーに最も近い場所から配信することでレイテンシを削減する。静的コンテンツ（画像、CSS、JS）の配信高速化に有効。</p>

      <h3>Azure Cache for Redis</h3>
      <p>Redis ベースのフルマネージドなインメモリデータストア。データベースへのアクセスを減らし、アプリケーションの応答速度を大幅に向上させる。セッション管理、ページキャッシュ、リーダーボードなどに利用される。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「DB の読み取り負荷を軽減したい」「応答速度を改善したい」→ <strong>Azure Cache for Redis</strong>。「静的コンテンツの配信を高速化したい」→ <strong>CDN</strong>。
      </div>

      <!-- ==================== 統合 ==================== -->
      <h2 id="api-management">API 管理と統合</h2>

      <h3>Azure API Management</h3>
      <p>バックエンドの API に対してゲートウェイを提供し、認証・認可、使用量の制限（レート制限）、変換、監視などの横断的な機能を一元管理するサービス。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>接続種類</th>
              <th>説明</th>
              <th>必要な SKU</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>なし（外部アクセスのみ）</strong></td>
              <td>API ゲートウェイがパブリックに公開される</td>
              <td>すべての SKU</td>
            </tr>
            <tr>
              <td><strong>VNet 外部</strong></td>
              <td>ゲートウェイは VNet 内に配置されるが、外部からアクセス可能</td>
              <td><strong>Premium</strong></td>
            </tr>
            <tr>
              <td><strong>VNet 内部</strong></td>
              <td>ゲートウェイは VNet 内のみからアクセス可能</td>
              <td><strong>Premium</strong></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        API Management の VNet 統合（外部/内部）→ <strong>Premium SKU</strong> が必要。
      </div>

      <h3>Azure Logic Apps</h3>
      <p>ノーコード/ローコードのワークフロー自動化サービス。数百種類のコネクタを使って、異なるサービス間の統合を視覚的に構築できる。</p>
      <ul>
        <li>トリガー例：スケジュール（定期実行）、Gmail の受信、HTTP リクエスト</li>
        <li>アクション例：Azure Functions の呼び出し、メール送信、DB 操作</li>
        <li><strong>オンプレミスデータゲートウェイ</strong>を使うと、オンプレミスのデータソース（SQL Server、ファイルサーバー等）にも接続可能</li>
      </ul>

      <!-- ==================== 構成管理 ==================== -->
      <h2 id="config-management">構成管理</h2>

      <h3>Azure App Configuration</h3>
      <p>アプリケーションの設定値を一元的に管理するサービス。複数のアプリやマイクロサービスの構成を集中管理し、変更を即座に反映できる。</p>
      <ul>
        <li>キーと値のペアで設定を管理（ラベル機能で環境ごとに分離可能）</li>
        <li><strong>機能フラグ</strong>（Feature Flag）により、コードを変更せずに機能の有効/無効を切り替えられる</li>
        <li>Key Vault への参照をサポートし、機密情報は Key Vault に保持したまま参照可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>App Configuration</strong> → アプリケーションの構成・設定値の一元管理、機能フラグ</li>
          <li><strong>Key Vault</strong> → シークレット（パスワード、接続文字列、証明書）の保護</li>
          <li>この 2 つは補完関係にあり、混同しないこと</li>
        </ul>
      </div>

      <!-- ==================== 自動化デプロイ ==================== -->
      <h2 id="automation-deploy">自動化デプロイ</h2>

      <h3>ARM テンプレート / Bicep</h3>
      <p>Infrastructure as Code（IaC）を実現する Azure ネイティブのツール。JSON 形式の ARM テンプレートまたは Bicep（DSL）でリソースの望ましい状態を定義し、宣言的にデプロイする。</p>
      <ul>
        <li>冪等性（何度実行しても同じ結果）を持つ</li>
        <li>リソースグループ、サブスクリプション、管理グループ、テナントのいずれのスコープにもデプロイ可能</li>
        <li>テンプレートスペックとして共有・バージョン管理が可能</li>
      </ul>

      <h3>Azure Automation</h3>
      <p>クラウドおよびオンプレミス環境の管理タスクを自動化するサービス。Runbook を使って定型作業を自動実行する。</p>
      <ul>
        <li><strong>Runbook</strong> — PowerShell または Python で記述する自動化スクリプト</li>
        <li>スケジュール実行、Webhook トリガー、アラートからの起動が可能</li>
        <li>Update Management による OS パッチ管理にも利用される</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「インフラをコードで管理したい」→ <strong>ARM テンプレート / Bicep</strong></li>
          <li>「定期的な運用タスクを自動化したい」→ <strong>Azure Automation + Runbook</strong></li>
          <li>ARM テンプレートは宣言的（What）、Runbook は手続き的（How）</li>
        </ul>
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-architecture">判断フロー：アーキテクチャコンポーネントの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>1 対 1 のメッセージ配信、シンプル・大容量 → <strong>Azure Queue Storage</strong></li>
          <li>1 対 1 + FIFO / エンタープライズ機能 → <strong>Service Bus キュー + セッション</strong></li>
          <li>1 対多のメッセージ配信 → <strong>Service Bus トピック</strong></li>
          <li>Azure サービス間のイベント統合 → <strong>Event Grid</strong></li>
          <li>大量データのストリーミング取り込み → <strong>Event Hubs</strong></li>
          <li>静的コンテンツの高速配信 → <strong>CDN</strong></li>
          <li>DB 読み取りの高速化 → <strong>Azure Cache for Redis</strong></li>
          <li>API のゲートウェイ・レート制限 → <strong>API Management</strong></li>
          <li>サービス間ワークフローの自動化 → <strong>Logic Apps</strong></li>
          <li>アプリ設定の一元管理 → <strong>App Configuration</strong></li>
          <li>機密情報の管理 → <strong>Key Vault</strong></li>
          <li>インフラのコード化 → <strong>ARM テンプレート / Bicep</strong></li>
          <li>運用タスクの自動化 → <strong>Azure Automation</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/queues/storage-queues-introduction" target="_blank">MS Learn: Azure Queue Storage</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/service-bus-messaging/service-bus-messaging-overview" target="_blank">MS Learn: Azure Service Bus</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/event-grid/overview" target="_blank">MS Learn: Azure Event Grid</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/event-hubs/event-hubs-about" target="_blank">MS Learn: Azure Event Hubs</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cdn/cdn-overview" target="_blank">MS Learn: Azure CDN</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-cache-for-redis/cache-overview" target="_blank">MS Learn: Azure Cache for Redis</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/api-management/api-management-key-concepts" target="_blank">MS Learn: API Management</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/logic-apps/logic-apps-overview" target="_blank">MS Learn: Logic Apps</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-app-configuration/overview" target="_blank">MS Learn: App Configuration</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/templates/overview" target="_blank">MS Learn: ARM テンプレート</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/automation/overview" target="_blank">MS Learn: Azure Automation</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();