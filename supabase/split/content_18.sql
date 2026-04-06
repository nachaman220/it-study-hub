INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.4', 4, 4, '移行', 'migration', '<h1>4.3-4.5 移行ソリューション</h1>

      <!-- ==================== 4.3 データ移行 ==================== -->
      <h2 id="data-migration">4.3 データ移行</h2>

      <h3>Azure Migrate</h3>
      <p>オンプレミス環境から Azure への移行を包括的に支援するサービス。移行の計画、評価（アセスメント）、実行の各フェーズをカバーする。</p>
      <ul>
        <li><strong>計画</strong> — 依存関係の可視化、コスト見積もり</li>
        <li><strong>評価</strong> — 移行対象サーバーの Azure 適合性を分析。推奨 VM サイズやコストを算出</li>
        <li><strong>移行</strong> — Hyper-V および VMware の VM をレプリケーション → カットオーバーで移行</li>
      </ul>

      <h3>AzCopy</h3>
      <p>Azure Storage との間でデータをコピーするためのコマンドラインツール。大量のファイルの転送やスクリプトでの自動化に適している。</p>
      <ul>
        <li>認証方式：<strong>Microsoft Entra ID</strong> または <strong>SAS トークン</strong></li>
        <li>Blob Storage、Azure Files、Table Storage 間のコピーに対応</li>
      </ul>

      <h3>Azure Data Share</h3>
      <p>組織間でデータを安全に共有するサービス。データプロバイダーがスナップショット共有を設定し、コンシューマーが自身のストレージアカウントにデータを受け取る。定期的なスナップショットスケジュールも設定可能。</p>

      <h3>Azure Import/Export サービス</h3>
      <p><strong>自分が用意したディスクドライブ</strong>（HDD/SSD）にデータをコピーし、Azure データセンターに物理的に送付（宅配）して、Blob Storage や Azure Files にインポートするサービス。エクスポートにも対応。</p>

      <h3>Azure Data Box ファミリー</h3>
      <p><strong>Microsoft がデバイスをレンタル</strong>し、大量のデータを物理的に Azure に転送するサービス。ネットワーク帯域幅が限られている場合や、テラバイト～ペタバイト単位のデータ移行に有効。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>デバイス</th>
              <th>容量</th>
              <th>ユースケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Data Box Disk</strong></td>
              <td>最大 40 TB（SSD x 5）</td>
              <td>中程度のデータ量</td>
            </tr>
            <tr>
              <td><strong>Data Box</strong></td>
              <td>最大 100 TB</td>
              <td>大量データ移行の標準オプション</td>
            </tr>
            <tr>
              <td><strong>Data Box Heavy</strong></td>
              <td>最大 1 PB</td>
              <td>ペタバイト級の超大量データ</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>Import/Export</strong> → 自分のディスクを用意して送付</li>
          <li><strong>Data Box</strong> → Microsoft からデバイスをレンタル</li>
          <li>この違いは頻出。「自分のディスク」なら Import/Export、「レンタルデバイス」なら Data Box</li>
        </ul>
      </div>

      <!-- ==================== 4.4 DB 移行 ==================== -->
      <h2 id="db-migration">4.4 データベース移行</h2>

      <h3>Azure Data Studio（SQL 移行拡張機能）</h3>
      <p>Azure Data Studio に SQL 移行拡張機能をインストールすることで、SQL Server の移行アセスメントと移行を実行できる。移行先として Azure SQL Database、SQL Managed Instance、SQL Server on VM を評価・選択するワークフローを提供する。</p>

      <h3>Azure Database Migration Service（DMS）</h3>
      <p>データベースを Azure に移行するためのフルマネージドサービス。</p>
      <ul>
        <li><strong>オフライン移行</strong> — ソース DB を停止してデータを一括移行。ダウンタイムが発生する</li>
        <li><strong>オンライン移行</strong> — データの継続的同期を行い、最小限のダウンタイムでカットオーバー</li>
      </ul>

      <h3>Data Migration Assistant（DMA）</h3>
      <p>SQL Server に特化したアセスメントツール。移行先の Azure SQL サービスとの互換性の問題や、パフォーマンスに影響する変更点を事前に検出する。スタンドアロンのツールとしてローカルで実行する。</p>

      <h3>SQL Server Migration Assistant（SSMA）</h3>
      <p>SQL Server 以外のデータベースから SQL Server / Azure SQL への移行を支援するツール。以下の 5 種類のソース DB に対応：</p>
      <ul>
        <li>Oracle</li>
        <li>MySQL</li>
        <li>SAP ASE（旧 Sybase）</li>
        <li>DB2</li>
        <li>Microsoft Access</li>
      </ul>

      <h3>DB 移行ツール比較</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ツール</th>
              <th>用途</th>
              <th>特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure Data Studio + SQL 移行拡張</strong></td>
              <td>SQL Server のアセスメント・移行</td>
              <td>GUI ベースのワークフロー。DMS と統合</td>
            </tr>
            <tr>
              <td><strong>DMS</strong></td>
              <td>DB の Azure 移行実行</td>
              <td>オフライン/オンライン移行対応。マネージドサービス</td>
            </tr>
            <tr>
              <td><strong>DMA</strong></td>
              <td>SQL Server 互換性評価</td>
              <td>移行前のアセスメント特化。ローカル実行</td>
            </tr>
            <tr>
              <td><strong>SSMA</strong></td>
              <td>異種 DB → SQL Server 移行</td>
              <td>Oracle/MySQL/SAP ASE/DB2/Access の 5 種類に対応</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>リフトアンドシフト</strong>（既存の VM をそのまま移行）→ Azure Migrate で VM ごと移行し、SQL Server on VM で稼働</li>
          <li><strong>移行</strong>（PaaS への最適化）→ DMS で Azure SQL Database や SQL Managed Instance に移行</li>
          <li>「Oracle から SQL Server に移行したい」→ <strong>SSMA</strong></li>
          <li>「ダウンタイムを最小化して DB を移行したい」→ DMS の<strong>オンライン移行</strong></li>
        </ul>
      </div>

      <h3>Cosmos DB Desktop Data Migration Tool</h3>
      <p>各種データソース（JSON ファイル、MongoDB、SQL Server など）から Azure Cosmos DB にデータを移行するためのオープンソースツール。拡張機能ベースのアーキテクチャで、ソース/シンクのプラグインを追加できる。</p>

      <!-- ==================== 4.5 リソース移行 ==================== -->
      <h2 id="resource-migration">4.5 リソース移行</h2>

      <h3>Azure Resource Mover</h3>
      <p>Azure リソースをリージョン間で移動するためのサービス。VM、VNet、NSG、可用性セットなどのリソースを別リージョンに移動できる。依存関係の自動解決や移動前の検証機能を備えている。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「既存の Azure リソースを別リージョンに移動したい」→ <strong>Azure Resource Mover</strong>。リソースグループ間の移動（同一リージョン内）とは異なり、リージョン間の移動に特化している点に注意。
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-migration">判断フロー：移行ツールの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>オンプレ VM（Hyper-V/VMware）を Azure VM に移行 → <strong>Azure Migrate</strong></li>
          <li>Storage アカウントへのデータコピー（CLI） → <strong>AzCopy</strong></li>
          <li>組織間でのデータ共有 → <strong>Azure Data Share</strong></li>
          <li>大量データ移行（自分のディスクで送付） → <strong>Import/Export</strong></li>
          <li>大量データ移行（デバイスをレンタル） → <strong>Data Box</strong></li>
          <li>SQL Server の互換性評価 → <strong>DMA</strong></li>
          <li>DB の Azure 移行（オフライン/オンライン） → <strong>DMS</strong></li>
          <li>異種 DB から SQL Server へ移行 → <strong>SSMA</strong></li>
          <li>各種データソースから Cosmos DB へ移行 → <strong>Cosmos DB Desktop Data Migration Tool</strong></li>
          <li>Azure リソースのリージョン間移動 → <strong>Azure Resource Mover</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/migrate/migrate-services-overview" target="_blank">MS Learn: Azure Migrate の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-use-azcopy-v10" target="_blank">MS Learn: AzCopy</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/data-share/overview" target="_blank">MS Learn: Azure Data Share</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/import-export/storage-import-export-service" target="_blank">MS Learn: Import/Export サービス</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/databox/data-box-overview" target="_blank">MS Learn: Azure Data Box</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/dms/dms-overview" target="_blank">MS Learn: Database Migration Service</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/sql/dma/dma-overview" target="_blank">MS Learn: Data Migration Assistant</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/sql/ssma/sql-server-migration-assistant" target="_blank">MS Learn: SQL Server Migration Assistant</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/how-to-migrate-desktop-tool" target="_blank">MS Learn: Cosmos DB Desktop Data Migration Tool</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/resource-mover/overview" target="_blank">MS Learn: Azure Resource Mover</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure-data-studio/extensions/azure-sql-migration-extension" target="_blank">MS Learn: Azure Data Studio SQL 移行拡張機能</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();