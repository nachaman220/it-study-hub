INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.3', 2, 3, 'Azure Cosmos DB', 'cosmosdb', '<h1>2.6-2.7 Azure Cosmos DB</h1>

      <!-- ==================== -->
      <h2 id="cosmosdb">2.6 非リレーショナルデータベース</h2>

      <h3>Azure Cosmos DB の概要</h3>
      <p>Azure Cosmos DB は、グローバル分散型のマルチモデル NoSQL データベースサービス。低レイテンシ、高スループット、高可用性を特徴とし、ミッションクリティカルなアプリケーションに適している。</p>

      <ul>
        <li><strong>マルチマスターレプリケーション</strong>：複数のリージョンで書き込みが可能。どのリージョンからでも読み書きできる</li>
        <li><strong>99.999% の可用性 SLA</strong>：マルチリージョン構成で業界最高水準の可用性を提供</li>
        <li><strong>5つの整合性レベル</strong>：Strong / Bounded Staleness / Session / Consistent Prefix / Eventual から選択</li>
        <li><strong>自動インデックス作成</strong>：すべてのプロパティに自動でインデックスが作成される</li>
      </ul>

      <h3>API オプション</h3>
      <p>Cosmos DB は複数の API をサポートしており、既存のアプリケーションやスキルセットに合わせた API を選択できる。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>API</th><th>データモデル</th><th>特徴</th><th>移行元</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>NoSQL</strong></td><td>ドキュメント（JSON）</td><td>SQL ライクなクエリ構文を使用。Cosmos DB ネイティブ。新規開発に推奨</td><td>新規アプリケーション</td></tr>
            <tr><td><strong>MongoDB</strong></td><td>ドキュメント（BSON）</td><td>MongoDB ワイヤプロトコル互換</td><td>既存の MongoDB アプリ</td></tr>
            <tr><td><strong>Apache Cassandra</strong></td><td>ワイドカラム</td><td>CQL（Cassandra Query Language）互換</td><td>既存の Cassandra アプリ</td></tr>
            <tr><td><strong>Apache Gremlin</strong></td><td>グラフ</td><td>Gremlin トラバーサル言語対応</td><td>グラフデータベースのワークロード</td></tr>
            <tr><td><strong>Table</strong></td><td>キーバリュー</td><td>Azure Table Storage API 互換。より高機能</td><td>Azure Table Storage からの移行</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: Cosmos DB for Table vs Azure Table Storage</div>
        <ul>
          <li><strong>Cosmos DB for Table</strong>：グローバル分散、低レイテンシ（10ms以下）、自動インデックス、SLA保証。高機能だがコストも高い</li>
          <li><strong>Azure Table Storage</strong>：単一リージョン、シンプル、低コスト</li>
          <li>高い可用性やグローバル分散が必要な場合は Cosmos DB for Table、コスト重視なら Azure Table Storage を選択</li>
        </ul>
      </div>

      <h3>Cosmos DB for PostgreSQL</h3>
      <p>PostgreSQL エンジンをベースとした、Citus 拡張機能による水平スケーリングに対応したサービス。大規模な PostgreSQL ワークロードに適している。</p>
      <ul>
        <li>テーブルのシャーディング（分散配置）により水平スケーリングを実現</li>
        <li><strong>マルチマスター不可</strong>：他の Cosmos DB API と異なり、書き込みはプライマリノードのみ</li>
        <li>読み取りレプリカによるリードスケーリングは可能</li>
        <li>既存の PostgreSQL アプリケーションをそのまま使用可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 「NoSQL」の2つの意味</div>
        <ul>
          <li><strong>広義の NoSQL</strong>：リレーショナル DB 以外のデータベース全般（ドキュメント、キーバリュー、グラフなど）</li>
          <li><strong>Cosmos DB の「NoSQL」API</strong>：Cosmos DB が提供する特定の API 名。SQL ライクなクエリが使える</li>
          <li>試験問題では文脈から「NoSQL」がどちらの意味で使われているか注意して読み取ること</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="cosmosdb-params">2.7 設計パラメータ</h2>

      <h3>要求ユニット（RU）</h3>
      <p>Cosmos DB ではスループットを「要求ユニット（RU/s）」で表現する。RU はデータベース操作のコストを正規化した単位。</p>
      <ul>
        <li><strong>1 RU</strong> = 1KB のアイテムを1回読み取る（ポイントリード）コスト</li>
        <li>書き込みは読み取りよりもコストが高い（概ね5〜6倍）</li>
        <li>クエリの複雑さ、アイテムサイズ、インデックス使用状況によって消費 RU が変動</li>
      </ul>

      <h3>容量モード</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>モード</th><th>課金方式</th><th>スループット</th><th>適したシナリオ</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>プロビジョニングスループット</strong></td><td>設定した RU/s に対する時間課金</td><td>固定（手動設定）</td><td>予測可能なワークロード。安定したトラフィック</td></tr>
            <tr><td><strong>自動スケーリング</strong></td><td>使用した最大 RU/s に対する時間課金</td><td>自動調整（最大値の10%〜100%）</td><td>トラフィックが変動するワークロード</td></tr>
            <tr><td><strong>サーバーレス</strong></td><td>消費した RU の従量課金</td><td>バースト対応</td><td>開発/テスト、断続的なトラフィック</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 自動スケーリング vs サーバーレス</div>
        <ul>
          <li><strong>自動スケーリング</strong>：時間単位で課金される。常時稼働するワークロードで、ピークに備えたい場合に最適</li>
          <li><strong>サーバーレス</strong>：使用した RU の従量課金。アイドル時間が長い場合にコスト効率が良い</li>
          <li>「トラフィックが予測できないが常時アクセスがある」→ 自動スケーリング</li>
          <li>「開発環境やアクセスがまばら」→ サーバーレス</li>
        </ul>
      </div>

      <h3>アクセス制御</h3>
      <p>Cosmos DB へのアクセスを制御する方法は複数用意されている。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>方式</th><th>説明</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>RBAC（ロールベースアクセス制御）</strong></td><td>Entra ID の ID に対して Cosmos DB の組み込みロール or カスタムロールを割り当て</td><td>推奨される方式。きめ細かいアクセス制御が可能</td></tr>
            <tr><td><strong>プライマリキー / セカンダリキー</strong></td><td>アカウントレベルのマスターキー。フルアクセス権限</td><td>管理操作。キーのローテーションにセカンダリキーを活用</td></tr>
            <tr><td><strong>リソーストークン</strong></td><td>特定のコンテナーやアイテムへの一時的なアクセス権を付与するトークン</td><td>エンドユーザーへの限定的なアクセス許可</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        プライマリキー/セカンダリキーはフルアクセス権限を持つため、本番環境ではできるだけ RBAC を使用することが推奨される。キーの漏洩リスクを低減できる。
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-nosql">判断フロー：NoSQL サービスの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>グローバル分散 + マルチリージョン書込 + 低レイテンシ → <strong>Cosmos DB</strong></li>
          <li>既存 MongoDB アプリの移行 → <strong>Cosmos DB for MongoDB</strong></li>
          <li>既存 Cassandra アプリの移行 → <strong>Cosmos DB for Cassandra</strong></li>
          <li>グラフデータの管理 → <strong>Cosmos DB for Gremlin</strong></li>
          <li>Azure Table Storage の高機能版 → <strong>Cosmos DB for Table</strong></li>
          <li>新規 NoSQL アプリ → <strong>Cosmos DB for NoSQL</strong>（推奨）</li>
          <li>PostgreSQL + 水平スケーリング → <strong>Cosmos DB for PostgreSQL</strong></li>
          <li>キャッシュ / セッション管理 → <strong>Azure Cache for Redis</strong></li>
          <li>低コストの単純なキーバリュー → <strong>Azure Table Storage</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/introduction" target="_blank">MS Learn: Azure Cosmos DB の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/choose-api" target="_blank">MS Learn: API の選択</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/request-units" target="_blank">MS Learn: 要求ユニット</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/throughput-serverless" target="_blank">MS Learn: プロビジョニングスループットとサーバーレス</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/how-to-setup-rbac" target="_blank">MS Learn: RBAC の構成</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/postgresql/introduction" target="_blank">MS Learn: Cosmos DB for PostgreSQL</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();