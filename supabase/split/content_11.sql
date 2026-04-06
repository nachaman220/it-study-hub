INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('3.1', 3, 1, '事業継続性の基礎', 'fundamentals', '<h1>3.1 事業継続性の基礎</h1>

      <p>事業継続性（Business Continuity）とは、障害や災害が発生してもビジネスを継続し、迅速に復旧するための戦略と仕組みを指す。Azure では複数のアプローチを組み合わせて可用性と復旧性を高める。</p>

      <!-- ==================== -->
      <h2 id="bcdr-strategies">3つの基本戦略</h2>

      <h3>冗長化（Redundancy）</h3>
      <p>システムを複数のコンポーネントで構成し、一部が故障しても全体が停止しないようにする考え方。単一障害点（SPOF）をなくすことが目的。</p>
      <ul>
        <li>同じ役割を持つ複数のサーバーやサービスを配置する</li>
        <li>1つのコンポーネントに障害が発生しても、他のコンポーネントが処理を引き継ぐ</li>
        <li>Azure では可用性セット、可用性ゾーン、リージョンペアなどの仕組みで冗長化を実現</li>
      </ul>

      <h3>バックアップ（Backup）</h3>
      <p>データやシステム構成を定期的にコピーし、障害発生時にコピーから復元する手法。</p>
      <ul>
        <li>定期的なスケジュール（毎日、毎週など）でスナップショットを取得</li>
        <li>復元には一定の時間がかかるため、RTO は比較的長くなる</li>
        <li>データの損失量は最後のバックアップからの経過時間に依存する（RPO が長い）</li>
        <li>長期保存が可能（Azure Backup は最長99年）</li>
      </ul>

      <h3>レプリケーション（Replication）</h3>
      <p>稼働中のシステム（プライマリ）からリアルタイムまたはほぼリアルタイムでデータを別のシステム（セカンダリ）にコピーし続ける手法。</p>
      <ul>
        <li>プライマリに障害が発生した場合、セカンダリに切り替える（フェールオーバー）</li>
        <li>データの損失が少なく、復旧が高速（RTO/RPO が短い）</li>
        <li>Azure Site Recovery やストレージの GRS/GZRS などで実現</li>
      </ul>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>バックアップ</th>
              <th>レプリケーション</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>データコピーのタイミング</td>
              <td>定期的（スケジュール）</td>
              <td>継続的（リアルタイム/ほぼリアルタイム）</td>
            </tr>
            <tr>
              <td>RPO（データ損失量）</td>
              <td>長い（時間～日単位）</td>
              <td>短い（秒～分単位）</td>
            </tr>
            <tr>
              <td>RTO（復旧時間）</td>
              <td>長い（復元処理が必要）</td>
              <td>短い（フェールオーバーのみ）</td>
            </tr>
            <tr>
              <td>コスト</td>
              <td>比較的低い</td>
              <td>比較的高い</td>
            </tr>
            <tr>
              <td>長期保存</td>
              <td>適している</td>
              <td>不向き（直近のデータのみ）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「データの長期保存」「コスト最小化」ならバックアップ、「ダウンタイム最小化」「データ損失最小化」ならレプリケーション。多くの場合、両方を組み合わせて使用する。
      </div>

      <!-- ==================== -->
      <h1 style="margin-top:48px;">3.2 RPO / RTO / RLO</h1>

      <p>事業継続計画を策定する際の重要な指標。これらの値を定義し、適切なソリューションを選択することが設計の基本となる。</p>

      <!-- ==================== -->
      <h2 id="rpo">RPO（Recovery Point Objective：目標復旧時点）</h2>
      <p>障害発生時に許容できるデータ損失量を時間で表した指標。「どの時点のデータまで失ってもよいか」を定義する。</p>
      <ul>
        <li>RPO = 0 は「データ損失ゼロ」を意味し、同期レプリケーションが必要</li>
        <li>RPO = 4時間の場合、最大4時間分のデータが失われることを許容する</li>
        <li>RPO が短いほど、より高頻度のバックアップやリアルタイムレプリケーションが必要になり、コストが増大する</li>
      </ul>

      <div class="info-box note">
        <div class="info-box-title">RPO の考え方</div>
        RPO は「最後のバックアップ/レプリケーションポイントから障害発生までの経過時間」に相当する。バックアップの場合は取得間隔がそのまま RPO の上限になる。
      </div>

      <!-- ==================== -->
      <h2 id="rto">RTO（Recovery Time Objective：目標復旧時間）</h2>
      <p>障害発生から業務が復旧するまでに許容できる最大時間。「どれだけの時間でシステムを復旧させるか」を定義する。</p>
      <ul>
        <li>RTO が短いほど、より高速な復旧手段（レプリケーション、自動フェールオーバーなど）が必要</li>
        <li>バックアップからの復元は RTO が長くなりがち（データ量や復元手順に依存）</li>
        <li>レプリケーション + 自動フェールオーバーは RTO を大幅に短縮できる</li>
      </ul>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>復旧手段</th>
              <th>RPO の目安</th>
              <th>RTO の目安</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>バックアップ（Standard ティア）</td>
              <td>最大 24 時間</td>
              <td>規模に依存（数時間～）</td>
            </tr>
            <tr>
              <td>バックアップ（Enhanced ティア）</td>
              <td>最大 4 時間</td>
              <td>規模に依存（数時間～）</td>
            </tr>
            <tr>
              <td>レプリケーション（Azure Site Recovery）</td>
              <td>5 分（クラッシュ整合性）</td>
              <td>2 時間以内</td>
            </tr>
            <tr>
              <td>同期レプリケーション（可用性ゾーン）</td>
              <td>ほぼ 0</td>
              <td>自動（数秒～数分）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="rlo">RLO（Recovery Level Objective：目標復旧レベル）</h2>
      <p>復旧時にどの程度のサービスレベルで運用を再開するかを段階的に定義する指標。RTO の中で段階的な復旧を計画する際に使用する。</p>
      <ul>
        <li><strong>段階1：</strong>最低限のサービス（コアビジネス機能のみ）を復旧</li>
        <li><strong>段階2：</strong>主要サービスの大部分を復旧（制限付き運用）</li>
        <li><strong>段階3：</strong>全サービスを通常レベルで復旧（完全復旧）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>RPO</strong>: データをどれだけ失えるか（時間で測定）</li>
          <li><strong>RTO</strong>: どれだけ早く復旧するか（時間で測定）</li>
          <li><strong>RLO</strong>: どのレベルまで復旧するか（段階で定義）</li>
          <li>RPO/RTO を短くするほどコストは高くなる。要件に応じて最適なソリューションを選択することが重要</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-bcdr">判断フロー：事業継続戦略の選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>データ損失ゼロ（RPO=0）を求められる → <strong>同期レプリケーション</strong>（可用性ゾーン、Premium/BC ティア）</li>
          <li>ダウンタイム最小化（RTO 数分）を求められる → <strong>自動フェールオーバー + レプリケーション</strong></li>
          <li>RTO 2時間以内が要件 → <strong>Azure Site Recovery</strong></li>
          <li>RPO 4時間で十分 → <strong>Azure Backup（Enhanced ティア）</strong></li>
          <li>RPO 24時間で十分 → <strong>Azure Backup（Standard ティア）</strong></li>
          <li>長期保存（年単位）が必要 → <strong>Azure Backup + LTR ポリシー</strong></li>
          <li>コスト最小化 → <strong>バックアップのみ</strong>（レプリケーション不要ならコスト削減）</li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/reliability/overview" target="_blank">MS Learn: Azure の信頼性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/well-architected/reliability/metrics" target="_blank">MS Learn: 信頼性のメトリック（RPO/RTO）</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/backup/backup-overview" target="_blank">MS Learn: Azure Backup の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/site-recovery/site-recovery-overview" target="_blank">MS Learn: Azure Site Recovery の概要</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();