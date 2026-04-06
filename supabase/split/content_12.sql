INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('3.2', 3, 2, 'VMの継続性', 'vm-continuity', '<h1>3.3 仮想マシンの事業継続性</h1>

      <!-- ==================== -->
      <h2 id="availability-zones">可用性ゾーン（Availability Zones）</h2>
      <p>Azure リージョン内に物理的に分離された複数のデータセンター群。ゾーンごとに独立した電源、冷却、ネットワークを備えており、あるゾーンに障害が発生しても他のゾーンは影響を受けない。</p>
      <ul>
        <li>1つのリージョンに通常3つの可用性ゾーンが存在する</li>
        <li>VM を異なるゾーンに配置することで、データセンター単位の障害に耐えられる</li>
        <li>異なるゾーン = 異なるデータセンターに配置されることが保証される</li>
        <li>ゾーン冗長の SLA は 99.99%（単一 VM の SLA 99.9% より高い）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        可用性セット（同一 DC 内のラック分離）と可用性ゾーン（異なる DC への分離）の違いを明確に区別すること。可用性ゾーンのほうが高い耐障害性を提供する。
      </div>

      <!-- ==================== -->
      <h2 id="vmss">Virtual Machine Scale Sets（VMSS）</h2>
      <p>同一構成の VM を自動的にスケールアウト/スケールインできるサービス。事業継続性の観点では、以下の機能が重要。</p>

      <h3>正常性監視と自動修復</h3>
      <ul>
        <li><strong>正常性プローブ：</strong>各 VM インスタンスの正常性を定期的にチェック</li>
        <li><strong>自動修復（Automatic Repairs）：</strong>正常性プローブで異常と判定された VM を自動的に削除し、新しいインスタンスを作成する</li>
        <li>猶予期間を設定して、一時的な異常による不要な再作成を防止できる</li>
      </ul>

      <h3>複数ゾーン対応</h3>
      <ul>
        <li>VMSS は複数の可用性ゾーンにまたがってインスタンスを分散配置できる</li>
        <li>ゾーン障害時でも他のゾーンのインスタンスが処理を継続</li>
        <li>Azure Load Balancer や Application Gateway と組み合わせてトラフィックを分散</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        VMSS の自動修復機能は、正常性プローブの構成が前提。正常性拡張機能（Application Health Extension）またはロードバランサーの正常性プローブを使用する。
      </div>

      <!-- ==================== -->
      <h2 id="azure-backup">Azure Backup（VM のバックアップ）</h2>
      <p>VM のディスク全体を定期的にスナップショットとして取得し、障害やデータ破損時に復元できるサービス。</p>

      <h3>基本的な特徴</h3>
      <ul>
        <li>1日1回以上のバックアップが可能</li>
        <li>最長 <strong>99年</strong> のデータ保持が可能</li>
        <li>アプリケーション整合性のあるスナップショットを取得（VSS 連携）</li>
        <li>増分バックアップによりストレージコストと転送量を削減</li>
      </ul>

      <h3>構成手順（3ステップ）</h3>
      <ol>
        <li><strong>Recovery Services コンテナーの作成：</strong>バックアップデータを格納するリソース。バックアップ対象と同じリージョンに作成する</li>
        <li><strong>バックアップポリシーの構成：</strong>バックアップの頻度（スケジュール）、保持期間、ティアを定義する</li>
        <li><strong>Resource Guard の構成（推奨）：</strong>バックアップの削除や設定変更を保護し、不正な操作を防止する</li>
      </ol>

      <h3>バックアップティア</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ティア</th>
              <th>バックアップ頻度</th>
              <th>特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Standard</strong></td>
              <td>1日1回</td>
              <td>基本的なバックアップ要件に対応。コスト効率が良い</td>
            </tr>
            <tr>
              <td><strong>Enhanced</strong></td>
              <td>4時間ごと</td>
              <td>より短い RPO が必要な場合に選択。マルチディスク整合性もサポート</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Standard ティアは RPO 最大24時間、Enhanced ティアは RPO 最大4時間。「RPO を短くしたい」→ Enhanced を選択する。
      </div>

      <h3>Resource Guard</h3>
      <p>Azure Backup の重要な操作（バックアップの削除、ポリシーの変更、論理的な削除の無効化など）に対して、追加の承認を要求する仕組み。</p>
      <ul>
        <li>Resource Guard は別のサブスクリプションまたはテナントに配置することが推奨される</li>
        <li>保護された操作を実行するには、Resource Guard に対するアクセス権を持つセキュリティ管理者が許可するまで操作が禁止される</li>
        <li>ランサムウェア攻撃などによるバックアップの不正削除を防止する目的で使用</li>
      </ul>

      <!-- ==================== -->
      <h2 id="backup-restore">Azure Backup からの復元</h2>
      <p>バックアップから VM を復元する方法は複数あり、要件に応じて選択する。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>復元オプション</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>ディスクの置換</strong></td>
              <td>既存 VM のディスクをバックアップ時点のディスクに置き換える</td>
            </tr>
            <tr>
              <td><strong>新規 VM の作成</strong></td>
              <td>復元ポイントから新しい VM を作成する</td>
            </tr>
            <tr>
              <td><strong>ペアリージョンへの復元</strong></td>
              <td>GRS 構成の場合、ペアリージョンにデータを復元できる（リージョン障害対策）</td>
            </tr>
            <tr>
              <td><strong>別サブスクリプションへの復元</strong></td>
              <td>異なるサブスクリプションに VM を復元する（環境分離や移行に対応）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box note">
        <div class="info-box-title">復元時間の目安</div>
        VM の復元には最大 <strong>24時間</strong> かかる場合がある。これはデータ量、ネットワーク帯域、ストレージの種類に依存する。RTO が厳しい場合は Azure Site Recovery の併用を検討すること。
      </div>

      <!-- ==================== -->
      <h2 id="site-recovery">Azure Site Recovery（ASR）</h2>
      <p>VM をリージョン間でレプリケーションし、障害発生時にフェールオーバーで迅速に復旧するサービス。ディザスターリカバリ（DR）の中核となるサービス。</p>

      <h3>基本的な特徴</h3>
      <ul>
        <li>プライマリリージョンの VM をセカンダリリージョンに継続的にレプリケーション</li>
        <li>復旧ポイントの保持期間は最長 <strong>15日</strong></li>
        <li>テストフェールオーバーにより、本番環境に影響を与えずに DR 訓練が可能</li>
        <li>復旧計画（Recovery Plan）で複数 VM のフェールオーバー順序を定義</li>
      </ul>

      <h3>レプリケーション方法</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>整合性タイプ</th>
              <th>レプリケーション頻度</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>クラッシュ整合性</strong></td>
              <td>5分ごと</td>
              <td>ディスク上のデータをそのまま複製。電源断と同等の復旧ポイント。OS 起動は可能だがアプリの整合性は保証されない</td>
            </tr>
            <tr>
              <td><strong>アプリケーション整合性</strong></td>
              <td>1～12時間ごと</td>
              <td>VSS（Windows）やスクリプト（Linux）を使い、アプリケーションの状態を整合性のある形で複製。データベース等のトランザクション整合性を確保</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>構成手順</h3>
      <ol>
        <li><strong>Recovery Services コンテナーの作成：</strong>ターゲットリージョン（フェールオーバー先）に作成する</li>
        <li><strong>レプリケーションの構成：</strong>ソース VM を選択し、ターゲットリージョン、ネットワーク設定、レプリケーションポリシー（整合性の頻度）を設定する</li>
      </ol>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Azure Site Recovery はオンプレミス環境、AWS、GCP 上の物理サーバーや仮想マシンもサポートしている。Azure VM に限らず、ハイブリッド/マルチクラウド環境の DR ソリューションとして活用できる。
      </div>

      <!-- ==================== -->
      <h2 id="backup-vs-asr">Azure Backup と Azure Site Recovery の比較</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>Azure Backup</th>
              <th>Azure Site Recovery</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>基本機能</td>
              <td>データの定期バックアップと復元</td>
              <td>リージョン間のレプリケーションとフェールオーバー</td>
            </tr>
            <tr>
              <td>最大復旧ポイント保持</td>
              <td>最長 99年</td>
              <td>最長 15日</td>
            </tr>
            <tr>
              <td>最短 RTO</td>
              <td>規模に依存（数時間～最大24時間）</td>
              <td>2時間以内</td>
            </tr>
            <tr>
              <td>最短 RPO（Standard / Enhanced）</td>
              <td>24時間 / 4時間</td>
              <td>5分（クラッシュ整合性）/ 1時間（アプリ整合性）</td>
            </tr>
            <tr>
              <td>主な用途</td>
              <td>データ保護・長期保存・コンプライアンス</td>
              <td>ディザスターリカバリ・事業継続</td>
            </tr>
            <tr>
              <td>コスト</td>
              <td>比較的低い</td>
              <td>比較的高い（継続レプリケーション費用）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「RPO を最小にしたい」→ <strong>Azure Site Recovery</strong>（クラッシュ整合性で5分）</li>
          <li>「長期間データを保持したい」→ <strong>Azure Backup</strong>（最長99年）</li>
          <li>「RTO 2時間以内」→ <strong>Azure Site Recovery</strong></li>
          <li>多くのシナリオでは Backup と Site Recovery を併用する</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-vm">判断フロー：VM の事業継続性ソリューション選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>データセンター障害への耐性が必要 → <strong>可用性ゾーン</strong>に VM を分散配置</li>
          <li>自動スケーリングと自動修復が必要 → <strong>VMSS</strong>（複数ゾーン構成）</li>
          <li>RTO 2時間以内 / RPO 5分以内 → <strong>Azure Site Recovery</strong></li>
          <li>RPO 4時間で十分 / 長期保存が必要 → <strong>Azure Backup（Enhanced）</strong></li>
          <li>RPO 24時間で十分 / コスト最小化 → <strong>Azure Backup（Standard）</strong></li>
          <li>バックアップの不正削除を防止 → <strong>Resource Guard</strong> を構成</li>
          <li>オンプレ / AWS / GCP の DR → <strong>Azure Site Recovery</strong>（マルチプラットフォーム対応）</li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/reliability/availability-zones-overview" target="_blank">MS Learn: Azure 可用性ゾーンとは</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-machine-scale-sets/overview" target="_blank">MS Learn: Virtual Machine Scale Sets の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/backup/backup-azure-vms-introduction" target="_blank">MS Learn: Azure VM のバックアップ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/backup/backup-azure-enhanced-policy" target="_blank">MS Learn: Enhanced バックアップポリシー</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/backup/multi-user-authorization-concept" target="_blank">MS Learn: Resource Guard によるマルチユーザー承認</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/site-recovery/site-recovery-overview" target="_blank">MS Learn: Azure Site Recovery の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/site-recovery/azure-to-azure-tutorial-enable-replication" target="_blank">MS Learn: Azure VM のレプリケーション</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();