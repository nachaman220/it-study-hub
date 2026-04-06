INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.1', 2, 1, 'Azure Storage', 'storage', '<h1>2.1-2.3 Azure Storage & Blob</h1>

      <!-- ==================== -->
      <h2 id="data-fundamentals">2.1 データソリューションの基礎</h2>

      <h3>データの分類</h3>
      <p>データは構造の有無によって3種類に分類される。適切なストレージサービスを選定するには、まずデータの種類を理解する必要がある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>分類</th><th>特徴</th><th>例</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>構造化データ</strong></td><td>固定スキーマ、行と列で表現。RDBMSで管理</td><td>顧客テーブル、受注テーブル</td></tr>
            <tr><td><strong>半構造化データ</strong></td><td>スキーマは緩やか。タグやキーで自己記述的</td><td>JSON、XML、YAML</td></tr>
            <tr><td><strong>非構造化データ</strong></td><td>スキーマなし。バイナリやテキストの塊</td><td>画像、動画、PDF、ログファイル</td></tr>
          </tbody>
        </table>
      </div>

      <h3>ストレージの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>仕組み</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ブロックストレージ</strong></td><td>データを固定サイズのブロックに分割して保存。低レイテンシ</td><td>VM のディスク（Managed Disks）</td></tr>
            <tr><td><strong>ファイルストレージ</strong></td><td>階層型ディレクトリ構造。SMB/NFS プロトコル</td><td>ファイル共有（Azure Files）</td></tr>
            <tr><td><strong>オブジェクトストレージ</strong></td><td>フラットな名前空間。メタデータ付きオブジェクト。HTTP/REST</td><td>非構造化データの大量保存（Blob Storage）</td></tr>
          </tbody>
        </table>
      </div>

      <h3>リレーショナル DB vs NoSQL</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>比較項目</th><th>リレーショナル DB</th><th>NoSQL</th></tr>
          </thead>
          <tbody>
            <tr><td>データモデル</td><td>テーブル（行と列）</td><td>ドキュメント、キーバリュー、グラフなど</td></tr>
            <tr><td>スキーマ</td><td>固定（事前定義）</td><td>柔軟（スキーマレスが多い）</td></tr>
            <tr><td>スケーリング</td><td>垂直スケール（スケールアップ）が基本</td><td>水平スケール（スケールアウト）が得意</td></tr>
            <tr><td>トランザクション</td><td>ACID を完全サポート</td><td>BASE（結果整合性が多い）</td></tr>
            <tr><td>適用領域</td><td>会計、在庫管理など厳密な整合性が必要な業務</td><td>IoT、SNS、リアルタイム分析など大規模・柔軟なデータ</td></tr>
          </tbody>
        </table>
      </div>

      <h3>NoSQL データモデル</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>モデル</th><th>代表的なDB</th><th>特徴</th><th>ユースケース</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>キーバリュー</strong></td><td>Redis</td><td>キーに対して1つの値を格納。極めて高速</td><td>セッション管理、キャッシュ</td></tr>
            <tr><td><strong>ワイドカラム</strong></td><td>Apache Cassandra</td><td>行ごとに列を自由に追加可能</td><td>時系列データ、IoT</td></tr>
            <tr><td><strong>ドキュメント</strong></td><td>MongoDB</td><td>JSON/BSON形式のドキュメントを格納</td><td>コンテンツ管理、カタログ</td></tr>
            <tr><td><strong>グラフ</strong></td><td>Neo4j</td><td>ノードとエッジで関係性を表現</td><td>ソーシャルグラフ、レコメンデーション</td></tr>
          </tbody>
        </table>
      </div>

      <h3>データウェアハウス vs データレイク</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>比較項目</th><th>データウェアハウス（DWH）</th><th>データレイク</th></tr>
          </thead>
          <tbody>
            <tr><td>データ形式</td><td>構造化データ（ETL 済み）</td><td>あらゆる形式（生データ）</td></tr>
            <tr><td>スキーマ</td><td>スキーマオンライト（書込時に定義）</td><td>スキーマオンリード（読取時に定義）</td></tr>
            <tr><td>処理方式</td><td>SQL ベースの分析クエリ</td><td>バッチ処理やストリーム処理</td></tr>
            <tr><td>ユーザー</td><td>ビジネスアナリスト</td><td>データサイエンティスト・エンジニア</td></tr>
            <tr><td>Azure サービス</td><td>Synapse 専用 SQL プール</td><td>ADLS Gen2</td></tr>
          </tbody>
        </table>
      </div>

      <h3>Delta Lake</h3>
      <p>Delta Lake は、データレイク上に ACID トランザクション、スキーマ管理、タイムトラベル（履歴バージョンへのアクセス）などを追加するオープンソースのストレージレイヤー。データレイクの信頼性を大幅に向上させ、「レイクハウス」アーキテクチャの基盤となる技術。Azure Databricks で標準的に利用される。</p>

      <!-- ==================== -->
      <h2 id="azure-storage">2.2 Azure Storage</h2>

      <h3>Azure Storage のデータサービス</h3>
      <p>Azure Storage アカウントは、以下の複数のデータサービスをまとめて提供するコンテナー。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>サービス</th><th>種類</th><th>プロトコル</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Blob Storage</strong></td><td>オブジェクト</td><td>REST (HTTP/HTTPS)</td><td>画像・動画・バックアップなど非構造化データの大量保存</td></tr>
            <tr><td><strong>Azure Files</strong></td><td>ファイル共有</td><td>SMB / NFS</td><td>クラウド上のファイルサーバー。オンプレミスからのマウントも可能</td></tr>
            <tr><td><strong>Table Storage</strong></td><td>キーバリュー（NoSQL）</td><td>REST (OData)</td><td>スキーマレスな構造化データの格納（低コスト）</td></tr>
            <tr><td><strong>Queue Storage</strong></td><td>メッセージキュー</td><td>REST</td><td>非同期メッセージング。最大64KBのメッセージ</td></tr>
            <tr><td><strong>Azure NetApp Files</strong></td><td>ファイル共有</td><td>NFS / SMB</td><td>エンタープライズ向け高性能ファイルストレージ（NetApp技術ベース）</td></tr>
          </tbody>
        </table>
      </div>

      <h3>ストレージアカウントの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>対応サービス</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Standard 汎用 v2</strong></td><td>Blob / Files / Table / Queue</td><td>最も汎用的。HDD ベース。ほとんどのシナリオで推奨</td></tr>
            <tr><td><strong>Premium ブロック Blob</strong></td><td>ブロック Blob / 追加 Blob</td><td>SSD ベース。低レイテンシが必要なシナリオ向け</td></tr>
            <tr><td><strong>Premium ページ Blob</strong></td><td>ページ Blob のみ</td><td>SSD ベース。非管理ディスク用</td></tr>
            <tr><td><strong>Premium ファイル共有</strong></td><td>Azure Files のみ</td><td>SSD ベース。高 IOPS が必要なファイル共有向け</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box important">
        <div class="info-box-title">POINT: Premium 汎用 v2 は存在しない</div>
        「Premium 汎用 v2」というアカウント種類は存在しない。Premium 性能が必要な場合は、用途に応じてブロック Blob / ページ Blob / ファイル共有のいずれかの Premium アカウントを選択する必要がある。
      </div>

      <h3>冗長性オプション</h3>
      <p>Azure Storage はデータの耐障害性を確保するため、複数のコピーを自動作成する。回復力の低い順から以下の4つのオプションが用意されている。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>オプション</th><th>コピー数</th><th>範囲</th><th>説明</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>LRS</strong>（ローカル冗長）</td><td>3</td><td>単一データセンター内</td><td>最も安価。DC障害には対応できない</td></tr>
            <tr><td><strong>ZRS</strong>（ゾーン冗長）</td><td>3</td><td>同一リージョンの3つの可用性ゾーン</td><td>ゾーン障害に耐性あり</td></tr>
            <tr><td><strong>GRS</strong>（geo冗長）</td><td>6</td><td>プライマリ(LRS) + セカンダリリージョン(LRS)</td><td>リージョン障害に対応。セカンダリは読取不可（RA-GRSで読取可能）</td></tr>
            <tr><td><strong>GZRS</strong>（geoゾーン冗長）</td><td>6</td><td>プライマリ(ZRS) + セカンダリリージョン(LRS)</td><td>最高の耐障害性。RA-GZRSでセカンダリ読取可能</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Premium ストレージアカウントでは LRS と ZRS のみ選択可能。GRS / GZRS は利用できない。高可用性と Premium 性能を両立するには ZRS を選択する。
      </div>

      <h3>暗号化オプション</h3>
      <p>Azure Storage に保存されるデータはすべて自動的に暗号化される（保存時の暗号化、SSE）。暗号化キーの管理方法には以下の3種類がある。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>方式</th><th>キーの管理者</th><th>説明</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Microsoft マネージドキー</strong></td><td>Microsoft</td><td>既定で有効。ユーザーの管理不要</td></tr>
            <tr><td><strong>カスタマーマネージドキー（CMK）</strong></td><td>ユーザー</td><td>Azure Key Vault に格納したキーを使用。キーのローテーションも管理可能</td></tr>
            <tr><td><strong>カスタマー指定のキー</strong></td><td>ユーザー</td><td>Blob 操作ごとにリクエストヘッダーでキーを指定。きめ細かい制御が可能</td></tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="blob-storage">2.3 Azure Blob Storage</h2>

      <h3>Blob の種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>最大サイズ</th><th>特徴</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ブロック Blob</strong></td><td>約 190 TB</td><td>ブロック単位でアップロード。最も汎用的</td><td>ファイル、画像、動画など大半のシナリオ</td></tr>
            <tr><td><strong>ページ Blob</strong></td><td>8 TB</td><td>ランダムアクセスに最適化。512バイトページ単位</td><td>VHD（仮想ハードディスク）</td></tr>
            <tr><td><strong>追加 Blob</strong></td><td>約 195 GB</td><td>末尾への追加に特化。既存ブロックの変更不可</td><td>ログファイル、監査データ</td></tr>
          </tbody>
        </table>
      </div>

      <h3>アクセス層</h3>
      <p>Blob のアクセス頻度に応じてコストを最適化するための層。ストレージコストとアクセスコストはトレードオフの関係にある。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>アクセス層</th><th>ストレージコスト</th><th>アクセスコスト</th><th>最低保持期間</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ホット</strong></td><td>高</td><td>低</td><td>なし</td><td>頻繁にアクセスされるデータ向け</td></tr>
            <tr><td><strong>クール</strong></td><td>やや低</td><td>やや高</td><td>30日</td><td>30日以上保持する、アクセス頻度の低いデータ</td></tr>
            <tr><td><strong>コールド</strong></td><td>低</td><td>高</td><td>90日</td><td>90日以上保持する、ほぼアクセスしないデータ</td></tr>
            <tr><td><strong>アーカイブ</strong></td><td>最低</td><td>最高</td><td>180日</td><td>オフライン。読み取りにはリハイドレート（数時間）が必要</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 既定のアクセス層</div>
        ストレージアカウントの既定のアクセス層として設定できるのは<strong>ホット</strong>または<strong>クール</strong>のみ。コールドとアーカイブは個別の Blob レベルでのみ設定可能で、アカウントの既定値にはできない。
      </div>

      <h3>ライフサイクル管理ポリシー</h3>
      <p>時間の経過に応じて Blob のアクセス層を自動的に変更したり、削除したりするルールを定義できる機能。</p>
      <ul>
        <li>対象はブロック Blob のみ（ページ Blob や追加 Blob は対象外）</li>
        <li>対応するアカウント種類は Standard 汎用 v2 および Premium ブロック Blob</li>
        <li>例：「作成から30日後にクール層へ移動」「90日後にアーカイブ層へ移動」「365日後に削除」</li>
      </ul>

      <h3>Blob の保護機能</h3>
      <p>誤操作やランサムウェアなどからデータを保護するための複数の機能が用意されている。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>機能</th><th>説明</th><th>備考</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>論理的な削除</strong></td><td>削除された Blob を指定期間（既定7日）保持し、復元可能にする</td><td>コンテナーレベル / Blob レベルで設定</td></tr>
            <tr><td><strong>バージョン管理</strong></td><td>Blob の更新時に自動でバージョンを作成・保持</td><td>過去バージョンへの復元が可能</td></tr>
            <tr><td><strong>変更フィード</strong></td><td>Blob の作成・変更・削除イベントのトランザクションログを提供</td><td>監査や変更追跡に利用</td></tr>
            <tr><td><strong>ポイントインタイムリストア</strong></td><td>Blob データを過去の特定時点の状態に復元</td><td>ブロック Blob のみ対応。論理的な削除・バージョン管理・変更フィードの有効化が前提</td></tr>
          </tbody>
        </table>
      </div>

      <h3>リソースロック</h3>
      <p>Azure リソースに対するロックを設定し、誤った変更や削除を防止する機能。ストレージアカウントやリソースグループに適用できる。</p>
      <ul>
        <li><strong>削除ロック（CanNotDelete）</strong>：リソースの削除を防止。変更は可能</li>
        <li><strong>読み取り専用ロック（ReadOnly）</strong>：リソースの変更と削除の両方を防止</li>
      </ul>

      <h3>不変ストレージ（WORM）ポリシー</h3>
      <p>保存したデータを変更・削除できないようにする機能。コンプライアンスや規制要件（金融、医療など）への対応に利用される。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>ポリシー種類</th><th>説明</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>時間ベースの保持ポリシー</strong></td><td>指定した期間（最大400年）データの変更・削除を禁止</td><td>ロック後は期間の短縮不可。延長のみ可能</td></tr>
            <tr><td><strong>訴訟ホールド（Legal Hold）</strong></td><td>ホールドが解除されるまでデータの変更・削除を禁止</td><td>保持期間の指定なし。法的調査等で利用</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「規制要件でデータを一定期間変更不可にする」→ 時間ベースの保持ポリシー</li>
          <li>「法的調査でデータを保全する」→ 訴訟ホールド</li>
          <li>不変ストレージはコンテナーレベルで設定する</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-storage">判断フロー：ストレージの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>非構造化データ（画像、動画、バックアップ）→ <strong>Blob Storage</strong></li>
          <li>ファイル共有（SMB/NFS）が必要 → <strong>Azure Files</strong>（高性能 → Premium ファイル共有、エンタープライズ → <strong>NetApp Files</strong>）</li>
          <li>VM のディスク → <strong>Managed Disks</strong>（ページ Blob ベース）</li>
          <li>メッセージキュー → <strong>Queue Storage</strong></li>
          <li>低コストな NoSQL テーブル → <strong>Table Storage</strong>（高機能 → Cosmos DB for Table）</li>
          <li>Premium 性能 + Blob → <strong>Premium ブロック Blob</strong> アカウント</li>
          <li>大半のシナリオ → <strong>Standard 汎用 v2</strong></li>
          <li>アクセス頻度が低い → <strong>クール / コールド / アーカイブ</strong>層を活用</li>
          <li>データの改変防止（コンプライアンス）→ <strong>不変ストレージポリシー</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-account-overview" target="_blank">MS Learn: Azure Storage アカウントの概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/storage-blobs-overview" target="_blank">MS Learn: Azure Blob Storage の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-redundancy" target="_blank">MS Learn: Azure Storage の冗長性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/access-tiers-overview" target="_blank">MS Learn: Blob のアクセス層</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/lifecycle-management-overview" target="_blank">MS Learn: ライフサイクル管理</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/immutable-storage-overview" target="_blank">MS Learn: 不変ストレージ</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();