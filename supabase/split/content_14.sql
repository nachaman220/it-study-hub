INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('3.4', 3, 4, 'DBの継続性', 'db-continuity', '<h1>3.5 Azure SQL Database の事業継続性</h1>

      <!-- ==================== -->
      <h2 id="sql-service-levels">サービスレベル（購入モデル）</h2>
      <p>SQL Database は 2つの購入モデルを提供し、それぞれ複数のサービスレベルがある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>購入モデル</th>
              <th>サービスレベル</th>
              <th>特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td rowspan="3"><strong>DTU モデル</strong></td>
              <td>Basic</td>
              <td>小規模ワークロード向け。低コスト</td>
            </tr>
            <tr>
              <td>Standard</td>
              <td>一般的なワークロード向け</td>
            </tr>
            <tr>
              <td>Premium</td>
              <td>高性能・高可用性。インメモリ OLTP 対応</td>
            </tr>
            <tr>
              <td rowspan="3"><strong>vCore モデル</strong></td>
              <td>General Purpose（GP）</td>
              <td>一般的なワークロード向け。コスト効率が良い</td>
            </tr>
            <tr>
              <td>Business Critical（BC）</td>
              <td>高性能・高可用性。インメモリ OLTP 対応</td>
            </tr>
            <tr>
              <td>Hyperscale</td>
              <td>最大100TB。高いスケーラビリティ</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="sql-ha-architecture">サービスレベル別のアーキテクチャ</h2>

      <h3>Basic / Standard / General Purpose</h3>
      <ul>
        <li>コンピューティング（SQL Server プロセス）とストレージ（データファイル）が <strong>分離</strong> されている</li>
        <li>データファイルは Azure Blob Storage に格納される</li>
        <li>フェールオーバー時はコンピューティングノードの切り替えが行われ、<strong>ダウンタイムが発生</strong> する</li>
        <li>ストレージは共有されているため、新しいノードがデータにアクセスして復旧する</li>
      </ul>

      <h3>Premium / Business Critical</h3>
      <ul>
        <li><strong>クラスター構成</strong>：プライマリレプリカ + 3つのセカンダリレプリカで構成</li>
        <li>セカンダリレプリカへの <strong>同期コピー</strong> によりデータ損失なしでフェールオーバーが可能</li>
        <li><strong>可用性ゾーン</strong> に対応（ゾーン冗長構成を選択可能）</li>
        <li>セカンダリレプリカの1つを <strong>読み取り専用</strong> エンドポイントとして利用可能</li>
        <li>フェールオーバー時のダウンタイムが短い</li>
      </ul>

      <h3>Hyperscale</h3>
      <ul>
        <li>最大 <strong>100TB</strong> のデータベースサイズに対応</li>
        <li>コンピューティング、ページサーバー、ログサービスが <strong>分離</strong> されたアーキテクチャ</li>
        <li>ページサーバーがデータページのキャッシュと提供を担当し、スケールアウト可能</li>
        <li>ログサービスがトランザクションログを管理し、ページサーバーに変更を配信</li>
        <li>高速なバックアップと復元（ストレージスナップショットベース）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「データ損失なし」「高可用性」→ <strong>Premium / Business Critical</strong>（同期レプリケーション）</li>
          <li>「100TB 超の大規模 DB」→ <strong>Hyperscale</strong></li>
          <li>「コスト最小化」→ <strong>Basic / Standard / General Purpose</strong></li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="sql-backup">SQL Database のバックアップ</h2>
      <p>SQL Database では自動バックアップが組み込まれており、追加の構成なしでバックアップが取得される。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>バックアップの種類</th>
              <th>頻度</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>完全バックアップ</strong></td>
              <td>週1回</td>
              <td>データベース全体のバックアップ</td>
            </tr>
            <tr>
              <td><strong>差分バックアップ</strong></td>
              <td>12～24時間ごと</td>
              <td>前回の完全バックアップからの差分</td>
            </tr>
            <tr>
              <td><strong>トランザクションログバックアップ</strong></td>
              <td>約10分ごと</td>
              <td>トランザクションログの増分バックアップ</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>バックアップの保持期間</h3>
      <ul>
        <li><strong>短期保持（PITR）：</strong>7～35日。この期間内の任意の時点にデータベースを復元可能</li>
        <li><strong>長期保持（LTR）：</strong>最大 <strong>10年</strong>。コンプライアンスや監査要件に対応</li>
      </ul>

      <!-- ==================== -->
      <h2 id="geo-replication">アクティブ geo レプリケーション</h2>
      <p>プライマリデータベースのデータを別リージョンの読み取り可能なセカンダリデータベースに非同期でレプリケーションする機能。</p>
      <ul>
        <li><strong>複数のセカンダリレプリカ</strong> を作成可能（最大4つ）</li>
        <li>手動でフェールオーバーを実行する（自動フェールオーバーは非対応）</li>
        <li>セカンダリは読み取り専用クエリに使用できる（レポーティング負荷の分散）</li>
        <li><strong>注意：</strong>SQL Managed Instance（MI）ではアクティブ geo レプリケーションは使用不可</li>
      </ul>

      <!-- ==================== -->
      <h2 id="failover-groups">自動フェールオーバーグループ</h2>
      <p>プライマリサーバー/MI のデータベースをセカンダリリージョンにレプリケーションし、障害時に自動でフェールオーバーする機能。</p>
      <ul>
        <li>フェールオーバーは <strong>自動</strong>（手動でも可能）</li>
        <li>セカンダリレプリカは <strong>1つのみ</strong>（アクティブ geo レプリケーションとの違い）</li>
        <li>リスナーエンドポイントにより、アプリケーションの接続文字列を変更せずにフェールオーバーが可能</li>
        <li>SQL Database と SQL Managed Instance の両方で利用可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「自動フェールオーバー」→ <strong>フェールオーバーグループ</strong></li>
          <li>「複数レプリカ」「手動フェールオーバー」→ <strong>アクティブ geo レプリケーション</strong></li>
          <li>「SQL Managed Instance の DR」→ <strong>フェールオーバーグループ</strong>（geo レプリケーションは MI 非対応）</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h1 style="margin-top:48px;">3.6 Azure Database for MySQL の事業継続性</h1>

      <h2 id="mysql-service-levels">サービスレベル</h2>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>サービスレベル</th>
              <th>特徴</th>
              <th>用途</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Burstable</strong></td>
              <td>低コスト、バースト対応の CPU 性能</td>
              <td>開発/テスト、アクセス頻度の低いワークロード</td>
            </tr>
            <tr>
              <td><strong>General Purpose（GP）</strong></td>
              <td>バランスの取れた CPU とメモリ</td>
              <td>一般的な本番ワークロード</td>
            </tr>
            <tr>
              <td><strong>Business Critical（BC）</strong></td>
              <td>高い CPU 性能とメモリ</td>
              <td>高スループット・低レイテンシが求められるワークロード</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Azure Database for MySQL は <strong>フレキシブルサーバー</strong> デプロイモデルが推奨されている。単一サーバーモデルは廃止が進んでいるため、試験ではフレキシブルサーバーを前提に考える。
      </div>

      <!-- ==================== -->
      <h2 id="mysql-ha">高可用性</h2>
      <p>フレキシブルサーバーでは、スタンバイサーバーを構成して高可用性を実現する。2つのモードがある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>モード</th>
              <th>説明</th>
              <th>フェールオーバー時間</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>同一ゾーン HA</strong></td>
              <td>同じ可用性ゾーン内にスタンバイサーバーを配置</td>
              <td>短い（同一 DC 内の切り替え）</td>
            </tr>
            <tr>
              <td><strong>ゾーン冗長 HA</strong></td>
              <td>異なる可用性ゾーンにスタンバイサーバーを配置</td>
              <td>やや長い（ゾーン間の切り替え）。DC 障害に対応</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="mysql-backup">MySQL のバックアップ</h2>
      <ul>
        <li><strong>完全バックアップ：</strong>1日1回自動取得</li>
        <li><strong>トランザクションログバックアップ：</strong>5分ごと</li>
        <li><strong>保持期間：</strong>7～35日（既定は7日）</li>
        <li>保持期間内の任意の時点に復元（ポイントインタイムリストア）が可能</li>
      </ul>

      <!-- ==================== -->
      <h2 id="read-replicas">読み取りレプリカ</h2>
      <ul>
        <li><strong>General Purpose</strong> および <strong>Business Critical</strong> レベルで利用可能（Burstable は非対応）</li>
        <li>同一リージョンまたは <strong>別リージョン</strong> にレプリカを作成可能</li>
        <li>非同期レプリケーション（レプリカはわずかに遅延する）</li>
        <li>読み取りワークロードの分散やレポーティングに活用</li>
        <li>レプリカを昇格させて独立したサーバーとして使用可能（DR シナリオ）</li>
      </ul>

      <!-- ==================== -->
      <h1 style="margin-top:48px;">3.7 アプリケーションの事業継続性</h1>

      <h2 id="load-balancers">Azure の 4つのロードバランサー</h2>
      <p>Azure では用途に応じて4種類のロードバランサーを使い分ける。事業継続性の観点では、リージョン内の冗長化とリージョン間の冗長化を理解することが重要。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>サービス</th>
              <th>レイヤー</th>
              <th>対象範囲</th>
              <th>主な特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure Load Balancer</strong></td>
              <td>L4（TCP/UDP）</td>
              <td>1リージョン</td>
              <td>高速・低レイテンシ。非 HTTP トラフィックにも対応。正常性プローブによるバックエンド監視</td>
            </tr>
            <tr>
              <td><strong>Application Gateway</strong></td>
              <td>L7（HTTP/HTTPS）</td>
              <td>1リージョン</td>
              <td>Web アプリ向け。SSL オフロード、URL ベースルーティング、WAF 統合</td>
            </tr>
            <tr>
              <td><strong>Traffic Manager</strong></td>
              <td>DNS ベース</td>
              <td>複数リージョン</td>
              <td>DNS レベルでのトラフィック分散。複数のルーティング方法をサポート</td>
            </tr>
            <tr>
              <td><strong>Azure Front Door</strong></td>
              <td>L7（HTTP/HTTPS）</td>
              <td>複数リージョン</td>
              <td>グローバル L7 ロードバランシング。CDN キャッシュ、WAF、レート制限を統合</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Traffic Manager のルーティング方法</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ルーティング方法</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>優先度</strong></td>
              <td>プライマリのエンドポイントに優先的にルーティング。障害時にセカンダリにフェールオーバー</td>
            </tr>
            <tr>
              <td><strong>重み付け</strong></td>
              <td>各エンドポイントに重みを設定し、比率に基づいてトラフィックを分散</td>
            </tr>
            <tr>
              <td><strong>パフォーマンス</strong></td>
              <td>ユーザーに最も近い（レイテンシが最小の）エンドポイントにルーティング</td>
            </tr>
            <tr>
              <td><strong>地理的</strong></td>
              <td>ユーザーの地理的な場所に基づいてルーティング（データ主権要件に対応）</td>
            </tr>
            <tr>
              <td><strong>複数値</strong></td>
              <td>複数のエンドポイントの IP アドレスを返し、クライアント側で選択</td>
            </tr>
            <tr>
              <td><strong>サブネット</strong></td>
              <td>クライアントの送信元 IP アドレス範囲に基づいてルーティング</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>リージョン内</strong> の負荷分散 → Load Balancer（L4）または Application Gateway（L7/Web）</li>
          <li><strong>リージョン間</strong> の負荷分散 → Traffic Manager（DNS）または Front Door（L7）</li>
          <li><strong>SSL オフロード</strong> が必要 → Application Gateway または Front Door</li>
          <li><strong>WAF</strong> が必要 → Application Gateway（リージョン内）または Front Door（グローバル）</li>
          <li><strong>CDN キャッシュ + WAF + レート制限</strong> → Front Door</li>
          <li><strong>非 HTTP（TCP/UDP）</strong> → Load Balancer</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h1 style="margin-top:48px;">3.8 Azure Key Vault の事業継続性</h1>

      <h2 id="keyvault-replication">キーコンテナーのレプリケーション</h2>
      <p>Azure Key Vault は組み込みの高可用性機能を提供している。</p>
      <ul>
        <li>Key Vault の内容は自動的に <strong>ペアリージョン</strong> にレプリケーションされる</li>
        <li>レプリケーションは Azure が管理し、ユーザーが構成する必要はない</li>
        <li>フェールオーバー中、Key Vault は <strong>読み取り専用モード</strong> になる（キーや秘密の作成・更新・削除は不可）</li>
        <li>フェールオーバーは通常数分以内に完了し、自動的にフェールバックする</li>
      </ul>

      <div class="info-box important">
        <div class="info-box-title">重要</div>
        フェールオーバー中はキーコンテナーの内容を変更できない。読み取り専用であるため、新しいキーの作成やアクセスポリシーの変更はフェールオーバーが完了するまで待つ必要がある。
      </div>

      <!-- ==================== -->
      <h2 id="keyvault-backup">Key Vault オブジェクトのバックアップ</h2>
      <p>個別のキー、シークレット、証明書をバックアップしたい場合は、手動でバックアップを取得する。</p>
      <ul>
        <li>Azure ポータル、CLI、PowerShell でオブジェクト単位のバックアップが可能</li>
        <li>バックアップは暗号化された BLOB として出力される</li>
        <li>復元は <strong>同じ Azure 地域（Geography）内</strong> の Key Vault にのみ可能（異なる地域への復元は不可）</li>
        <li>復元先の Key Vault は同じサブスクリプションでなくてもよいが、同じ地域であることが必須</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Key Vault の自動レプリケーションはペアリージョンに対して行われる（構成不要）</li>
          <li>フェールオーバー中は <strong>読み取り専用</strong>（変更操作は不可）</li>
          <li>オブジェクトのバックアップを手動で取得した場合、<strong>同じ地域内</strong> でのみ復元可能</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-db">判断フロー：DB・アプリ・Key Vault の事業継続性</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>SQL DB でデータ損失なしの HA → <strong>Premium / Business Critical</strong></li>
          <li>SQL DB で 100TB 超 → <strong>Hyperscale</strong></li>
          <li>SQL DB の自動 DR → <strong>フェールオーバーグループ</strong></li>
          <li>SQL DB で複数レプリカ → <strong>アクティブ geo レプリケーション</strong></li>
          <li>SQL MI の DR → <strong>フェールオーバーグループ</strong>（geo レプリケーション非対応）</li>
          <li>MySQL の HA → <strong>フレキシブルサーバー + ゾーン冗長 HA</strong></li>
          <li>リージョン内 L4 負荷分散 → <strong>Load Balancer</strong></li>
          <li>リージョン内 L7 + SSL オフロード → <strong>Application Gateway</strong></li>
          <li>リージョン間 DNS ルーティング → <strong>Traffic Manager</strong></li>
          <li>リージョン間 L7 + CDN + WAF → <strong>Front Door</strong></li>
          <li>Key Vault の DR → <strong>自動レプリケーション</strong>（追加構成不要）</li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/high-availability-sla" target="_blank">MS Learn: SQL Database の高可用性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/automated-backups-overview" target="_blank">MS Learn: SQL Database の自動バックアップ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/active-geo-replication-overview" target="_blank">MS Learn: アクティブ geo レプリケーション</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/failover-group-sql-db" target="_blank">MS Learn: フェールオーバーグループ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/mysql/flexible-server/concepts-high-availability" target="_blank">MS Learn: MySQL フレキシブルサーバーの高可用性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/load-balancer/load-balancer-overview" target="_blank">MS Learn: Azure Load Balancer</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/application-gateway/overview" target="_blank">MS Learn: Application Gateway</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/traffic-manager/traffic-manager-overview" target="_blank">MS Learn: Traffic Manager</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-overview" target="_blank">MS Learn: Azure Front Door</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/key-vault/general/disaster-recovery-guidance" target="_blank">MS Learn: Key Vault の可用性と冗長性</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();