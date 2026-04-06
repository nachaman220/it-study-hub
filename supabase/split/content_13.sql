INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('3.3', 3, 3, 'Storageの継続性', 'storage-continuity', '<h1>3.4 ストレージの事業継続性</h1>

      <!-- ==================== -->
      <h2 id="storage-redundancy">ストレージの冗長性オプション</h2>
      <p>Azure Storage はデータの冗長性を確保するために4つのレプリケーション方式を提供している。要件（耐障害レベル、コスト、パフォーマンス）に応じて選択する。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>冗長性</th>
              <th>複製数</th>
              <th>範囲</th>
              <th>耐障害レベル</th>
              <th>コスト</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>LRS（ローカル冗長ストレージ）</strong></td>
              <td>3重</td>
              <td>単一データセンター内</td>
              <td>ノード（ディスク/サーバー）障害</td>
              <td>最安</td>
            </tr>
            <tr>
              <td><strong>ZRS（ゾーン冗長ストレージ）</strong></td>
              <td>3重</td>
              <td>同一リージョン内の3つの可用性ゾーン</td>
              <td>データセンター障害</td>
              <td>LRS より高い</td>
            </tr>
            <tr>
              <td><strong>GRS（geo 冗長ストレージ）</strong></td>
              <td>6重</td>
              <td>プライマリリージョン（LRS） + ペアリージョン（LRS）</td>
              <td>リージョン障害</td>
              <td>ZRS より高い</td>
            </tr>
            <tr>
              <td><strong>GZRS（geo ゾーン冗長ストレージ）</strong></td>
              <td>6重</td>
              <td>プライマリリージョン（ZRS） + ペアリージョン（LRS）</td>
              <td>リージョン障害（最高の可用性）</td>
              <td>最も高い</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>GRS / GZRS の補足</h3>
      <ul>
        <li>ペアリージョンは <strong>150マイル（約240km）以上</strong> 離れた場所に設定されている</li>
        <li>セカンダリリージョンへのレプリケーションは非同期（RPO は通常15分以内）</li>
        <li>既定ではセカンダリリージョンのデータは読み取り不可。<strong>RA-GRS / RA-GZRS</strong> を選択するとセカンダリからの読み取りが可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>LRS</strong>: ディスク/サーバー障害に対応（データセンター障害には対応不可）</li>
          <li><strong>ZRS</strong>: データセンター障害に対応（リージョン障害には対応不可）</li>
          <li><strong>GRS / GZRS</strong>: リージョン障害に対応（最も高い耐障害性）</li>
          <li>「コスト最小」→ LRS、「DC 障害対策」→ ZRS、「リージョン障害対策」→ GRS/GZRS</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="storage-failover">カスタマーマネージド フェールオーバー</h2>
      <p>GRS または GZRS 構成のストレージアカウントで、ユーザーが手動でセカンダリリージョンへのフェールオーバーを実行できる機能。</p>

      <h3>フェールオーバーの動作</h3>
      <ul>
        <li>フェールオーバーは <strong>手動</strong> で開始する（自動フェールオーバーは提供されていない）</li>
        <li>フェールオーバーが完了すると、セカンダリリージョンが新しいプライマリとなる</li>
        <li>フェールオーバー後、ストレージアカウントは <strong>LRS</strong> に降格する（ペアリージョンへのレプリケーションが解除される）</li>
        <li>再度 GRS / GZRS の冗長性を得るには、手動で GRS / GZRS に再構成する必要がある</li>
      </ul>

      <div class="info-box important">
        <div class="info-box-title">重要</div>
        フェールオーバー時にデータ損失が発生する可能性がある。セカンダリリージョンへのレプリケーションは非同期であるため、最後の同期以降のデータは失われる。「最終同期時刻」プロパティでデータ損失のリスクを事前に確認できる。
      </div>

      <!-- ==================== -->
      <h2 id="object-replication">オブジェクトレプリケーション</h2>
      <p>Blob ストレージのオブジェクトを、異なるストレージアカウントやリージョン間で非同期にレプリケーションする機能。</p>

      <ul>
        <li><strong>Blob 単位</strong> で細かくレプリケーションルールを定義できる</li>
        <li><strong>クロスアカウント</strong>：異なるストレージアカウント間でレプリケーション可能</li>
        <li><strong>クロスリージョン</strong>：異なるリージョンのストレージアカウント間でレプリケーション可能</li>
        <li>ソースとターゲットの両方でバージョン管理と変更フィードが有効である必要がある</li>
        <li>フィルタールールにより、特定のプレフィックスの Blob だけをレプリケーション対象にできる</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        オブジェクトレプリケーションはストレージアカウントの冗長性（GRS/GZRS）とは別の仕組み。特定の Blob コンテナーだけを選択的にレプリケーションしたい場合に使用する。
      </div>

      <!-- ==================== -->
      <h2 id="storage-backup">ストレージアカウントのバックアップ</h2>
      <p>Azure Backup を使用して、ストレージアカウント内のデータをバックアップできる。</p>

      <h3>Azure Blob のバックアップ</h3>
      <ul>
        <li>運用バックアップ（Operational Backup）として継続的にバックアップを取得</li>
        <li>特定の時点への復元（ポイントインタイムリストア）が可能</li>
        <li>Blob のバージョン管理、論理的な削除、変更フィードが前提となる</li>
      </ul>

      <h3>Azure Files のバックアップ</h3>
      <ul>
        <li>Azure ファイル共有のスナップショットベースのバックアップ</li>
        <li>Recovery Services コンテナーを使用して管理</li>
        <li>共有レベルまたはファイルレベルでの復元が可能</li>
      </ul>

      <!-- ==================== -->
      <h2 id="file-sync">Azure File Sync</h2>
      <p>オンプレミスの Windows Server ファイルサーバーと Azure Files を双方向に同期するサービス。ブランチオフィスのファイルサーバーをクラウドに集約する場合に活用する。</p>

      <h3>構成要素</h3>
      <ul>
        <li><strong>ストレージ同期サービス：</strong>Azure 側の管理リソース。同期グループを定義する</li>
        <li><strong>同期グループ：</strong>Azure ファイル共有（クラウドエンドポイント）とサーバーエンドポイントの組み合わせ</li>
        <li><strong>Azure File Sync エージェント：</strong>オンプレミスの Windows Server にインストールするエージェント（必須）</li>
      </ul>

      <h3>クラウド階層化</h3>
      <ul>
        <li>アクセス頻度の低いファイルを Azure Files にオフロードし、ローカルにはスタブ（ポインター）のみ残す</li>
        <li>ローカルサーバーのディスク容量を節約しつつ、すべてのファイルにアクセスできる</li>
        <li>ファイルにアクセスすると自動的にクラウドからダウンロードされる</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Azure File Sync はオンプレミスの <strong>Windows Server</strong> が対象（Linux は非対応）</li>
          <li>エージェントのインストールが必須</li>
          <li>「オンプレミスのファイルサーバーをクラウドに同期」「ブランチオフィスのファイル集約」→ Azure File Sync</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-storage-cont">判断フロー：ストレージの事業継続性ソリューション選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>ディスク/サーバー障害のみ対策 + コスト最小 → <strong>LRS</strong></li>
          <li>データセンター障害に対策 → <strong>ZRS</strong></li>
          <li>リージョン障害に対策（単一 DC 保護） → <strong>GRS</strong></li>
          <li>リージョン障害に対策（最高の可用性） → <strong>GZRS</strong></li>
          <li>セカンダリリージョンから読み取りも必要 → <strong>RA-GRS / RA-GZRS</strong></li>
          <li>特定の Blob だけ別リージョン/アカウントにコピー → <strong>オブジェクトレプリケーション</strong></li>
          <li>Blob / Files のバックアップ → <strong>Azure Backup</strong></li>
          <li>オンプレ Windows Server とクラウドの同期 → <strong>Azure File Sync</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-redundancy" target="_blank">MS Learn: Azure Storage の冗長性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-disaster-recovery-guidance" target="_blank">MS Learn: ストレージアカウントのフェールオーバー</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/object-replication-overview" target="_blank">MS Learn: Blob のオブジェクトレプリケーション</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/backup/blob-backup-overview" target="_blank">MS Learn: Azure Blob のバックアップ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/file-sync/file-sync-introduction" target="_blank">MS Learn: Azure File Sync の概要</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();