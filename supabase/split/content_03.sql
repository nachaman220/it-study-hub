INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.4', 1, 4, '監視ソリューション', 'monitoring', '<h1>1.4 監視ソリューション</h1>

      <!-- ==================== -->
      <h2 id="azure-monitor">Azure Monitor の全体像</h2>
      <p>Azure Monitor は Azure の監視サービスの中核。メトリクスとログの2種類のデータを収集し、分析・可視化・アラート・自動対応を行う。</p>

      <h3>監視データの2つの柱</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>データの種類</th>
              <th>特徴</th>
              <th>例</th>
              <th>保存先</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>メトリクス</strong></td>
              <td>数値データ。軽量でリアルタイム性が高い。時系列データベースに保存</td>
              <td>CPU使用率、メモリ使用量、ディスクIO、リクエスト数</td>
              <td>Azure Monitor メトリクス（自動、最大93日保持）</td>
            </tr>
            <tr>
              <td><strong>ログ</strong></td>
              <td>テキスト/構造化データ。KQLで柔軟にクエリ可能</td>
              <td>アクティビティログ、診断ログ、アプリケーションログ</td>
              <td>Log Analyticsワークスペース</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>メトリクス = 数値、リアルタイム、自動収集</li>
          <li>ログ = テキスト/構造化、KQLで分析、明示的に収集設定が必要な場合が多い</li>
          <li>「リアルタイムでCPU使用率を監視」→ メトリクス。「過去1週間の認証失敗を調査」→ ログ</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="data-sources">データソース</h2>

      <h3>プラットフォームメトリクス / ログ</h3>
      <p>Azure リソースが自動で生成するデータ。追加設定なしでメトリクスは収集される。ログ（診断設定）は明示的に有効化が必要。</p>

      <h3>アクティビティログ</h3>
      <p>サブスクリプションレベルのイベントログ。「誰が」「いつ」「何を」したかを記録する。</p>
      <ul>
        <li>リソースの作成・変更・削除、ロール割り当て等の管理操作</li>
        <li>自動で収集され、90日間保持（それ以上は Log Analytics に送信）</li>
        <li>費用は無料</li>
      </ul>

      <h3>ゲストOS データ</h3>
      <p>VM内部のデータ（OS メトリクス、イベントログ、パフォーマンスカウンター）を収集するには、エージェントが必要。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>エージェント</th>
              <th>状態</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure Monitor Agent（AMA）</strong></td>
              <td>推奨（現行）</td>
              <td>データ収集ルール（DCR）で収集対象を柔軟に定義。レガシーエージェントの後継</td>
            </tr>
            <tr>
              <td>Log Analytics Agent（MMA/OMS）</td>
              <td>非推奨（2024年8月廃止）</td>
              <td>AMAへの移行が必要</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        試験では <strong>Azure Monitor Agent（AMA）</strong> が正解になるケースが増えている。旧エージェント（MMA）は非推奨。AMAはデータ収集ルール（DCR）と組み合わせて使う。
      </div>

      <!-- ==================== -->
      <h2 id="log-analytics">Log Analytics ワークスペース</h2>
      <p>Azure Monitor ログの保存・分析を行うサービス。KQL（Kusto Query Language）でデータを照会する。</p>

      <h3>ワークスペース設計</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>設計パターン</th>
              <th>説明</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>集中型（1つのワークスペース）</strong></td>
              <td>全データを1箇所に集約</td>
              <td>小〜中規模。管理がシンプル。クロスリソースの分析が容易</td>
            </tr>
            <tr>
              <td><strong>分散型（複数ワークスペース）</strong></td>
              <td>リージョン、部門、セキュリティ要件ごとに分割</td>
              <td>データ主権要件（リージョン外にデータを出せない）、アクセス制御の分離</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Microsoft は可能な限り<strong>集中型</strong>を推奨（管理の簡素化、クロスリソースクエリ）</li>
          <li>分散が必要なケース：データ主権、帯域幅コスト、厳密なアクセス分離</li>
          <li>ワークスペース間のクロスクエリも可能（ただしパフォーマンスに影響）</li>
          <li>データ保持期間：既定30日、最大730日（有料で延長）。Analytics プランとBasic ログプランの違いにも注意</li>
        </ul>
      </div>

      <h3>KQL（Kusto Query Language）</h3>
      <p>Log Analytics でログを照会するためのクエリ言語。基本構文を知っておくと試験でも実務でも役立つ。</p>
      <pre style="background:#f0f0f0; padding:16px; border-radius:4px; overflow-x:auto; font-family:monospace; font-size:0.85rem; margin-bottom:16px;">
