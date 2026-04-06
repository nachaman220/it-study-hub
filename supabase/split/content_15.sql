INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.1', 4, 1, 'コンピューティング', 'compute', '<h1>4.1 コンピューティングソリューション</h1>

      <!-- ==================== VM ==================== -->
      <h2 id="virtual-machines">Azure Virtual Machines（VM）</h2>
      <p>Azure VM は IaaS として提供される仮想マシンサービスで、基盤は Hyper-V ハイパーバイザー上で動作する。OS やミドルウェアの構成を自由に制御でき、オンプレミスのワークロードをそのまま移行（リフトアンドシフト）する場合に適している。</p>

      <h3>VM サイズの命名規則</h3>
      <p>VM のサイズ名は <strong>ファミリ</strong>、<strong>サブファミリ</strong>、<strong>vCPU 数</strong>、<strong>追加機能</strong>、<strong>アクセラレータ種別</strong>、<strong>バージョン</strong> の組み合わせで構成される。例えば <code>Standard_D8as_v5</code> のように表現される。</p>

      <h3>VM ファミリ一覧</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>種別</th>
              <th>ファミリ</th>
              <th>用途</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>汎用</strong></td>
              <td>B, D</td>
              <td>テスト・開発、中小規模の業務アプリ。バランスの取れた CPU/メモリ比</td>
            </tr>
            <tr>
              <td><strong>コンピューティング最適化</strong></td>
              <td>F</td>
              <td>高い CPU 対メモリ比。バッチ処理、アプリサーバー向け</td>
            </tr>
            <tr>
              <td><strong>メモリ最適化</strong></td>
              <td>E, M</td>
              <td>大容量メモリ。インメモリ DB、大規模キャッシュ向け</td>
            </tr>
            <tr>
              <td><strong>ストレージ最適化</strong></td>
              <td>L</td>
              <td>高いディスク I/O。大規模データベース、ビッグデータ向け</td>
            </tr>
            <tr>
              <td><strong>GPU</strong></td>
              <td>N</td>
              <td>GPU 搭載。機械学習、グラフィック処理向け</td>
            </tr>
            <tr>
              <td><strong>ハイパフォーマンス</strong></td>
              <td>H</td>
              <td>最速の CPU。HPC（流体力学シミュレーション等）向け</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>バースト対応 B シリーズ</h3>
      <p>B シリーズは CPU クレジットに基づくバースト型の VM。通常時はベースラインの CPU 使用率で動作し、使用しなかった分をクレジットとして蓄積する。負荷が高まった際にはクレジットを消費してベースラインを超えるバースト性能を発揮できる。開発・テスト環境や断続的な負荷のワークロードに最適。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「コストを最小限にしたい」「CPU 使用率が低い時間帯が多い」→ <strong>B シリーズ</strong>。常時高負荷のワークロードには不向き。
      </div>

      <!-- ==================== ディスク ==================== -->
      <h3>マネージドディスクの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ディスク種類</th>
              <th>特徴</th>
              <th>主な用途</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Standard HDD</strong></td>
              <td>最もコストが低い。低 IOPS</td>
              <td>バックアップ、開発/テスト</td>
            </tr>
            <tr>
              <td><strong>Standard SSD</strong></td>
              <td>HDD より高い一貫性と信頼性</td>
              <td>Web サーバー、軽量の業務アプリ</td>
            </tr>
            <tr>
              <td><strong>Premium SSD</strong></td>
              <td>高 IOPS、低レイテンシ</td>
              <td>本番ワークロード、DB サーバー</td>
            </tr>
            <tr>
              <td><strong>Premium SSD v2</strong></td>
              <td>IOPS/スループット/容量を個別にスケーリング可能</td>
              <td>高い柔軟性が必要な本番 DB</td>
            </tr>
            <tr>
              <td><strong>Ultra Disk</strong></td>
              <td>最高レベルの IOPS とスループット</td>
              <td>SAP HANA、大規模トランザクション DB</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== ホストキャッシュ ==================== -->
      <h3>ホストキャッシュ設定</h3>
      <p>VM のディスクにはホストキャッシュを設定でき、ワークロードに応じて最適なモードを選択する。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>キャッシュモード</th>
              <th>推奨用途</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>なし</strong></td>
              <td>トランザクションログ</td>
              <td>書き込みが頻繁で読み取りが少ないデータ向け</td>
            </tr>
            <tr>
              <td><strong>読み取り専用</strong></td>
              <td>DB データファイル</td>
              <td>読み取りが多いワークロード向け。キャッシュヒットで読み取り性能向上</td>
            </tr>
            <tr>
              <td><strong>読み取り/書き込み</strong></td>
              <td>OS ディスク</td>
              <td>OS ディスクの既定値。読み書き両方をキャッシュ</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        DB のトランザクションログディスク → キャッシュ<strong>なし</strong>、DB のデータファイルディスク → <strong>読み取り専用</strong>、OS ディスク → <strong>読み取り/書き込み</strong>。この組み合わせは頻出。
      </div>

      <!-- ==================== Azure Bastion ==================== -->
      <h3>Azure Bastion</h3>
      <p>Azure Bastion は、Azure ポータルから TLS（ポート 443）経由で VM に安全に RDP/SSH 接続するためのマネージドサービス。VM にパブリック IP アドレスを割り当てる必要がなく、インターネットに直接公開せずにリモートアクセスが可能となる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「VM にパブリック IP を付けたくない」「安全にリモート管理したい」→ <strong>Azure Bastion</strong>。TLS 443 のみで接続でき、NSG で RDP/SSH ポートを開放する必要がない。
      </div>

      <!-- ==================== App Service ==================== -->
      <h2 id="app-service">Azure App Service</h2>
      <p>App Service は Web アプリケーション、REST API、モバイルバックエンドをホストするための PaaS サービス。OS やインフラの管理が不要で、自動スケーリングや CI/CD 統合などが組み込まれている。</p>

      <h3>App Service プラン</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>プラン</th>
              <th>スケーリング</th>
              <th>主な特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Free</strong></td>
              <td>なし</td>
              <td>テスト・学習用。共有インフラ</td>
            </tr>
            <tr>
              <td><strong>Shared</strong></td>
              <td>なし</td>
              <td>カスタムドメイン対応。共有インフラ</td>
            </tr>
            <tr>
              <td><strong>Basic</strong></td>
              <td>手動</td>
              <td>専用インスタンス。最大 3 インスタンス</td>
            </tr>
            <tr>
              <td><strong>Standard</strong></td>
              <td>自動</td>
              <td>デプロイスロット対応。最大 10 インスタンス</td>
            </tr>
            <tr>
              <td><strong>Premium</strong></td>
              <td>自動</td>
              <td>高性能、より多くのインスタンス、VNet 統合</td>
            </tr>
            <tr>
              <td><strong>Isolated（ASE）</strong></td>
              <td>自動</td>
              <td>App Service Environment。完全に分離されたネットワーク。専用の VNet 内で動作</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>デプロイスロット</h3>
      <p>デプロイスロットを使うと、ステージング環境と本番環境をスワップ操作で瞬時に切り替えられる。ダウンタイムなしのデプロイや、問題発生時の即時ロールバックが可能。<strong>Standard プラン以上</strong>で利用できる。</p>

      <h3>サービスコネクタ</h3>
      <p>サービスコネクタは、App Service からバックエンドサービス（DB、Storage、Key Vault など）への接続を簡単に構成する機能。接続文字列や認証情報の設定を自動化する。<strong>全プラン</strong>で利用可能。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>デプロイスロット → <strong>Standard 以上</strong>のプランが必要</li>
          <li>完全なネットワーク分離 → <strong>Isolated（ASE）</strong></li>
          <li>「PaaS で Web アプリをホストしたい」→ まず App Service を検討</li>
        </ul>
      </div>

      <!-- ==================== コンテナー ==================== -->
      <h2 id="containers">コンテナーサービス</h2>

      <h3>VM とコンテナーの違い</h3>
      <p>VM はハイパーバイザー上でゲスト OS ごと仮想化するのに対し、コンテナーはホスト OS のカーネルを共有し、アプリケーションとその依存関係のみをパッケージングする。コンテナーは VM より軽量で起動が速く、リソース効率が高い。</p>

      <h3>Azure Container Instances（ACI）</h3>
      <p>最もシンプルなコンテナー実行環境。クラスターの管理やオーケストレーションが不要で、単一コンテナーやシンプルなコンテナーグループを素早く起動できる。開発・テスト、バッチジョブ、短期間のタスクに最適。</p>

      <h3>Azure Kubernetes Service（AKS）</h3>
      <p>Kubernetes ベースのマネージドコンテナーオーケストレーションサービス。コントロールプレーン（マスターノード）は Azure が管理し、ワーカーノードのみ課金対象となる。</p>
      <ul>
        <li><strong>Pod</strong> — Kubernetes の最小デプロイ単位。1 つ以上のコンテナーを含む</li>
        <li><strong>水平 Pod オートスケーラー（HPA）</strong> — Pod のレプリカ数を CPU/メモリ使用率に基づいて自動調整</li>
        <li><strong>垂直 Pod オートスケーラー（VPA）</strong> — Pod に割り当てる CPU/メモリのリソース要求を自動調整</li>
        <li><strong>KEDA（Kubernetes Event-Driven Autoscaling）</strong> — イベントソース（Queue メッセージ数等）に基づくスケーリング。0 から N へのスケーリングが可能</li>
        <li><strong>クラスターオートスケーラー</strong> — ノード（VM）の数を自動的にスケーリング</li>
        <li><strong>仮想ノード</strong> — ACI と連携して、追加の VM を用意せずに Pod をバーストさせる仕組み。<strong>Linux コンテナーのみ</strong>対応</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>AKS の仮想ノードは <strong>Linux のみ</strong>対応（Windows コンテナー不可）</li>
          <li>KEDA は「キューにメッセージがないときは 0 にスケールイン」のシナリオで登場</li>
          <li>シンプルなコンテナー実行 → ACI、本格的なオーケストレーション → AKS</li>
        </ul>
      </div>

      <h3>Service Fabric</h3>
      <p>マイクロサービスプラットフォーム。Azure だけでなくオンプレミスにもインストール可能。ステートフルサービスを直接サポートし、Azure 自身の基盤としても利用されている。</p>

      <h3>Azure Container Registry（ACR）</h3>
      <p>プライベートな Docker コンテナーイメージのレジストリサービス。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>SKU</th>
              <th>主な特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Basic</strong></td>
              <td>開発者向けの低コストオプション</td>
            </tr>
            <tr>
              <td><strong>Standard</strong></td>
              <td>本番ワークロード向け。ストレージ拡大</td>
            </tr>
            <tr>
              <td><strong>Premium</strong></td>
              <td>Geo レプリケーション対応。複数リージョンにイメージを複製可能</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        ACR の Geo レプリケーション → <strong>Premium SKU</strong> が必要。複数リージョンにコンテナーをデプロイする際のイメージ配布の高速化に有効。
      </div>

      <!-- ==================== サーバーレス ==================== -->
      <h2 id="azure-functions">サーバーレス：Azure Functions</h2>
      <p>Azure Functions はイベント駆動型のサーバーレスコンピューティングサービス。コードの実行にのみ課金され、インフラ管理が不要。</p>

      <h3>対応言語</h3>
      <p>C#、Java、JavaScript、PowerShell、Python、TypeScript</p>

      <h3>トリガーの種類</h3>
      <ul>
        <li><strong>スケジュール（Timer）</strong> — CRON 式で定期実行</li>
        <li><strong>HTTP</strong> — HTTP リクエストで起動（REST API の構築）</li>
        <li><strong>Storage</strong> — Blob/Queue の変更で起動</li>
        <li><strong>Event Grid</strong> — Event Grid イベントで起動</li>
      </ul>

      <h3>料金プラン</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>プラン</th>
              <th>スケーリング</th>
              <th>特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>従量課金（Consumption）</strong></td>
              <td>自動（0 までスケールイン）</td>
              <td>実行ごとの課金。コールドスタートあり</td>
            </tr>
            <tr>
              <td><strong>専用（App Service プラン）</strong></td>
              <td>手動/自動</td>
              <td>既存の App Service プランを利用。常時稼働可能</td>
            </tr>
            <tr>
              <td><strong>Premium</strong></td>
              <td>自動（常に 1 以上ウォーム）</td>
              <td>VNet 統合対応。コールドスタート回避のため最低 1 インスタンスがウォーム状態で待機（約30分の延長実行も対応）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「VNet 内のリソースにアクセスしたい」→ <strong>Premium プラン</strong></li>
          <li>「コールドスタートを避けたい」→ <strong>Premium プラン</strong>（ウォームインスタンスで待機）</li>
          <li>「コスト最小化」「散発的な実行」→ <strong>従量課金プラン</strong></li>
          <li>「実行時間が長い（30分超）」→ Premium プランの延長実行</li>
        </ul>
      </div>

      <!-- ==================== バッチ ==================== -->
      <h2 id="batch">バッチ処理</h2>

      <h3>Azure Batch</h3>
      <p>大規模な並列コンピューティングや HPC ジョブを実行するためのマネージドサービス。数百から数千の VM を自動的にプロビジョニングし、ジョブをスケジューリングする。</p>
      <ul>
        <li><strong>タスク</strong> — 実行する処理の単位</li>
        <li><strong>ジョブ</strong> — タスクの集合</li>
        <li><strong>プール（ノード）</strong> — タスクを実行する VM の集合</li>
      </ul>

      <h3>ノードの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>種類</th>
              <th>説明</th>
              <th>コスト</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>専用 VM</strong></td>
              <td>確保が保証される。中断されない</td>
              <td>最も高い</td>
            </tr>
            <tr>
              <td><strong>低優先度 VM</strong></td>
              <td>Azure の余剰容量を利用。プリエンプトされる可能性あり</td>
              <td>割引価格</td>
            </tr>
            <tr>
              <td><strong>スポット VM</strong></td>
              <td>Azure の余剰容量を利用。価格に基づいてエビクトされる可能性あり</td>
              <td>最も安い（最大90%割引）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>プール割り当てモード</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>モード</th>
              <th>説明</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Batch サービス</strong></td>
              <td>Batch サービスが管理するサブスクリプション内にプールを作成</td>
              <td>既定のモード。ほとんどのシナリオ</td>
            </tr>
            <tr>
              <td><strong>ユーザーサブスクリプション</strong></td>
              <td>ユーザー自身のサブスクリプション内に VM が作成される</td>
              <td>VNet 統合、カスタムイメージ、特定のサブスクリプションでの管理が必要な場合</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Azure CycleCloud</h3>
      <p>Azure 上で HPC クラスターを作成・管理するツール。Slurm、PBS Pro、Grid Engine などのサードパーティスケジューラーと統合でき、オンプレミスの HPC ワークフローをそのまま Azure に移行できる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「大量の並列処理」「レンダリング」→ <strong>Azure Batch</strong></li>
          <li>「既存のサードパーティスケジューラーを使いたい」→ <strong>CycleCloud</strong></li>
          <li>Batch のスポット VM はコスト削減に有効だが、中断される可能性を許容できるワークロード向け</li>
        </ul>
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-compute">判断フロー：コンピューティングサービスの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>OS やミドルウェアの完全制御が必要 → <strong>Azure VM</strong></li>
          <li>Web アプリを PaaS で素早くデプロイ → <strong>App Service</strong></li>
          <li>シンプルなコンテナー実行（オーケストレーション不要） → <strong>ACI</strong></li>
          <li>複数コンテナーのオーケストレーション → <strong>AKS</strong></li>
          <li>マイクロサービス + オンプレミス対応 → <strong>Service Fabric</strong></li>
          <li>イベント駆動で小さなコード断片を実行 → <strong>Azure Functions</strong></li>
          <li>大規模並列バッチ処理 → <strong>Azure Batch</strong></li>
          <li>HPC + サードパーティスケジューラー → <strong>CycleCloud</strong></li>
          <li>CPU 負荷が断続的でコスト最適化したい → <strong>B シリーズ VM</strong></li>
          <li>VM にパブリック IP を付けずにリモート管理 → <strong>Azure Bastion</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-machines/overview" target="_blank">MS Learn: Azure Virtual Machines の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-machines/sizes/overview" target="_blank">MS Learn: VM サイズ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-machines/managed-disks-overview" target="_blank">MS Learn: マネージドディスク</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/bastion/bastion-overview" target="_blank">MS Learn: Azure Bastion</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/app-service/overview" target="_blank">MS Learn: App Service の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/app-service/deploy-staging-slots" target="_blank">MS Learn: デプロイスロット</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/container-instances/container-instances-overview" target="_blank">MS Learn: Azure Container Instances</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/aks/intro-kubernetes" target="_blank">MS Learn: AKS の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-functions/functions-overview" target="_blank">MS Learn: Azure Functions の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/batch/batch-technical-overview" target="_blank">MS Learn: Azure Batch の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cyclecloud/overview" target="_blank">MS Learn: Azure CycleCloud</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/container-registry/container-registry-intro" target="_blank">MS Learn: Azure Container Registry</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();