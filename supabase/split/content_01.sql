INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.2', 1, 2, '認可ソリューション', 'rbac', '<h1>1.2 認可ソリューション</h1>

      <!-- ==================== -->
      <h2 id="rbac">Azure RBAC（ロールベースアクセス制御）</h2>
      <p>Azure リソースに対する「誰が」「何を」「どこで」できるかを制御する仕組み。Azure Resource Manager 上に構築されている。</p>

      <h3>RBACの3要素</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>要素</th>
              <th>説明</th>
              <th>例</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>セキュリティプリンシパル</strong></td>
              <td>アクセスを要求する主体</td>
              <td>ユーザー、グループ、サービスプリンシパル、マネージドID</td>
            </tr>
            <tr>
              <td><strong>ロール定義</strong></td>
              <td>許可される操作の集合</td>
              <td>Owner, Contributor, Reader, カスタムロール</td>
            </tr>
            <tr>
              <td><strong>スコープ</strong></td>
              <td>アクセスが適用される範囲</td>
              <td>管理グループ &gt; サブスクリプション &gt; リソースグループ &gt; リソース</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box note">
        <div class="info-box-title">スコープの継承</div>
        上位スコープで割り当てたロールは下位に継承される。例：サブスクリプションレベルで Reader を割り当てると、そのサブスクリプション内の全リソースグループ・全リソースに対して読み取り権限が付与される。
      </div>

      <h3>主要な組み込みロール</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ロール</th>
              <th>権限</th>
              <th>注意点</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Owner</strong></td>
              <td>全操作 + 他ユーザーへのロール割り当て</td>
              <td>最も強い権限。最小特権の原則に基づき慎重に付与</td>
            </tr>
            <tr>
              <td><strong>Contributor</strong></td>
              <td>全操作（ロール割り当て以外）</td>
              <td>リソースの作成・削除は可能だがアクセス管理はできない</td>
            </tr>
            <tr>
              <td><strong>Reader</strong></td>
              <td>読み取りのみ</td>
              <td>リソースの表示はできるが変更はできない</td>
            </tr>
            <tr>
              <td><strong>User Access Administrator</strong></td>
              <td>ロール割り当ての管理のみ</td>
              <td>リソース自体の操作はできない</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>Owner vs Contributor</strong> の違い = ロール割り当て権限の有無。これは頻出</li>
          <li>「リソースを作成できるがアクセス管理はさせたくない」→ Contributor</li>
          <li>「ロール割り当てだけ管理させたい」→ User Access Administrator</li>
        </ul>
      </div>

      <h3>カスタムロール</h3>
      <p>組み込みロールで要件を満たせない場合に、独自のロールを定義できる。</p>
      <ul>
        <li>JSON形式で Actions / NotActions / DataActions / NotDataActions を指定</li>
        <li>AssignableScopes でロールを割り当て可能なスコープを制限</li>
        <li>Entra ID Premium P1 以上が必要（カスタムロールの数に上限あり）</li>
      </ul>

      <!-- ==================== -->
      <h2 id="entra-roles">Azure RBAC と Microsoft Entra ロールの違い</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>Azure RBAC ロール</th>
              <th>Microsoft Entra ロール</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>管理対象</strong></td>
              <td>Azure リソース（VM, Storage, VNet等）</td>
              <td>Entra ID ディレクトリ（ユーザー、グループ、アプリ等）</td>
            </tr>
            <tr>
              <td><strong>スコープ</strong></td>
              <td>管理グループ / サブスクリプション / RG / リソース</td>
              <td>テナント全体（または管理単位で制限）</td>
            </tr>
            <tr>
              <td><strong>代表的なロール</strong></td>
              <td>Owner, Contributor, Reader</td>
              <td>Global Administrator, User Administrator</td>
            </tr>
            <tr>
              <td><strong>カスタムロール</strong></td>
              <td>作成可能</td>
              <td>作成可能（P1以上）</td>
            </tr>
            <tr>
              <td><strong>管理画面</strong></td>
              <td>リソースの「アクセス制御(IAM)」</td>
              <td>Entra ID の「ロールと管理者」</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box important">
        <div class="info-box-title">重要</div>
        この2つは完全に別のロールシステム。Azure RBAC の Owner であっても、Entra ID の Global Administrator ではない（逆も同様）。ただし Global Administrator は自身を Azure サブスクリプションの User Access Administrator に昇格させることができる。
      </div>

      <!-- ==================== -->
      <h2 id="conditional-access">条件付きアクセス</h2>
      <p>「if（条件）→ then（制御）」の形式で、アクセスにポリシーを適用する Entra ID の機能。<strong>Entra ID P1 以上</strong>が必要。</p>

      <h3>ポリシーの構成要素</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>要素</th>
              <th>説明</th>
              <th>例</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>割り当て（Who）</strong></td>
              <td>対象ユーザー・グループ</td>
              <td>全ユーザー、特定グループ、ゲストユーザー</td>
            </tr>
            <tr>
              <td><strong>クラウドアプリ（What）</strong></td>
              <td>対象アプリケーション</td>
              <td>Office 365、Azure管理ポータル、カスタムアプリ</td>
            </tr>
            <tr>
              <td><strong>条件（Where/When）</strong></td>
              <td>アクセス元の状況</td>
              <td>場所（IPアドレス）、デバイスの状態、リスクレベル、クライアントアプリ</td>
            </tr>
            <tr>
              <td><strong>アクセス制御（Then）</strong></td>
              <td>許可・ブロック・追加要件</td>
              <td>MFA要求、準拠デバイス必須、ブロック、セッション制御</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>よくあるポリシーパターン</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>シナリオ</th>
              <th>条件</th>
              <th>制御</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>管理者にMFAを強制</td>
              <td>管理者ロールのユーザー</td>
              <td>MFA要求</td>
            </tr>
            <tr>
              <td>社外からのアクセスをブロック</td>
              <td>信頼されたIPアドレス以外</td>
              <td>ブロック</td>
            </tr>
            <tr>
              <td>非準拠デバイスからのアクセス制限</td>
              <td>Intune非準拠デバイス</td>
              <td>ブロック or 制限付きアクセス</td>
            </tr>
            <tr>
              <td>リスクの高いサインインにMFA</td>
              <td>サインインリスク「中」以上</td>
              <td>MFA要求（P2必要）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>条件付きアクセスは <strong>P1以上</strong>。リスクベースの条件は <strong>P2</strong>（Identity Protection）</li>
          <li>Security Defaults と条件付きアクセスは併用不可。条件付きアクセスを使うなら Security Defaults は無効にする</li>
          <li>ポリシーは「レポート専用」モードでテスト可能（本番適用前の確認）</li>
          <li>除外グループ（緊急アクセスアカウント用）を設定することがベストプラクティス</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="pim">Privileged Identity Management（PIM）</h2>
      <p>特権ロール（管理者権限）の常時付与を避け、必要な時だけ一時的に昇格させる仕組み。<strong>Entra ID P2</strong> が必要。</p>

      <h3>PIMの主要概念</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>概念</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>資格のある割り当て（Eligible）</strong></td>
              <td>ロールを使う権利はあるが、アクティブ化するまで権限はない。使う時に申請→承認→一定時間だけ有効</td>
            </tr>
            <tr>
              <td><strong>アクティブな割り当て（Active）</strong></td>
              <td>常時ロールが有効。PIMを使う意味が薄れるため最小限にすべき</td>
            </tr>
            <tr>
              <td><strong>Just-In-Time（JIT）アクセス</strong></td>
              <td>必要な時だけアクティブ化。最大期間を設定可能（既定は8時間）</td>
            </tr>
            <tr>
              <td><strong>承認ワークフロー</strong></td>
              <td>アクティブ化時に承認者の承認を要求できる</td>
            </tr>
            <tr>
              <td><strong>アクセスレビュー</strong></td>
              <td>定期的にロール割り当ての妥当性をレビュー</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>PIMの対象</h3>
      <ul>
        <li><strong>Entra ID ロール</strong> — Global Administrator, User Administrator 等</li>
        <li><strong>Azure RBAC ロール</strong> — Owner, Contributor 等</li>
        <li><strong>グループメンバーシップ</strong> — PIM for Groups（特定グループへのJITメンバー追加）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「管理者権限を常時付与せず、必要な時だけ有効にしたい」→ <strong>PIM</strong></li>
          <li>PIM は <strong>P2</strong> 必須。これを忘れると選択肢を間違える</li>
          <li>PIM は Entra ID ロールと Azure RBAC ロールの両方に使える</li>
          <li>緊急アクセスアカウント（Break Glass Account）には PIM ではなく永続的な Active 割り当てを行う</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="admin-units">管理単位（Administrative Units）</h2>
      <p>Entra ID テナント内で、ロールの適用範囲を特定のユーザー・グループ・デバイスに限定するための仕組み。</p>
      <ul>
        <li>大規模組織で部門ごとに管理者を分けたい場合に使用</li>
        <li>例：「東京支社の User Administrator」を作り、東京支社のユーザーだけを管理させる</li>
        <li>Azure RBAC のスコープとは別の概念（管理単位は Entra ID 側のスコープ）</li>
      </ul>

      <!-- ==================== -->
      <h2 id="decision-flow-authz">判断フロー：認可方式の選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>Azure リソースへのアクセス制御 → <strong>Azure RBAC</strong></li>
          <li>Entra ID ディレクトリの管理権限 → <strong>Entra ID ロール</strong></li>
          <li>組み込みロールで不足 → <strong>カスタムロール</strong></li>
          <li>条件に基づくアクセス制御（場所、デバイス等）→ <strong>条件付きアクセス（P1）</strong></li>
          <li>リスクベースのアクセス制御 → <strong>条件付きアクセス + Identity Protection（P2）</strong></li>
          <li>管理者権限のJIT付与 → <strong>PIM（P2）</strong></li>
          <li>テナント内で管理範囲を分割 → <strong>管理単位</strong></li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/role-based-access-control/overview" target="_blank">MS Learn: Azure RBAC とは</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/role-based-access-control/built-in-roles" target="_blank">MS Learn: Azure 組み込みロール</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/role-based-access-control/concept-understand-roles" target="_blank">MS Learn: Entra ID ロール</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/conditional-access/overview" target="_blank">MS Learn: 条件付きアクセス</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/id-governance/privileged-identity-management/pim-configure" target="_blank">MS Learn: PIM</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/role-based-access-control/administrative-units" target="_blank">MS Learn: 管理単位</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();