// 過去24時間のエラーイベントを検索
Event
| where TimeGenerated > ago(24h)
| where EventLevelName == "Error"
| summarize count() by Source
| order by count_ desc</pre>

      <!-- ==================== -->
      <h2 id="app-insights">Application Insights</h2>
      <p>アプリケーションのパフォーマンス監視（APM）サービス。Azure Monitor の一部として提供される。</p>

      <h3>主要な機能</h3>
      <ul>
        <li><strong>リクエスト率・応答時間・失敗率</strong>の自動収集</li>
        <li><strong>依存関係の追跡</strong> — DB呼び出し、HTTP呼び出し等の外部依存関係を自動検出</li>
        <li><strong>例外の追跡</strong> — 未処理例外の自動キャプチャ</li>
        <li><strong>分散トレーシング</strong> — マイクロサービス間のリクエストフローを追跡</li>
        <li><strong>可用性テスト</strong> — 外部からアプリの応答を定期的に確認</li>
        <li><strong>ライブメトリクスストリーム</strong> — リアルタイムでのパフォーマンス監視</li>
      </ul>

      <h3>実装方式</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>方式</th>
              <th>説明</th>
              <th>メリット</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>自動インストルメンテーション</strong></td>
              <td>コード変更なしで有効化（App Service等で利用可能）</td>
              <td>導入が簡単</td>
            </tr>
            <tr>
              <td><strong>SDK（手動インストルメンテーション）</strong></td>
              <td>コードにSDKを組み込む</td>
              <td>カスタムテレメトリの送信、より詳細な制御</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「Webアプリのパフォーマンスを監視したい」「応答時間やエラー率を追跡」→ <strong>Application Insights</strong></li>
          <li>Application Insights のデータは Log Analytics ワークスペースに保存される（ワークスペースベースモード）</li>
          <li>可用性テスト = アプリが外部から到達可能かを定期的にチェック</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="monitor-insights">Azure Monitor Insights</h2>
      <p>Azure Monitor Insights は、特定のリソースやワークロードに特化した統合監視ビューを提供する機能群。事前に構成されたダッシュボードやブックにより、対象の正常性やパフォーマンスを包括的に把握できる。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>Insights</th>
              <th>概要</th>
              <th>主な機能</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>VM Insights</strong></td>
              <td>VM のパフォーマンスと正常性を監視</td>
              <td>CPU/メモリ/ディスクのパフォーマンスマップ、プロセスと依存関係の自動検出</td>
            </tr>
            <tr>
              <td><strong>Network Insights</strong></td>
              <td>Azure ネットワークリソースの正常性を一元的に監視</td>
              <td>ネットワークトポロジの可視化、接続性の監視、メトリクスの集約表示</td>
            </tr>
            <tr>
              <td><strong>Application Insights</strong></td>
              <td>アプリケーションのパフォーマンス監視（APM）</td>
              <td>リクエスト率・応答時間・失敗率の追跡、分散トレーシング、可用性テスト</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="partner-tools">パートナーツールとの連携</h2>
      <p>Azure Monitor のデータは Azure 内のサービスだけでなく、外部の監視・分析ツールにも転送できる。</p>
      <ul>
        <li><strong>Azure Event Hubs</strong> を介して、Splunk、Sumo Logic、Syslog サーバーなどの外部パートナーツールへデータをストリーミング可能</li>
        <li>診断設定で Event Hubs を宛先に指定し、プラットフォームログやメトリクスを外部に転送する構成が一般的</li>
        <li>既存の SIEM（セキュリティ情報イベント管理）や監視基盤を維持しながら Azure の監視データを統合できる</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「既存のSplunk環境にAzureの監視データを送りたい」→ <strong>Azure Event Hubs</strong> 経由で転送する。Log Analytics ワークスペースへの直接転送ではなく、Event Hubs がパートナーツール連携の中継ポイントとなる。
      </div>

      <!-- ==================== -->
      <h2 id="table-plans">テーブルプラン（ログデータプラン）</h2>
      <p>Log Analytics ワークスペースのテーブルごとに、コストと機能のバランスに応じたプランを選択できる。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>項目</th>
              <th>Analytics（分析）プラン</th>
              <th>Basic（基本）プラン</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>機能</strong></td>
              <td>フルKQLクエリ、アラート、Insights、エクスポート等すべて利用可能</td>
              <td>基本的なKQLクエリのみ（一部演算子制限あり）。アラートやエクスポートに制限</td>
            </tr>
            <tr>
              <td><strong>データ取り込みコスト</strong></td>
              <td>高い</td>
              <td>安い（Analytics プランの約1/3程度）</td>
            </tr>
            <tr>
              <td><strong>クエリコスト</strong></td>
              <td>無し（取り込み費用に含まれる）</td>
              <td>クエリ実行時にスキャンしたデータ量に応じて課金</td>
            </tr>
            <tr>
              <td><strong>保持期間</strong></td>
              <td>既定30日、最大730日（有料延長）</td>
              <td>既定30日、最大730日（有料延長）</td>
            </tr>
            <tr>
              <td><strong>適したケース</strong></td>
              <td>頻繁に分析・アラートに使うデータ</td>
              <td>大量に取り込むが分析頻度が低いデータ（デバッグログ等）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Basic プランは取り込みコストを抑えたい場合に有効だが、クエリ時に課金されるため頻繁な分析には不向き</li>
          <li>「コストを最小化しつつ大量のログを保持したい」→ Basic プラン。「アラートやダッシュボードで常時監視」→ Analytics プラン</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="dcr">データ収集ルール（DCR）の詳細</h2>
      <p>データ収集ルール（DCR）は、Azure Monitor Agent が収集するデータの対象・フィルタリング・加工・送信先を JSON ドキュメントで定義する仕組み。</p>

      <h3>DCR の主な機能</h3>
      <ul>
        <li><strong>データのフィルタリング</strong> — XPath 式を使用して、収集するイベントログやパフォーマンスカウンターを絞り込む。不要なデータの取り込みを削減しコストを最適化</li>
        <li><strong>データの変換（加工）</strong> — KQL（Kusto Query Language）を使ってデータを変換してから保存。フィールドの追加・削除・変更が可能</li>
        <li><strong>複数の宛先</strong> — 1つのDCRで複数の Log Analytics ワークスペースへデータを送信可能</li>
      </ul>

      <h3>データ収集エンドポイント（DCE）</h3>
      <p>DCE は、エージェントやアプリケーションが Azure Monitor にデータを送信する際のエンドポイント。リージョンごとに作成が必要となるため、複数リージョンにリソースがある場合は各リージョンに DCE を配置する。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>DCR を使うことで、必要なデータのみを取り込みコストを最適化できる（XPathフィルタリング + KQL変換）</li>
          <li>DCE はリージョン単位で作成が必要。マルチリージョン構成では各リージョンにDCEを配置する設計が求められる</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="diagnostic-settings">診断設定</h2>
      <p>Azure リソースが生成するプラットフォームログ（リソースログ）やメトリクスを、Log Analytics ワークスペース、ストレージアカウント、Event Hubs などの宛先に転送する設定。</p>
      <ul>
        <li>各リソースごとに診断設定を構成する必要がある（Azure Policy の DeployIfNotExists で自動化可能）</li>
        <li>プラットフォームメトリクスは自動収集されるが、ログは診断設定を有効にしないと収集されない</li>
        <li>アクティビティログの既定の保持期間は <strong>90日</strong>。90日を超えて保持したい場合は、診断設定で Log Analytics ワークスペースに転送する</li>
        <li>複数の宛先に同時送信可能（例：Log Analytics + ストレージアカウント）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「アクティビティログを90日以上保持したい」→ 診断設定で Log Analytics ワークスペースに転送。ストレージアカウントへのアーカイブも可能</li>
          <li>診断設定はリソースごとに個別に構成が必要。大規模環境では Azure Policy で自動適用するのがベストプラクティス</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="alerts">アラート</h2>
      <p>監視データが指定した条件に合致した場合に通知やアクションを実行する。</p>

      <h3>アラートの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>種類</th>
              <th>データソース</th>
              <th>ユースケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>メトリクスアラート</strong></td>
              <td>メトリクス</td>
              <td>CPU &gt; 90% が5分間継続</td>
            </tr>
            <tr>
              <td><strong>ログ検索アラート</strong></td>
              <td>Log Analytics のログ（KQL）</td>
              <td>過去1時間にエラーが10件以上発生</td>
            </tr>
            <tr>
              <td><strong>アクティビティログアラート</strong></td>
              <td>アクティビティログ</td>
              <td>特定のリソースが削除された</td>
            </tr>
            <tr>
              <td><strong>Prometheusアラート</strong></td>
              <td>Azure Managed Prometheus</td>
              <td>Kubernetes クラスターの監視</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>アクショングループ</h3>
      <p>アラートが発火した時に実行するアクションの集合。</p>
      <ul>
        <li><strong>通知</strong> — メール、SMS、プッシュ通知、音声通話</li>
        <li><strong>アクション</strong> — Azure Function / Logic App / Webhook / Automation Runbook / ITSM</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>アクショングループは複数のアラートルールで共有できる</li>
          <li>「アラート発火時に自動でVMをスケールアップ」→ Automation Runbook をアクションに設定</li>
          <li>「アラート発火時にチケットを作成」→ ITSM コネクタまたは Logic App</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="visualization">可視化ツール</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ツール</th>
              <th>特徴</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure ダッシュボード</strong></td>
              <td>Azure ポータル上のカスタムダッシュボード。メトリクスやログのタイルを配置</td>
              <td>運用チームの日常監視</td>
            </tr>
            <tr>
              <td><strong>Azure Workbooks</strong></td>
              <td>リッチなインタラクティブレポート。KQLクエリ、メトリクス、パラメータを組み合わせ</td>
              <td>詳細な分析レポート、トラブルシューティング</td>
            </tr>
            <tr>
              <td><strong>Grafana（Azure Managed）</strong></td>
              <td>OSS の可視化ツール。マルチソース対応</td>
              <td>Grafana に慣れたチーム、マルチクラウド監視</td>
            </tr>
            <tr>
              <td><strong>Power BI</strong></td>
              <td>ビジネスインテリジェンスツール。Log Analytics からデータをインポート</td>
              <td>経営層向けレポート、ビジネスデータとの統合</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="cost-management">Microsoft Cost Management</h2>
      <p>Azure リソースのコストを監視・分析・最適化するためのサービス。</p>

      <h3>主要機能</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>機能</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>コスト分析</strong></td>
              <td>リソース、リソースグループ、タグ、サービス別のコストを可視化</td>
            </tr>
            <tr>
              <td><strong>予算</strong></td>
              <td>月額予算を設定し、閾値（50%, 80%, 100%等）でアラートを発行</td>
            </tr>
            <tr>
              <td><strong>コストアラート</strong></td>
              <td>予算超過や異常なコスト増加を通知</td>
            </tr>
            <tr>
              <td><strong>Azure Advisor（コスト推奨）</strong></td>
              <td>未使用リソースの検出、リザーブドインスタンスの推奨、SKUの適正化</td>
            </tr>
            <tr>
              <td><strong>エクスポート</strong></td>
              <td>コストデータをストレージアカウントにエクスポート（定期的な自動エクスポート可）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Cost Management 自体は<strong>無料</strong>で利用可能</li>
          <li>予算アラートはコストを制限するものではない（通知のみ）。自動停止するには Automation と組み合わせる</li>
          <li>タグを使ったコスト配分 → タグでフィルタしてコスト分析。ただしタグの付与を Policy で強制することが前提</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="service-health">Azure Service Health</h2>
      <p>Azure プラットフォーム自体の正常性を監視するサービス。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>レベル</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure の状態</strong></td>
              <td>Azure 全体の大規模な障害情報</td>
            </tr>
            <tr>
              <td><strong>Service Health</strong></td>
              <td>自分が使っているサービス・リージョンに影響する障害・メンテナンス情報</td>
            </tr>
            <tr>
              <td><strong>Resource Health</strong></td>
              <td>個別リソースの正常性（VMが正常に動いているか等）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="network-watcher">Azure Network Watcher</h2>
      <p>ネットワークの監視・診断ツール。</p>
      <ul>
        <li><strong>NSGフローログ</strong> — NSGを通過するトラフィックを記録</li>
        <li><strong>接続モニター</strong> — VM間の接続性を継続的に監視</li>
        <li><strong>IP フロー検証</strong> — 特定のパケットがNSGで許可/拒否されるかをテスト</li>
        <li><strong>次ホップ</strong> — パケットのルーティング経路を確認</li>
        <li><strong>パケットキャプチャ</strong> — VMのネットワークトラフィックをキャプチャ</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「VMに接続できない原因を調査」→ <strong>IP フロー検証</strong>（NSGルールの確認）+ <strong>次ホップ</strong>（ルーティングの確認）</li>
          <li>「トラフィックパターンの分析」→ <strong>NSGフローログ</strong> + <strong>Traffic Analytics</strong></li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-monitoring">判断フロー：監視ツールの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>Azure リソースのメトリクス・ログ収集 → <strong>Azure Monitor</strong></li>
          <li>VM内部のOS情報を収集 → <strong>Azure Monitor Agent + データ収集ルール</strong></li>
          <li>ログの保存・KQLで分析 → <strong>Log Analytics ワークスペース</strong></li>
          <li>Webアプリのパフォーマンス監視 → <strong>Application Insights</strong></li>
          <li>条件に基づく通知・自動対応 → <strong>アラート + アクショングループ</strong></li>
          <li>コストの監視・最適化 → <strong>Cost Management + Azure Advisor</strong></li>
          <li>Azure自体の障害情報 → <strong>Service Health</strong></li>
          <li>ネットワークの診断 → <strong>Network Watcher</strong></li>
          <li>運用ダッシュボード → <strong>Azure ダッシュボード or Workbooks</strong></li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/overview" target="_blank">MS Learn: Azure Monitor の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/agents/azure-monitor-agent-overview" target="_blank">MS Learn: Azure Monitor Agent</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/logs/log-analytics-overview" target="_blank">MS Learn: Log Analytics</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/app/app-insights-overview" target="_blank">MS Learn: Application Insights</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/alerts/alerts-overview" target="_blank">MS Learn: アラート</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cost-management-billing/costs/overview-cost-management" target="_blank">MS Learn: Cost Management</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/service-health/overview" target="_blank">MS Learn: Service Health</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/network-watcher/network-watcher-overview" target="_blank">MS Learn: Network Watcher</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/insights/insights-overview" target="_blank">MS Learn: Azure Monitor Insights</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/essentials/data-collection-rule-overview" target="_blank">MS Learn: データ収集ルール</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/essentials/diagnostic-settings" target="_blank">MS Learn: 診断設定</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();