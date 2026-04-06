INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.3', 1, 3, 'ガバナンス', 'governance', '<h1>1.3 ガバナンス・コンプライアンス</h1>

      <!-- ==================== -->
      <h2 id="resource-hierarchy">Azure リソースの階層構造</h2>
      <p>Azure のリソースは以下の階層で管理される。上位で設定したポリシーやRBACは下位に継承される。</p>

      <div class="info-box note">
        <div class="info-box-title">階層構造（上から下へ）</div>
        <ol>
          <li><strong>管理グループ（Management Groups）</strong> — サブスクリプションをまとめる。最大6階層（ルート含む）</li>
          <li><strong>サブスクリプション</strong> — 課金単位。リソースの論理的な境界</li>
          <li><strong>リソースグループ</strong> — リソースのコンテナ。ライフサイクルが同じものをまとめる</li>
          <li><strong>リソース</strong> — VM、Storage等の個別リソース</li>
        </ol>
      </div>

      <!-- ==================== -->
      <h2 id="management-groups">管理グループ</h2>
      <p>複数のサブスクリプションをまとめて管理するためのコンテナ。エンタープライズ環境で組織構造に合わせたポリシー適用に使う。</p>

      <h3>設計のポイント</h3>
      <ul>
        <li>ルート管理グループの下に最大6階層まで作成可能</li>
        <li>1つのサブスクリプションは1つの管理グループにのみ属する</li>
        <li>管理グループに割り当てたRBACやPolicyは全サブスクリプションに継承</li>
        <li>組織構造（事業部別）や環境別（本番/開発/テスト）で分けるのが一般的</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「全サブスクリプションに共通のポリシーを適用したい」→ ルート管理グループまたは上位の管理グループにPolicyを割り当て。
      </div>

      <!-- ==================== -->
      <h2 id="subscription-design">サブスクリプション設計</h2>
      <p>サブスクリプションは課金とアクセス制御の境界。設計パターン：</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>パターン</th>
              <th>説明</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>環境別</strong></td>
              <td>開発/ステージング/本番でサブスクリプションを分離</td>
              <td>環境間の厳密な分離が必要な場合</td>
            </tr>
            <tr>
              <td><strong>事業部別</strong></td>
              <td>部門・チームごとにサブスクリプションを分ける</td>
              <td>コスト配分を明確にしたい場合</td>
            </tr>
            <tr>
              <td><strong>ワークロード別</strong></td>
              <td>アプリやプロジェクト単位で分割</td>
              <td>アプリごとに異なるガバナンスが必要な場合</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>サブスクリプションにはリソース数の上限がある（例：VNet 1000個/サブスクリプション）</li>
          <li>上限に達する場合は追加サブスクリプションが必要</li>
          <li>サブスクリプション間でリソースを移動できるが、すべてのリソースが移動可能ではない</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="azure-policy">Azure Policy</h2>
      <p>Azure リソースの構成を組織のルールに準拠させるためのサービス。リソースの作成・変更時にルールを強制したり、既存リソースのコンプライアンス状態を評価したりする。</p>

      <h3>ポリシー定義 vs イニシアティブ</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>概念</th>
              <th>説明</th>
              <th>例</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>ポリシー定義</strong></td>
              <td>個別のルール1つ</td>
              <td>「東日本リージョン以外へのリソース作成を禁止」</td>
            </tr>
            <tr>
              <td><strong>イニシアティブ（ポリシーセット）</strong></td>
              <td>複数のポリシー定義をグループ化したもの</td>
              <td>「CIS ベンチマーク準拠」（数十のポリシーの束）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>ポリシーの効果（Effect）</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>効果</th>
              <th>動作</th>
              <th>ユースケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Deny</strong></td>
              <td>条件に合致するリソースの作成・変更を拒否</td>
              <td>許可されていないリージョンへのデプロイを阻止</td>
            </tr>
            <tr>
              <td><strong>Audit</strong></td>
              <td>非準拠リソースをログに記録（ブロックはしない）</td>
              <td>まず現状把握したい場合</td>
            </tr>
            <tr>
              <td><strong>Append</strong></td>
              <td>リソースにフィールドを追加</td>
              <td>タグの自動追加</td>
            </tr>
            <tr>
              <td><strong>Modify</strong></td>
              <td>既存リソースのプロパティを変更</td>
              <td>タグの追加・修正</td>
            </tr>
            <tr>
              <td><strong>DeployIfNotExists</strong></td>
              <td>条件に合致するリソースが存在しない場合にデプロイ</td>
              <td>診断設定の自動追加</td>
            </tr>
            <tr>
              <td><strong>AuditIfNotExists</strong></td>
              <td>関連リソースが存在しない場合に監査ログに記録</td>
              <td>バックアップが構成されていないVMの検出</td>
            </tr>
            <tr>
              <td><strong>Disabled</strong></td>
              <td>ポリシーを無効化</td>
              <td>テスト・段階的導入</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>Deny</strong> = 強制的にブロック。<strong>Audit</strong> = 記録するだけ（ブロックしない）</li>
          <li>段階的導入：まず Audit で影響確認 → 問題なければ Deny に変更</li>
          <li><strong>DeployIfNotExists</strong> にはマネージドIDが必要（自動デプロイの実行主体として）</li>
          <li>Policy は既存リソースも評価する（新規作成時だけではない）</li>
        </ul>
      </div>

      <h3>ポリシーの適用手順</h3>
      <p>Azure Policy を使うには、以下の3ステップでルールを定義して適用する。</p>
      <ol>
        <li><strong>ポリシー定義を作成</strong> — JSON形式でルールの条件（if）と効果（then）を記述する</li>
        <li><strong>イニシアティブ定義を作成（オプション）</strong> — 複数のポリシー定義をグループ化して管理しやすくする</li>
        <li><strong>スコープに割り当て</strong> — 管理グループ、サブスクリプション、リソースグループのいずれかのスコープにポリシーまたはイニシアティブを割り当てる</li>
      </ol>

      <h4>ポリシー定義の JSON 例</h4>
      <pre style="background:#f0f0f0; padding:16px; border-radius:4px; overflow-x:auto; font-family:monospace; font-size:0.85rem; margin-bottom:16px;">
{
  "if": {
    "not": {
      "field": "location",
      "in": ["japaneast", "japanwest"]
    }
  },
  "then": {
    "effect": "deny"
  }
}</pre>
      <p>上記の例では、東日本・西日本リージョン以外へのリソース作成を拒否するルールを定義している。</p>

      <h3>ポリシーの評価タイミング</h3>
      <ul>
        <li><strong>リアルタイム評価</strong> — リソースの作成・更新時にポリシーの条件が評価され、非準拠であれば効果（Deny等）が適用される</li>
        <li><strong>定期バックグラウンドスキャン</strong> — 既存リソースに対して約24時間ごとにコンプライアンス評価が実行される</li>
        <li><strong>オンデマンドスキャン</strong> — Azure CLI（<code>az policy state trigger-scan</code>）やPowerShellで手動スキャンを実行可能</li>
      </ul>

      <h3>非準拠リソースへの対応</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>効果</th>
              <th>非準拠時の動作</th>
              <th>備考</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Audit / AuditIfNotExists</strong></td>
              <td>アクティビティログにイベントを記録する。アラートルールと組み合わせて通知を生成可能</td>
              <td>リソースの作成・変更はブロックされない</td>
            </tr>
            <tr>
              <td><strong>DeployIfNotExists / Modify</strong></td>
              <td>修復タスクを使って非準拠リソースを準拠状態に戻す</td>
              <td>修復タスクの実行にはマネージドIDが必要</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>DeployIfNotExists / Modify</strong> 効果では、ポリシー割り当て時にマネージドIDが自動作成される。ポリシー定義内で必要なAzureロール（Contributorなど）を指定すると、そのロールがマネージドIDに付与される</li>
          <li>修復タスクは既存の非準拠リソースにのみ適用される。新規リソースは作成時に自動的にポリシーが適用される</li>
          <li>Audit効果で検出した非準拠リソースに対してアラートを設定し、運用チームに通知する構成が実務では一般的</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="blueprints">Azure Blueprints</h2>

      <div class="info-box important">
        <div class="info-box-title">非推奨化の注意</div>
        Azure Blueprints は 2026年7月にサービス終了予定。後継として、デプロイスタック（Deployment Stacks）やテンプレートスペック + Policy の組み合わせが推奨されている。ただし試験には出題される可能性がある。
      </div>

      <p>環境の構成（RBACロール割り当て、Policy、ARM テンプレート、リソースグループ）を「ブループリント」としてパッケージ化し、サブスクリプションに一括適用する。</p>

      <h3>Policy vs Blueprints</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>Azure Policy</th>
              <th>Azure Blueprints</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>目的</strong></td>
              <td>リソースの構成ルールを強制・監査</td>
              <td>環境全体（RBAC + Policy + リソース）を一括構成</td>
            </tr>
            <tr>
              <td><strong>適用タイミング</strong></td>
              <td>リソースの作成・変更・既存評価</td>
              <td>サブスクリプション作成時の初期セットアップ</td>
            </tr>
            <tr>
              <td><strong>含められるもの</strong></td>
              <td>ポリシールールのみ</td>
              <td>Policy + RBAC + ARM テンプレート + RG</td>
            </tr>
            <tr>
              <td><strong>バージョン管理</strong></td>
              <td>なし</td>
              <td>あり（ブループリントのバージョニング）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="resource-locks">リソースロック</h2>
      <p>リソースの誤操作（削除・変更）を防止するための仕組み。RBACとは独立して動作する。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ロックレベル</th>
              <th>読み取り</th>
              <th>更新</th>
              <th>削除</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>ReadOnly</strong></td>
              <td>可</td>
              <td>不可</td>
              <td>不可</td>
            </tr>
            <tr>
              <td><strong>Delete（CanNotDelete）</strong></td>
              <td>可</td>
              <td>可</td>
              <td>不可</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>ロックは Owner であっても適用される（ロック解除には明示的な操作が必要）</li>
          <li>親スコープのロックは子リソースに継承される</li>
          <li>ReadOnly ロックは予期しない影響が出ることがある（例：ストレージのキー一覧表示がブロックされる）</li>
          <li>「誤削除を防ぎたいが更新はさせたい」→ <strong>Delete ロック</strong></li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="tagging">タグ付け戦略</h2>
      <p>リソースにメタデータ（キー:値ペア）を付与して、コスト管理・運用・ガバナンスに活用する。</p>

      <h3>一般的なタグの例</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>タグキー</th>
              <th>用途</th>
              <th>値の例</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Environment</td>
              <td>環境の識別</td>
              <td>Production, Staging, Development</td>
            </tr>
            <tr>
              <td>CostCenter</td>
              <td>コスト配分</td>
              <td>CC-1234</td>
            </tr>
            <tr>
              <td>Owner</td>
              <td>管理責任者</td>
              <td>team-infra@contoso.com</td>
            </tr>
            <tr>
              <td>Application</td>
              <td>関連アプリの識別</td>
              <td>ecommerce-app</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>タグはリソースグループからリソースに<strong>継承されない</strong>（Azure Policyで強制できる）</li>
          <li>Azure Policy の <strong>Modify</strong> 効果でタグを自動付与できる</li>
          <li>リソースあたりのタグ上限は <strong>50個</strong></li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="purview">Microsoft Purview（コンプライアンス）</h2>
      <p>データガバナンスとコンプライアンスの統合プラットフォーム。</p>
      <ul>
        <li><strong>データマップ</strong> — Azure、オンプレミス、マルチクラウドのデータ資産をスキャンしてカタログ化</li>
        <li><strong>データカタログ</strong> — データの検索・分類・系列の追跡</li>
        <li><strong>コンプライアンスマネージャー</strong> — 規制要件（GDPR、ISO27001等）への準拠状況を評価・スコアリング</li>
        <li><strong>情報保護</strong> — 機密ラベルによるデータの分類と保護</li>
      </ul>

      <!-- ==================== -->
      <h2 id="decision-flow-governance">判断フロー：ガバナンスツールの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>リソースの構成ルールを強制・監査 → <strong>Azure Policy</strong></li>
          <li>新規サブスクリプションの初期セットアップを標準化 → <strong>Blueprints</strong>（またはデプロイスタック）</li>
          <li>リソースの誤削除を防止 → <strong>リソースロック</strong></li>
          <li>コスト配分・運用管理のためのメタデータ → <strong>タグ</strong>（+ Policy で強制）</li>
          <li>複数サブスクリプションの一括管理 → <strong>管理グループ</strong></li>
          <li>データの分類・コンプライアンス評価 → <strong>Microsoft Purview</strong></li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/governance/management-groups/overview" target="_blank">MS Learn: 管理グループ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/governance/policy/overview" target="_blank">MS Learn: Azure Policy</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/governance/blueprints/overview" target="_blank">MS Learn: Azure Blueprints</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/management/lock-resources" target="_blank">MS Learn: リソースロック</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/management/tag-resources" target="_blank">MS Learn: タグ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/purview/purview" target="_blank">MS Learn: Microsoft Purview</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();