INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.6', 1, 6, 'アプリの認証と認可', 'app-auth', '<h1>1.6 アプリケーションの認証と認可</h1>

      <p>アプリケーションが Azure リソースや API にアクセスするためには、そのアプリケーション自体にIDを付与し、適切な権限で認証・認可を行う必要がある。Entra ID では「アプリ登録」と「マネージドID」の2つのアプローチが用意されている。</p>

      <!-- ==================== -->
      <h2 id="app-registration">アプリ登録（アプリケーション登録）</h2>
      <p>Entra ID にアプリケーションのIDを登録し、そのアプリが Entra ID を使って認証できるようにする仕組み。Azure の外部で実行されるアプリケーション（オンプレミスのサーバー、他社クラウド上のアプリ等）にIDを付与する場合に使用する。</p>

      <h3>アプリ登録の主な機能</h3>
      <ul>
        <li><strong>SSO の実現</strong> — アプリ登録により Entra ID をIDプロバイダーとしたシングルサインオンを構成可能</li>
        <li><strong>アプリロールによるアクセス制御</strong> — アプリ独自のロールを定義し、ユーザーやグループに割り当てることで、アプリ内の権限を管理</li>
        <li><strong>マルチテナント対応</strong> — アプリ登録を「マルチテナント」に設定すると、他の Entra ID テナントのユーザーもアプリを利用できる</li>
      </ul>

      <h3>アプリ登録の認証情報</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>認証情報の種類</th>
              <th>説明</th>
              <th>注意点</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>クライアントシークレット</strong></td>
              <td>パスワードのような文字列。アプリのコードや構成ファイルに設定</td>
              <td>有効期限あり。期限切れ時に手動で更新・ローテーションが必要</td>
            </tr>
            <tr>
              <td><strong>証明書</strong></td>
              <td>X.509 証明書を使った認証。クライアントシークレットより安全</td>
              <td>証明書の管理・更新が必要</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>アプリ登録の認証情報（クライアントシークレットや証明書）はコードや構成に記述する必要があるため、ローテーション時にアプリ側の修正が発生する</li>
          <li>Azure 上で実行されるアプリには、アプリ登録ではなく<strong>マネージドID</strong>の使用が推奨される（認証情報の管理が不要なため）</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="managed-identity">マネージドID</h2>
      <p>Azure リソース（VM、App Service、Azure Functions 等）に直接割り当てるID。Entra ID が認証情報を自動的に管理するため、開発者がシークレットや証明書を扱う必要がない。</p>

      <h3>マネージドID の2つの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>種類</th>
              <th>作成方法</th>
              <th>ライフサイクル</th>
              <th>共有</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>システム割り当て</strong></td>
              <td>Azure リソースの設定で有効化すると自動的に作成</td>
              <td>リソースの削除時にIDも自動削除される</td>
              <td>不可（1リソース = 1ID）</td>
              <td>単一リソースに限定した権限管理。IDのライフサイクルをリソースに連動させたい場合</td>
            </tr>
            <tr>
              <td><strong>ユーザー割り当て</strong></td>
              <td>独立したAzureリソースとして事前に作成</td>
              <td>リソースを削除してもIDは残る。明示的に削除が必要</td>
              <td>可能（複数リソースで共有）</td>
              <td>複数のリソースで同一の権限を共有したい場合。リソースの再作成時にIDを維持したい場合</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>マネージドID は Azure が認証情報を自動管理するため、<strong>ローテーションが不要</strong>。これがアプリ登録との最大の違い</li>
          <li>「複数のVMで同じ権限を使いたい」→ <strong>ユーザー割り当てマネージドID</strong>を1つ作成し、各VMに割り当て</li>
          <li>「VMを削除したらIDも消えてほしい」→ <strong>システム割り当てマネージドID</strong></li>
          <li>マネージドID は Azure 上で実行されるリソースにのみ使用可能。オンプレミスや他クラウドのアプリにはアプリ登録を使う</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="app-vs-managed">アプリ登録 vs マネージドID</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>アプリ登録</th>
              <th>マネージドID</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>対象</strong></td>
              <td>Azure 内外のあらゆるアプリケーション</td>
              <td>Azure 上で実行されるリソースのみ</td>
            </tr>
            <tr>
              <td><strong>認証情報の管理</strong></td>
              <td>手動（シークレット・証明書の作成・ローテーション）</td>
              <td>自動（Azure が管理）</td>
            </tr>
            <tr>
              <td><strong>ローテーション</strong></td>
              <td>必要（有効期限切れに注意）</td>
              <td>不要</td>
            </tr>
            <tr>
              <td><strong>セキュリティ</strong></td>
              <td>認証情報の漏洩リスクあり</td>
              <td>認証情報がコードに現れないため安全</td>
            </tr>
            <tr>
              <td><strong>推奨度</strong></td>
              <td>Azure外のアプリで使用</td>
              <td>Azure上のリソースでは常に推奨</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-app-auth">判断フロー：アプリケーションIDの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>Azure 上のリソース（VM, App Service等）から他のAzureリソースにアクセス → <strong>マネージドID</strong>（推奨）</li>
          <li>複数の Azure リソースで同一IDを共有 → <strong>ユーザー割り当てマネージドID</strong></li>
          <li>リソースと同じライフサイクルでIDを管理 → <strong>システム割り当てマネージドID</strong></li>
          <li>オンプレミスや他クラウドのアプリに ID を付与 → <strong>アプリ登録</strong></li>
          <li>マルチテナントアプリの認証 → <strong>アプリ登録</strong>（マルチテナント設定）</li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity-platform/app-objects-and-service-principals" target="_blank">MS Learn: アプリケーション登録</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/managed-identities-azure-resources/overview" target="_blank">MS Learn: マネージドID の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/managed-identities-azure-resources/managed-identity-best-practice-recommendations" target="_blank">MS Learn: マネージドID のベストプラクティス</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();