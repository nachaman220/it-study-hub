INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.1', 1, 1, '認証ソリューションと Microsoft Entra', 'entra-id', '<h1>1.1 認証ソリューションと Microsoft Entra</h1>

      <!-- ==================== -->
      <h2 id="entra-family">Microsoft Entra ファミリー</h2>
      <p>Microsoft Entra は、ID とネットワークアクセスに関するサービス群の総称。Entra ID を中核として、以下のサービスが提供されている。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>サービス名</th>
              <th>概要</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Entra ID</strong></td>
              <td>クラウドベースの ID・アクセス管理サービス（本ページで詳述）</td>
            </tr>
            <tr>
              <td><strong>Entra Domain Services</strong></td>
              <td>マネージドなドメインサービス。オンプレAD DSの機能をクラウドで提供（ドメイン参加、LDAP、Kerberos/NTLM認証）</td>
            </tr>
            <tr>
              <td><strong>Entra Private Access</strong></td>
              <td>VPNを使わずに社内のプライベートアプリやリソースへゼロトラスト接続を提供</td>
            </tr>
            <tr>
              <td><strong>Entra Internet Access</strong></td>
              <td>SaaSアプリやインターネットへのアクセスをセキュリティ保護するゲートウェイサービス</td>
            </tr>
            <tr>
              <td><strong>Entra ID Governance</strong></td>
              <td>IDライフサイクル管理、エンタイトルメント管理、アクセスレビュー等を提供</td>
            </tr>
            <tr>
              <td><strong>Entra ID 保護（Identity Protection）</strong></td>
              <td>サインインリスクやユーザーリスクを検出し、リスクベースの条件付きアクセスを実現</td>
            </tr>
            <tr>
              <td><strong>Entra Verified ID</strong></td>
              <td>分散型ID標準に基づく検証可能な資格情報の発行・検証サービス</td>
            </tr>
            <tr>
              <td><strong>Entra External ID</strong></td>
              <td>消費者・パートナー向けの外部ユーザーID管理（旧Azure AD B2C含む）</td>
            </tr>
            <tr>
              <td><strong>Entra Permissions Management</strong></td>
              <td>マルチクラウド（Azure/AWS/GCP）の権限を可視化・適正化するCIEM</td>
            </tr>
            <tr>
              <td><strong>Entra ワークロード ID</strong></td>
              <td>アプリケーションやサービスなど人間以外のワークロードに付与するID管理</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="entra-id">Microsoft Entra ID とは</h2>
      <p>Microsoft Entra ID（旧 Azure Active Directory）は、Microsoftが提供するクラウドベースの ID およびアクセス管理サービス。Azure、Microsoft 365、その他SaaSアプリケーションへの認証・認可を一元管理する。</p>

      <div class="info-box note">
        <div class="info-box-title">名称変更</div>
        Azure Active Directory (Azure AD) は 2023年に Microsoft Entra ID に名称変更された。試験では両方の名称が出る可能性がある。
      </div>

      <h3>テナント</h3>
      <p>Entra ID のテナントは、組織を表す専用のインスタンス。1つの組織 = 1つのテナントが基本。テナントを作成すると <code>*.onmicrosoft.com</code> のドメインが割り当てられ、カスタムドメインを追加できる。</p>

      <!-- ==================== -->
      <h2 id="auth-methods">認証方式</h2>

      <h3>多要素認証（MFA）</h3>
      <p>以下の要素を2つ以上組み合わせて認証する：</p>
      <ul>
        <li><strong>知識情報</strong> — パスワード、PIN</li>
        <li><strong>所持情報</strong> — スマートフォン（Authenticatorアプリ）、ハードウェアトークン</li>
        <li><strong>生体情報</strong> — 指紋、顔認識</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        MFAを「全ユーザーに強制」するか「条件付きで適用」するかは、条件付きアクセスポリシー（1.2で解説）で制御する。セキュリティの既定値群（Security Defaults）を有効にすると、全ユーザーにMFAが要求される。
      </div>

      <h3>パスワードレス認証</h3>
      <p>パスワードを使わない認証方式。Microsoft はパスワードレスへの移行を推奨している。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>方式</th>
              <th>仕組み</th>
              <th>用途</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Windows Hello for Business</td>
              <td>生体認証 or PIN + デバイスに紐づく鍵</td>
              <td>Windows PC ログイン</td>
            </tr>
            <tr>
              <td>FIDO2 セキュリティキー</td>
              <td>物理キー（USB/NFC/BLE）</td>
              <td>共有PC、高セキュリティ環境</td>
            </tr>
            <tr>
              <td>Microsoft Authenticator</td>
              <td>プッシュ通知 + 番号照合</td>
              <td>モバイルユーザー</td>
            </tr>
            <tr>
              <td>証明書ベース認証（CBA）</td>
              <td>X.509証明書</td>
              <td>スマートカード環境の移行</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="external-users">外部ユーザーの管理</h2>

      <h3>Microsoft Entra B2B（Business to Business）</h3>
      <p>外部の組織（パートナー、取引先）のユーザーを自社テナントに「ゲスト」として招待し、自社リソースへのアクセスを許可する。</p>
      <ul>
        <li>招待されたユーザーは自組織のIDでサインインする（IDを別途作る必要がない）</li>
        <li>自社テナントのRBACやポリシーで制御できる</li>
        <li>外部コラボレーション設定で招待可能なドメインを制限できる</li>
      </ul>

      <h3>Microsoft Entra External ID（旧 B2C）</h3>
      <p>一般消費者向けアプリケーションのID管理。ソーシャルログイン（Google, Facebookなど）にも対応。</p>
      <ul>
        <li>消費者向けアプリのサインアップ/サインインのカスタマイズ</li>
        <li>別テナントで管理（本体の Entra ID テナントとは分離）</li>
        <li>ユーザーフローまたはカスタムポリシーで認証体験を設計</li>
      </ul>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>比較項目</th>
              <th>B2B</th>
              <th>External ID（旧B2C）</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>対象</td>
              <td>パートナー・取引先</td>
              <td>一般消費者</td>
            </tr>
            <tr>
              <td>IDの所在</td>
              <td>相手組織のID</td>
              <td>ローカルアカウント or ソーシャルID</td>
            </tr>
            <tr>
              <td>テナント</td>
              <td>自社テナント内にゲスト追加</td>
              <td>専用の別テナント</td>
            </tr>
            <tr>
              <td>ユースケース</td>
              <td>社外コラボレーション</td>
              <td>消費者向けアプリ（ECサイト等）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「外部パートナーにリソースを共有したい」→ B2B、「消費者向けアプリの認証」→ External ID。この判断は頻出。
      </div>

      <!-- ==================== -->
      <h2 id="entra-connect">Microsoft Entra Connect</h2>
      <p>オンプレミスの Active Directory と Microsoft Entra ID を同期するツール。ハイブリッドID環境の実現に必須。</p>

      <h3>同期方式の比較</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>方式</th>
              <th>仕組み</th>
              <th>パスワードの保存先</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>パスワードハッシュ同期 (PHS)</strong></td>
              <td>オンプレADのパスワードハッシュをクラウドに同期</td>
              <td>Entra ID（ハッシュ化済み）</td>
              <td>最もシンプル。推奨される既定の方式</td>
            </tr>
            <tr>
              <td><strong>パススルー認証 (PTA)</strong></td>
              <td>認証要求をオンプレADにリアルタイム転送</td>
              <td>オンプレミスのみ</td>
              <td>パスワードをクラウドに保存したくない場合</td>
            </tr>
            <tr>
              <td><strong>フェデレーション (AD FS)</strong></td>
              <td>AD FSサーバーが認証を処理</td>
              <td>オンプレミスのみ</td>
              <td>スマートカード認証等の高度な要件</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>PHSはMicrosoftが最も推奨する方式。障害時にもクラウド認証が可能（フォールバック）</li>
          <li>PTAは「パスワードハッシュをクラウドに置けない」セキュリティ要件がある場合に選択</li>
          <li>AD FSは最も複雑で運用負荷が高い。特別な要件がない限り推奨されない</li>
          <li>PHSとPTAは併用可能（PTAのフォールバックとしてPHSを有効化）</li>
        </ul>
      </div>

      <h3>Microsoft Entra Connect Cloud Sync</h3>
      <p>Entra Connectの軽量版。軽量エージェントをオンプレミスにインストールし、構成はクラウド側で管理する。複数の切断されたADフォレストがある場合に有効。</p>

      <!-- ==================== -->
      <h2 id="app-proxy">Microsoft Entra アプリケーションプロキシ</h2>
      <p>オンプレミスのWebアプリケーションに、VPNなしで外部からセキュアにアクセスするためのサービス。</p>
      <ul>
        <li>オンプレミスにコネクタ（軽量エージェント）をインストール</li>
        <li>外部URL → コネクタ → オンプレWebアプリ のリバースプロキシとして動作</li>
        <li>Entra ID の条件付きアクセスやMFAを適用できる</li>
        <li>VPN不要でゼロトラスト的なアクセスが実現可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「オンプレミスのWebアプリに外部からアクセスしたい」「VPNを使いたくない」→ アプリケーションプロキシ。
      </div>

      <!-- ==================== -->
      <h2 id="entra-governance">Microsoft Entra ID Governance</h2>
      <p>IDのライフサイクル管理とアクセスの適切な維持を自動化する機能群。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>機能</th>
              <th>概要</th>
              <th>ユースケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>エンタイトルメント管理</strong></td>
              <td>アクセスパッケージ（リソースの束）を定義し、申請 → 承認 → 期限付き付与を自動化</td>
              <td>新入社員やプロジェクトメンバーへのアクセス一括付与</td>
            </tr>
            <tr>
              <td><strong>アクセスレビュー</strong></td>
              <td>定期的にアクセス権を棚卸し、不要なアクセスを検出・削除</td>
              <td>コンプライアンス監査、権限の肥大化防止</td>
            </tr>
            <tr>
              <td><strong>ライフサイクルワークフロー</strong></td>
              <td>入社・異動・退社のイベントに応じて自動でアカウント操作を実行</td>
              <td>HR連携による入退社処理の自動化</td>
            </tr>
            <tr>
              <td><strong>PIM</strong></td>
              <td>特権ロールのJust-In-Time付与（詳細は1.2で解説）</td>
              <td>管理者権限の常時付与を避ける</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="entra-license">Microsoft Entra ID のライセンス</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>機能</th>
              <th>Free</th>
              <th>P1</th>
              <th>P2</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>ユーザー・グループ管理</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>SSO（アプリ数制限あり）</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>MFA（Security Defaults）</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>条件付きアクセス</td>
              <td></td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>動的グループ</td>
              <td></td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>アプリケーションプロキシ</td>
              <td></td>
              <td>&#10003;</td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>Identity Protection（リスクベース）</td>
              <td></td>
              <td></td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>PIM</td>
              <td></td>
              <td></td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>アクセスレビュー</td>
              <td></td>
              <td></td>
              <td>&#10003;</td>
            </tr>
            <tr>
              <td>エンタイトルメント管理</td>
              <td></td>
              <td></td>
              <td>&#10003;</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>条件付きアクセス → P1以上</strong></li>
          <li><strong>PIM / アクセスレビュー / Identity Protection → P2</strong></li>
          <li>問題で「コストを最小化」と問われたら、要件に必要な最小ライセンスを選ぶ</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="sso">シングルサインオン（SSO）</h2>
      <p>一度の認証で複数のアプリケーションにアクセスできる仕組み。Entra ID では主に2つの方式が利用される。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>方式</th>
              <th>仕組み</th>
              <th>適したケース</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>フェデレーション SSO</strong></td>
              <td>SAML 2.0 や OpenID Connect プロトコルを使い、Entra ID がIDプロバイダーとしてトークンを発行。アプリ側はトークンを検証してアクセスを許可</td>
              <td>対応プロトコルをサポートするSaaSアプリ・自社アプリ（推奨される方式）</td>
            </tr>
            <tr>
              <td><strong>パスワードベース SSO</strong></td>
              <td>ブラウザ拡張機能がアプリのログインページのHTMLフォームを検出し、保存された資格情報を自動入力して認証を代行</td>
              <td>SAMLやOpenID Connectに対応していないレガシーWebアプリ</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        フェデレーションSSO が推奨される方式。パスワードベースSSOは対応プロトコルがないアプリ向けの代替手段であり、ブラウザ拡張機能のインストールが必要になる。
      </div>

      <!-- ==================== -->
      <h2 id="entra-connect-health">Microsoft Entra Connect Health</h2>
      <p>Entra Connect コンポーネントの正常性を Azure ポータルから一元的に監視するサービス。オンプレミスの AD DS サーバーや Entra Connect の同期状態・パフォーマンスを可視化する。</p>
      <ul>
        <li>Entra Connect の同期エラーやオブジェクトの同期状態をリアルタイムで確認</li>
        <li>AD DS サーバーのレプリケーション状態やドメインコントローラーの正常性を監視</li>
        <li>AD FS サーバーを利用している場合はフェデレーションの正常性も監視可能</li>
        <li>アラート通知によって問題を早期に検出し対処できる</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Entra Connect Health は Entra ID P1 以上のライセンスが必要。ハイブリッド環境で同期の問題を監視・診断する場面で登場する。
      </div>

      <!-- ==================== -->
      <h2 id="lighthouse">Azure Lighthouse</h2>
      <p>外部の Entra テナントに所属するユーザーやグループに対して、自社の Azure サブスクリプション内のリソースへのアクセス権を委任できるサービス。マネージドサービスプロバイダー（MSP）が顧客のAzure環境を管理するシナリオで活用される。</p>
      <ul>
        <li>ゲストユーザーとして招待する必要がなく、外部テナントのユーザーがそのまま自社リソースを管理できる</li>
        <li>Azure Delegated Resource Management により、サービスプロバイダーは自社テナントから顧客のリソースを操作可能</li>
        <li>委任するスコープやロールを細かく制御でき、最小特権の原則を維持</li>
        <li>複数の顧客テナントを1つのポータルから横断的に管理できる</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「外部のサービスプロバイダーに自社のAzureリソースを管理させたい」「ゲストユーザーを作らずに外部テナントのユーザーにアクセスを委任したい」→ <strong>Azure Lighthouse</strong>。B2Bのゲスト招待との違いを押さえておくこと。
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-auth">判断フロー：認証方式の選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>クラウドのみ（オンプレADなし） → <strong>Entra ID のみ</strong>で完結</li>
          <li>ハイブリッド + シンプルさ重視 → <strong>PHS</strong></li>
          <li>ハイブリッド + パスワードをクラウドに置けない → <strong>PTA</strong>（+ フォールバックにPHS）</li>
          <li>ハイブリッド + スマートカード等の高度要件 → <strong>AD FS</strong></li>
          <li>外部パートナーとのコラボ → <strong>B2B</strong></li>
          <li>消費者向けアプリ → <strong>External ID（旧B2C）</strong></li>
          <li>オンプレWebアプリの外部公開 → <strong>アプリケーションプロキシ</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/fundamentals/whatis" target="_blank">MS Learn: Microsoft Entra ID とは</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/authentication/concept-authentication-methods" target="_blank">MS Learn: 認証方法</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/hybrid/connect/whatis-azure-ad-connect-v2" target="_blank">MS Learn: Microsoft Entra Connect</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/external-id/what-is-b2b" target="_blank">MS Learn: B2B コラボレーション</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/external-id/external-identities-overview" target="_blank">MS Learn: External ID</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/app-proxy/overview-what-is-app-proxy" target="_blank">MS Learn: アプリケーションプロキシ</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/id-governance/identity-governance-overview" target="_blank">MS Learn: ID Governance</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/enterprise-apps/what-is-single-sign-on" target="_blank">MS Learn: シングルサインオン</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/entra/identity/hybrid/connect/whatis-azure-ad-connect-health" target="_blank">MS Learn: Entra Connect Health</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/lighthouse/overview" target="_blank">MS Learn: Azure Lighthouse</a></li>
        </ul>
      </div>

      <!-- ==================== -->', true) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
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
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.5', 1, 5, 'Storageの認証・認可', 'storage-auth', '<h1>1.5 Azure Storage の認証・認可</h1>

      <p>Azure Storage（Blob、Files、Queue、Table）へのアクセスを制御するには、複数の認証・認可メカニズムが用意されている。セキュリティ要件や運用の利便性に応じて適切な方式を選択する。</p>

      <!-- ==================== -->
      <h2 id="storage-rbac">RBAC（ロールベースアクセス制御）</h2>
      <p>Entra ID のセキュリティプリンシパル（ユーザー、グループ、サービスプリンシパル、マネージドID）に対して、Azure RBAC のロールを割り当てることで Storage リソースへのアクセスを制御する。Microsoft が推奨する方式。</p>

      <h3>Storage 向けの主な組み込みロール</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>ロール</th>
              <th>権限</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>ストレージ Blob データ所有者</strong></td>
              <td>Blob コンテナーとデータへのフルアクセス（POSIX アクセス制御含む）</td>
            </tr>
            <tr>
              <td><strong>ストレージ Blob データ共同作成者</strong></td>
              <td>Blob データの読み取り、書き込み、削除</td>
            </tr>
            <tr>
              <td><strong>ストレージ Blob データ閲覧者</strong></td>
              <td>Blob データの読み取りのみ</td>
            </tr>
            <tr>
              <td><strong>ストレージ キュー データ共同作成者</strong></td>
              <td>Queue メッセージの読み取り、書き込み、削除</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>ABAC（属性ベースアクセス制御）</h3>
      <p>Azure RBAC を拡張し、リソースの属性（タグやBlob インデックスタグなど）を条件としてアクセス制御を定義できる仕組み。RBAC のロール割り当てに「条件」を追加する形で実装する。</p>
      <ul>
        <li>例：「タグ <code>Project=Alpha</code> が付いた Blob のみ読み取り可能」といった細かい制御が可能</li>
        <li>ロール割り当て数の上限を超えないように、条件を使って1つの割り当てで柔軟に制御できる</li>
      </ul>

      <div class="info-box important">
        <div class="info-box-title">重要</div>
        ABAC は現時点で <strong>Blob Storage</strong> と <strong>Queue Storage</strong> でのみサポートされている。Files や Table では利用できない。
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「Entra ID ベースの認証でストレージにアクセスしたい」→ RBAC（Microsoftが最も推奨する方式）</li>
          <li>「Blobのタグに基づいてアクセスを制御したい」→ ABAC条件付きのRBACロール割り当て</li>
          <li>ABACは Blob と Queue のみ対応。この制限は試験で問われやすい</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="access-keys">アクセスキー（共有キー）</h2>
      <p>ストレージアカウントに対するフルアクセスを提供する 512bit の共有キー。ストレージアカウントごとに2つのキーが生成され、ローテーション時に一方を使い続けながらもう一方を再生成できる。</p>

      <ul>
        <li>アクセスキーを持つ者はストレージアカウント内のすべてのデータに対してフルアクセスが可能</li>
        <li>パスワードのように扱い、外部に漏洩させないよう厳重に管理する必要がある</li>
        <li>定期的なキーのローテーションが推奨される</li>
        <li>可能な限りアクセスキーではなく Entra ID ベースの認証（RBAC）を使用すべき</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        アクセスキーはストレージアカウントへの「ルートパスワード」のような存在。セキュリティ要件が高い環境では、アクセスキーの使用を禁止し Entra ID 認証のみを許可する構成が推奨される（ストレージアカウントの設定で共有キー認可を無効化可能）。
      </div>

      <!-- ==================== -->
      <h2 id="sas">SAS（Shared Access Signatures）</h2>
      <p>ストレージリソースへの制限付きアクセスを付与する URI ベースのトークン。アクセスの範囲、権限、有効期間を細かく制御できる。</p>

      <h3>SAS の3つの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>種類</th>
              <th>対象サービス</th>
              <th>署名方法</th>
              <th>特徴</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>アカウント SAS</strong></td>
              <td>Blob, Files, Queue, Table</td>
              <td>ストレージアカウントの共有キーで署名</td>
              <td>複数サービスにまたがるアクセスを一括で付与可能</td>
            </tr>
            <tr>
              <td><strong>サービス SAS</strong></td>
              <td>Blob, Files, Queue, Table のいずれか1つ</td>
              <td>ストレージアカウントの共有キーで署名</td>
              <td>特定サービスの特定リソース（コンテナー、キュー等）へのアクセスを付与</td>
            </tr>
            <tr>
              <td><strong>ユーザー委任 SAS</strong></td>
              <td>Blob のみ</td>
              <td>Entra ID のユーザー委任キーで署名</td>
              <td>共有キーを使わないため最もセキュア。Microsoft推奨</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>ユーザー委任 SAS</strong> が最もセキュアな SAS。Entra ID の資格情報で署名するため、共有キーの漏洩リスクがない</li>
          <li>ユーザー委任 SAS は <strong>Blob のみ</strong>に対応。Files、Queue、Table には使えない</li>
          <li>「SAS を使う場合、どの種類が最も安全か？」→ ユーザー委任 SAS</li>
          <li>SAS トークンの有効期間はできるだけ短く設定するのがベストプラクティス</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-storage-auth">判断フロー：Storage の認証方式の選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>Entra ID ベースのきめ細かいアクセス制御 → <strong>RBAC</strong>（推奨）</li>
          <li>Blob のタグや属性に基づくアクセス制御 → <strong>RBAC + ABAC 条件</strong></li>
          <li>外部ユーザーへの一時的なアクセス付与 → <strong>SAS（可能ならユーザー委任SAS）</strong></li>
          <li>レガシーアプリとの互換性が必要 → <strong>アクセスキー</strong>（ただし非推奨、可能なら移行を検討）</li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/authorize-data-access" target="_blank">MS Learn: Azure Storage のデータアクセスの認可</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/assign-azure-role-data-access" target="_blank">MS Learn: Blob データへの RBAC ロール割り当て</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-sas-overview" target="_blank">MS Learn: SAS の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/storage-auth-abac" target="_blank">MS Learn: Azure Storage の ABAC</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
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
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('1.7', 1, 7, 'シークレット管理', 'keyvault', '<h1>1.7 シークレット管理ソリューション</h1>

      <p>アプリケーションが利用するパスワード、APIキー、暗号化キー、証明書などの機密情報（シークレット）を安全に一元管理するためのソリューション。</p>

      <!-- ==================== -->
      <h2 id="key-vault">Azure Key Vault</h2>
      <p>Azure Key Vault は、シークレットや暗号化キー、証明書を安全に格納・管理するためのクラウドサービス。アプリケーションのコードや構成ファイルに機密情報を直接記述する代わりに、Key Vault から取得する設計にすることでセキュリティを向上させる。</p>

      <h3>Key Vault のオブジェクトの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>オブジェクト</th>
              <th>説明</th>
              <th>具体例</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>シークレット</strong></td>
              <td>任意の文字列データを安全に保存。バージョン管理や有効期限の設定が可能</td>
              <td>パスワード、データベース接続文字列、APIキー、ストレージアカウントのアクセスキー</td>
            </tr>
            <tr>
              <td><strong>キー</strong></td>
              <td>暗号化に使用するキーを管理。ソフトウェアキーまたは HSM（ハードウェアセキュリティモジュール）保護キーを選択可能</td>
              <td>RSA キー、EC（楕円曲線）キー。データの暗号化・復号化・署名・検証に使用</td>
            </tr>
            <tr>
              <td><strong>証明書</strong></td>
              <td>X.509 証明書のライフサイクル（作成、インポート、更新、失効）を管理</td>
              <td>TLS/SSL 証明書。自動更新ポリシーの設定も可能</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Key Vault の主な特徴</h3>
      <ul>
        <li><strong>集中管理</strong> — シークレットを1箇所に集約し、アクセスポリシーで誰がどのオブジェクトにアクセスできるかを制御</li>
        <li><strong>監査ログ</strong> — Key Vault へのアクセスを記録し、誰がいつ何にアクセスしたかを追跡可能</li>
        <li><strong>バージョン管理</strong> — シークレットやキーの更新時に過去のバージョンを保持</li>
        <li><strong>論理的な削除（ソフトデリート）</strong> — 誤って削除した場合に復元可能。既定で有効</li>
        <li><strong>消去保護</strong> — ソフトデリートされたオブジェクトの完全削除を防止する追加の保護機能</li>
      </ul>

      <h3>Key Vault のアクセス制御</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>方式</th>
              <th>説明</th>
              <th>推奨度</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Azure RBAC</strong></td>
              <td>Key Vault の管理操作（作成、削除等）とデータ操作（シークレットの読み取り等）の両方を RBAC で制御</td>
              <td>推奨（新しい方式）</td>
            </tr>
            <tr>
              <td><strong>コンテナーアクセスポリシー</strong></td>
              <td>Key Vault ごとにアクセスポリシーを定義し、セキュリティプリンシパルに操作権限を付与</td>
              <td>レガシー方式（既存環境で使用）</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>Key Vault へのアクセスには<strong>マネージドID</strong>の使用が強く推奨される。アプリにマネージドIDを割り当て、そのIDに Key Vault の RBAC ロール（例：Key Vault Secrets User）を付与する構成が最もセキュア</li>
          <li>「アプリケーションのコードからパスワードやAPIキーを排除したい」→ <strong>Azure Key Vault</strong> にシークレットを格納し、アプリから参照</li>
          <li>Key Vault の RBAC ロールとして「Key Vault Secrets Officer（管理）」と「Key Vault Secrets User（読み取り）」の使い分けを押さえておく</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="key-vault-sku">Key Vault の SKU</h2>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>項目</th>
              <th>Standard</th>
              <th>Premium</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>シークレット</strong></td>
              <td>対応</td>
              <td>対応</td>
            </tr>
            <tr>
              <td><strong>ソフトウェアキー</strong></td>
              <td>対応</td>
              <td>対応</td>
            </tr>
            <tr>
              <td><strong>HSM 保護キー</strong></td>
              <td>非対応</td>
              <td>対応</td>
            </tr>
            <tr>
              <td><strong>証明書</strong></td>
              <td>対応</td>
              <td>対応</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「HSM で保護された暗号化キーが必要」→ Key Vault の <strong>Premium SKU</strong>。さらに高いセキュリティ要件（FIPS 140-2 Level 3等）が必要な場合は <strong>Azure Managed HSM</strong> や <strong>Azure Dedicated HSM</strong> を検討する。
      </div>

      <!-- ==================== -->
      <h2 id="key-vault-integration">Key Vault と連携するサービス</h2>
      <p>多くの Azure サービスが Key Vault と統合されており、シークレットや暗号化キーを安全に利用できる。</p>
      <ul>
        <li><strong>App Service / Azure Functions</strong> — Key Vault 参照を使ってアプリ設定にシークレットを安全に注入</li>
        <li><strong>Azure Disk Encryption</strong> — VM ディスクの暗号化キーを Key Vault に保管</li>
        <li><strong>Azure SQL Database</strong> — Transparent Data Encryption（TDE）のカスタマーマネージドキーを Key Vault で管理</li>
        <li><strong>Azure Storage</strong> — カスタマーマネージドキーによるストレージ暗号化</li>
      </ul>

      <!-- ==================== -->
      <h2 id="decision-flow-keyvault">判断フロー：シークレット管理の選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>パスワード・接続文字列・APIキーの安全な管理 → <strong>Key Vault シークレット</strong></li>
          <li>暗号化キーの管理 → <strong>Key Vault キー</strong>（Standard: ソフトウェア保護、Premium: HSM保護）</li>
          <li>TLS/SSL 証明書の管理・自動更新 → <strong>Key Vault 証明書</strong></li>
          <li>FIPS 140-2 Level 3 以上の HSM 要件 → <strong>Azure Managed HSM</strong> または <strong>Dedicated HSM</strong></li>
          <li>アプリから Key Vault にアクセス → <strong>マネージドID + RBAC</strong>（推奨構成）</li>
        </ol>
      </div>

      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/key-vault/general/overview" target="_blank">MS Learn: Azure Key Vault の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/key-vault/general/best-practices" target="_blank">MS Learn: Key Vault のベストプラクティス</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/key-vault/general/rbac-guide" target="_blank">MS Learn: Key Vault の RBAC</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/key-vault/general/soft-delete-overview" target="_blank">MS Learn: Key Vault の論理的な削除</a></li>
        </ul>
      </div>', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.1', 2, 1, 'Azure Storage', 'storage', '<h1>2.1-2.3 Azure Storage & Blob</h1>

      <!-- ==================== -->
      <h2 id="data-fundamentals">2.1 データソリューションの基礎</h2>

      <h3>データの分類</h3>
      <p>データは構造の有無によって3種類に分類される。適切なストレージサービスを選定するには、まずデータの種類を理解する必要がある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>分類</th><th>特徴</th><th>例</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>構造化データ</strong></td><td>固定スキーマ、行と列で表現。RDBMSで管理</td><td>顧客テーブル、受注テーブル</td></tr>
            <tr><td><strong>半構造化データ</strong></td><td>スキーマは緩やか。タグやキーで自己記述的</td><td>JSON、XML、YAML</td></tr>
            <tr><td><strong>非構造化データ</strong></td><td>スキーマなし。バイナリやテキストの塊</td><td>画像、動画、PDF、ログファイル</td></tr>
          </tbody>
        </table>
      </div>

      <h3>ストレージの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>仕組み</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ブロックストレージ</strong></td><td>データを固定サイズのブロックに分割して保存。低レイテンシ</td><td>VM のディスク（Managed Disks）</td></tr>
            <tr><td><strong>ファイルストレージ</strong></td><td>階層型ディレクトリ構造。SMB/NFS プロトコル</td><td>ファイル共有（Azure Files）</td></tr>
            <tr><td><strong>オブジェクトストレージ</strong></td><td>フラットな名前空間。メタデータ付きオブジェクト。HTTP/REST</td><td>非構造化データの大量保存（Blob Storage）</td></tr>
          </tbody>
        </table>
      </div>

      <h3>リレーショナル DB vs NoSQL</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>比較項目</th><th>リレーショナル DB</th><th>NoSQL</th></tr>
          </thead>
          <tbody>
            <tr><td>データモデル</td><td>テーブル（行と列）</td><td>ドキュメント、キーバリュー、グラフなど</td></tr>
            <tr><td>スキーマ</td><td>固定（事前定義）</td><td>柔軟（スキーマレスが多い）</td></tr>
            <tr><td>スケーリング</td><td>垂直スケール（スケールアップ）が基本</td><td>水平スケール（スケールアウト）が得意</td></tr>
            <tr><td>トランザクション</td><td>ACID を完全サポート</td><td>BASE（結果整合性が多い）</td></tr>
            <tr><td>適用領域</td><td>会計、在庫管理など厳密な整合性が必要な業務</td><td>IoT、SNS、リアルタイム分析など大規模・柔軟なデータ</td></tr>
          </tbody>
        </table>
      </div>

      <h3>NoSQL データモデル</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>モデル</th><th>代表的なDB</th><th>特徴</th><th>ユースケース</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>キーバリュー</strong></td><td>Redis</td><td>キーに対して1つの値を格納。極めて高速</td><td>セッション管理、キャッシュ</td></tr>
            <tr><td><strong>ワイドカラム</strong></td><td>Apache Cassandra</td><td>行ごとに列を自由に追加可能</td><td>時系列データ、IoT</td></tr>
            <tr><td><strong>ドキュメント</strong></td><td>MongoDB</td><td>JSON/BSON形式のドキュメントを格納</td><td>コンテンツ管理、カタログ</td></tr>
            <tr><td><strong>グラフ</strong></td><td>Neo4j</td><td>ノードとエッジで関係性を表現</td><td>ソーシャルグラフ、レコメンデーション</td></tr>
          </tbody>
        </table>
      </div>

      <h3>データウェアハウス vs データレイク</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>比較項目</th><th>データウェアハウス（DWH）</th><th>データレイク</th></tr>
          </thead>
          <tbody>
            <tr><td>データ形式</td><td>構造化データ（ETL 済み）</td><td>あらゆる形式（生データ）</td></tr>
            <tr><td>スキーマ</td><td>スキーマオンライト（書込時に定義）</td><td>スキーマオンリード（読取時に定義）</td></tr>
            <tr><td>処理方式</td><td>SQL ベースの分析クエリ</td><td>バッチ処理やストリーム処理</td></tr>
            <tr><td>ユーザー</td><td>ビジネスアナリスト</td><td>データサイエンティスト・エンジニア</td></tr>
            <tr><td>Azure サービス</td><td>Synapse 専用 SQL プール</td><td>ADLS Gen2</td></tr>
          </tbody>
        </table>
      </div>

      <h3>Delta Lake</h3>
      <p>Delta Lake は、データレイク上に ACID トランザクション、スキーマ管理、タイムトラベル（履歴バージョンへのアクセス）などを追加するオープンソースのストレージレイヤー。データレイクの信頼性を大幅に向上させ、「レイクハウス」アーキテクチャの基盤となる技術。Azure Databricks で標準的に利用される。</p>

      <!-- ==================== -->
      <h2 id="azure-storage">2.2 Azure Storage</h2>

      <h3>Azure Storage のデータサービス</h3>
      <p>Azure Storage アカウントは、以下の複数のデータサービスをまとめて提供するコンテナー。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>サービス</th><th>種類</th><th>プロトコル</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Blob Storage</strong></td><td>オブジェクト</td><td>REST (HTTP/HTTPS)</td><td>画像・動画・バックアップなど非構造化データの大量保存</td></tr>
            <tr><td><strong>Azure Files</strong></td><td>ファイル共有</td><td>SMB / NFS</td><td>クラウド上のファイルサーバー。オンプレミスからのマウントも可能</td></tr>
            <tr><td><strong>Table Storage</strong></td><td>キーバリュー（NoSQL）</td><td>REST (OData)</td><td>スキーマレスな構造化データの格納（低コスト）</td></tr>
            <tr><td><strong>Queue Storage</strong></td><td>メッセージキュー</td><td>REST</td><td>非同期メッセージング。最大64KBのメッセージ</td></tr>
            <tr><td><strong>Azure NetApp Files</strong></td><td>ファイル共有</td><td>NFS / SMB</td><td>エンタープライズ向け高性能ファイルストレージ（NetApp技術ベース）</td></tr>
          </tbody>
        </table>
      </div>

      <h3>ストレージアカウントの種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>対応サービス</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Standard 汎用 v2</strong></td><td>Blob / Files / Table / Queue</td><td>最も汎用的。HDD ベース。ほとんどのシナリオで推奨</td></tr>
            <tr><td><strong>Premium ブロック Blob</strong></td><td>ブロック Blob / 追加 Blob</td><td>SSD ベース。低レイテンシが必要なシナリオ向け</td></tr>
            <tr><td><strong>Premium ページ Blob</strong></td><td>ページ Blob のみ</td><td>SSD ベース。非管理ディスク用</td></tr>
            <tr><td><strong>Premium ファイル共有</strong></td><td>Azure Files のみ</td><td>SSD ベース。高 IOPS が必要なファイル共有向け</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box important">
        <div class="info-box-title">POINT: Premium 汎用 v2 は存在しない</div>
        「Premium 汎用 v2」というアカウント種類は存在しない。Premium 性能が必要な場合は、用途に応じてブロック Blob / ページ Blob / ファイル共有のいずれかの Premium アカウントを選択する必要がある。
      </div>

      <h3>冗長性オプション</h3>
      <p>Azure Storage はデータの耐障害性を確保するため、複数のコピーを自動作成する。回復力の低い順から以下の4つのオプションが用意されている。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>オプション</th><th>コピー数</th><th>範囲</th><th>説明</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>LRS</strong>（ローカル冗長）</td><td>3</td><td>単一データセンター内</td><td>最も安価。DC障害には対応できない</td></tr>
            <tr><td><strong>ZRS</strong>（ゾーン冗長）</td><td>3</td><td>同一リージョンの3つの可用性ゾーン</td><td>ゾーン障害に耐性あり</td></tr>
            <tr><td><strong>GRS</strong>（geo冗長）</td><td>6</td><td>プライマリ(LRS) + セカンダリリージョン(LRS)</td><td>リージョン障害に対応。セカンダリは読取不可（RA-GRSで読取可能）</td></tr>
            <tr><td><strong>GZRS</strong>（geoゾーン冗長）</td><td>6</td><td>プライマリ(ZRS) + セカンダリリージョン(LRS)</td><td>最高の耐障害性。RA-GZRSでセカンダリ読取可能</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Premium ストレージアカウントでは LRS と ZRS のみ選択可能。GRS / GZRS は利用できない。高可用性と Premium 性能を両立するには ZRS を選択する。
      </div>

      <h3>暗号化オプション</h3>
      <p>Azure Storage に保存されるデータはすべて自動的に暗号化される（保存時の暗号化、SSE）。暗号化キーの管理方法には以下の3種類がある。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>方式</th><th>キーの管理者</th><th>説明</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Microsoft マネージドキー</strong></td><td>Microsoft</td><td>既定で有効。ユーザーの管理不要</td></tr>
            <tr><td><strong>カスタマーマネージドキー（CMK）</strong></td><td>ユーザー</td><td>Azure Key Vault に格納したキーを使用。キーのローテーションも管理可能</td></tr>
            <tr><td><strong>カスタマー指定のキー</strong></td><td>ユーザー</td><td>Blob 操作ごとにリクエストヘッダーでキーを指定。きめ細かい制御が可能</td></tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h2 id="blob-storage">2.3 Azure Blob Storage</h2>

      <h3>Blob の種類</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>種類</th><th>最大サイズ</th><th>特徴</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ブロック Blob</strong></td><td>約 190 TB</td><td>ブロック単位でアップロード。最も汎用的</td><td>ファイル、画像、動画など大半のシナリオ</td></tr>
            <tr><td><strong>ページ Blob</strong></td><td>8 TB</td><td>ランダムアクセスに最適化。512バイトページ単位</td><td>VHD（仮想ハードディスク）</td></tr>
            <tr><td><strong>追加 Blob</strong></td><td>約 195 GB</td><td>末尾への追加に特化。既存ブロックの変更不可</td><td>ログファイル、監査データ</td></tr>
          </tbody>
        </table>
      </div>

      <h3>アクセス層</h3>
      <p>Blob のアクセス頻度に応じてコストを最適化するための層。ストレージコストとアクセスコストはトレードオフの関係にある。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>アクセス層</th><th>ストレージコスト</th><th>アクセスコスト</th><th>最低保持期間</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>ホット</strong></td><td>高</td><td>低</td><td>なし</td><td>頻繁にアクセスされるデータ向け</td></tr>
            <tr><td><strong>クール</strong></td><td>やや低</td><td>やや高</td><td>30日</td><td>30日以上保持する、アクセス頻度の低いデータ</td></tr>
            <tr><td><strong>コールド</strong></td><td>低</td><td>高</td><td>90日</td><td>90日以上保持する、ほぼアクセスしないデータ</td></tr>
            <tr><td><strong>アーカイブ</strong></td><td>最低</td><td>最高</td><td>180日</td><td>オフライン。読み取りにはリハイドレート（数時間）が必要</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 既定のアクセス層</div>
        ストレージアカウントの既定のアクセス層として設定できるのは<strong>ホット</strong>または<strong>クール</strong>のみ。コールドとアーカイブは個別の Blob レベルでのみ設定可能で、アカウントの既定値にはできない。
      </div>

      <h3>ライフサイクル管理ポリシー</h3>
      <p>時間の経過に応じて Blob のアクセス層を自動的に変更したり、削除したりするルールを定義できる機能。</p>
      <ul>
        <li>対象はブロック Blob のみ（ページ Blob や追加 Blob は対象外）</li>
        <li>対応するアカウント種類は Standard 汎用 v2 および Premium ブロック Blob</li>
        <li>例：「作成から30日後にクール層へ移動」「90日後にアーカイブ層へ移動」「365日後に削除」</li>
      </ul>

      <h3>Blob の保護機能</h3>
      <p>誤操作やランサムウェアなどからデータを保護するための複数の機能が用意されている。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>機能</th><th>説明</th><th>備考</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>論理的な削除</strong></td><td>削除された Blob を指定期間（既定7日）保持し、復元可能にする</td><td>コンテナーレベル / Blob レベルで設定</td></tr>
            <tr><td><strong>バージョン管理</strong></td><td>Blob の更新時に自動でバージョンを作成・保持</td><td>過去バージョンへの復元が可能</td></tr>
            <tr><td><strong>変更フィード</strong></td><td>Blob の作成・変更・削除イベントのトランザクションログを提供</td><td>監査や変更追跡に利用</td></tr>
            <tr><td><strong>ポイントインタイムリストア</strong></td><td>Blob データを過去の特定時点の状態に復元</td><td>ブロック Blob のみ対応。論理的な削除・バージョン管理・変更フィードの有効化が前提</td></tr>
          </tbody>
        </table>
      </div>

      <h3>リソースロック</h3>
      <p>Azure リソースに対するロックを設定し、誤った変更や削除を防止する機能。ストレージアカウントやリソースグループに適用できる。</p>
      <ul>
        <li><strong>削除ロック（CanNotDelete）</strong>：リソースの削除を防止。変更は可能</li>
        <li><strong>読み取り専用ロック（ReadOnly）</strong>：リソースの変更と削除の両方を防止</li>
      </ul>

      <h3>不変ストレージ（WORM）ポリシー</h3>
      <p>保存したデータを変更・削除できないようにする機能。コンプライアンスや規制要件（金融、医療など）への対応に利用される。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>ポリシー種類</th><th>説明</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>時間ベースの保持ポリシー</strong></td><td>指定した期間（最大400年）データの変更・削除を禁止</td><td>ロック後は期間の短縮不可。延長のみ可能</td></tr>
            <tr><td><strong>訴訟ホールド（Legal Hold）</strong></td><td>ホールドが解除されるまでデータの変更・削除を禁止</td><td>保持期間の指定なし。法的調査等で利用</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「規制要件でデータを一定期間変更不可にする」→ 時間ベースの保持ポリシー</li>
          <li>「法的調査でデータを保全する」→ 訴訟ホールド</li>
          <li>不変ストレージはコンテナーレベルで設定する</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-storage">判断フロー：ストレージの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>非構造化データ（画像、動画、バックアップ）→ <strong>Blob Storage</strong></li>
          <li>ファイル共有（SMB/NFS）が必要 → <strong>Azure Files</strong>（高性能 → Premium ファイル共有、エンタープライズ → <strong>NetApp Files</strong>）</li>
          <li>VM のディスク → <strong>Managed Disks</strong>（ページ Blob ベース）</li>
          <li>メッセージキュー → <strong>Queue Storage</strong></li>
          <li>低コストな NoSQL テーブル → <strong>Table Storage</strong>（高機能 → Cosmos DB for Table）</li>
          <li>Premium 性能 + Blob → <strong>Premium ブロック Blob</strong> アカウント</li>
          <li>大半のシナリオ → <strong>Standard 汎用 v2</strong></li>
          <li>アクセス頻度が低い → <strong>クール / コールド / アーカイブ</strong>層を活用</li>
          <li>データの改変防止（コンプライアンス）→ <strong>不変ストレージポリシー</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-account-overview" target="_blank">MS Learn: Azure Storage アカウントの概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/storage-blobs-overview" target="_blank">MS Learn: Azure Blob Storage の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/common/storage-redundancy" target="_blank">MS Learn: Azure Storage の冗長性</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/access-tiers-overview" target="_blank">MS Learn: Blob のアクセス層</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/lifecycle-management-overview" target="_blank">MS Learn: ライフサイクル管理</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/immutable-storage-overview" target="_blank">MS Learn: 不変ストレージ</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.2', 2, 2, 'Azure SQL Database', 'sql-database', '<h1>2.4-2.5 Azure SQL Database</h1>

      <!-- ==================== -->
      <h2 id="relational-db">2.4 リレーショナルデータベースの概要</h2>

      <p>Azure では複数のリレーショナルデータベースサービスが提供されている。いずれも PaaS として管理され、パッチ適用やバックアップが自動化されている。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>サービス</th><th>エンジン</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Azure SQL Database</strong></td><td>SQL Server</td><td>最も広く利用される Azure のリレーショナル DB。フルマネージド PaaS</td></tr>
            <tr><td><strong>Azure Database for PostgreSQL</strong></td><td>PostgreSQL</td><td>オープンソース PostgreSQL 互換。フレキシブルサーバーデプロイ</td></tr>
            <tr><td><strong>Azure Database for MySQL</strong></td><td>MySQL</td><td>オープンソース MySQL 互換。フレキシブルサーバーデプロイ</td></tr>
            <tr><td><strong>Azure Database for MariaDB</strong></td><td>MariaDB</td><td>廃止予定。MySQL への移行が推奨されている</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Azure Database for MariaDB は廃止予定のサービスであり、新規の設計では選択すべきでない。既存ワークロードは MySQL フレキシブルサーバーへの移行が推奨されている。
      </div>

      <!-- ==================== -->
      <h2 id="sql-database">2.5 Azure SQL Database の詳細</h2>

      <h3>デプロイモデル</h3>
      <p>Azure SQL Database には、ワークロードの規模やパターンに応じた2つのデプロイオプションがある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>デプロイモデル</th><th>説明</th><th>適したシナリオ</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>単一データベース</strong></td><td>1つのデータベースに専用のリソース（コンピューティング・ストレージ）を割り当て</td><td>予測可能なワークロード。個別管理が容易</td></tr>
            <tr><td><strong>エラスティックプール</strong></td><td>複数のデータベースでリソース（eDTU/vCore）を共有</td><td>利用パターンが異なる複数 DB のコスト最適化。SaaS マルチテナントアプリ</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box note">
        <div class="info-box-title">エラスティックプールのイメージ</div>
        複数のデータベースが同じリソースプールを共有するため、あるDBがピーク時に他のDBの余剰リソースを活用できる。個別にリソースを確保するよりもコスト効率が高い。
      </div>

      <h3>SQL Managed Instance（MI）</h3>
      <p>SQL Server エンジンとのほぼ100%の互換性を持つ PaaS サービス。オンプレミスの SQL Server からの移行先として最適。</p>
      <ul>
        <li>VNet 内にデプロイされ、ネイティブな仮想ネットワーク統合を提供</li>
        <li>SQL Server Agent、Service Broker、CLR、クロスデータベースクエリなどをサポート</li>
        <li>データベース単位ではなくインスタンス単位の管理</li>
      </ul>

      <h3>SQL Server on Azure VM</h3>
      <p>Azure VM 上に SQL Server をインストールする IaaS 方式。OS レベルのフルアクセスが可能で、最も自由度が高い。</p>
      <ul>
        <li>OS やSQL Server の設定を完全に制御可能</li>
        <li>既存のSQL Server ライセンスを持ち込み可能（Azure Hybrid Benefit）</li>
        <li>パッチ適用、バックアップ、高可用性の構成はユーザーが管理</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: MI / VM を選ぶ理由</div>
        以下の要件がある場合、SQL Database（単一DB/エラスティックプール）ではなく MI または VM を検討する：
        <ul>
          <li><strong>サーバー名の直接指定</strong>が必要（接続文字列でインスタンス名を使用）</li>
          <li><strong>クロスデータベースクエリ</strong>（複数DBをまたぐJOINなど）</li>
          <li><strong>CLR（共通言語ランタイム）</strong>の利用が必要</li>
          <li><strong>カスタムアプリケーション</strong>がSQL Server固有の機能に依存</li>
          <li>PaaS で対応 → MI、OS制御も必要 → VM</li>
        </ul>
      </div>

      <h3>購入モデル</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>モデル</th><th>仕組み</th><th>対象</th><th>特徴</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>DTU ベース</strong></td><td>CPU・メモリ・I/O を束ねた DTU 単位で性能を指定</td><td>SQL Database のみ</td><td>シンプルで予測しやすい。Basic/Standard/Premium の3つのサービスレベル</td></tr>
            <tr><td><strong>vCore ベース</strong></td><td>vCPU 数・メモリ・ストレージを個別に指定</td><td>SQL Database / MI</td><td>柔軟性が高い。Azure Hybrid Benefit 適用可能。General Purpose / Business Critical / Hyperscale</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        SQL Managed Instance では vCore ベースの購入モデルのみ利用可能。DTU ベースは選択できない。
      </div>

      <h3>サーバーレスコンピューティング層</h3>
      <p>vCore ベースの SQL Database で利用可能な特別なコンピューティング層。</p>
      <ul>
        <li><strong>自動スケーリング</strong>：ワークロードに応じて vCore 数を自動調整（最小〜最大の範囲を指定）</li>
        <li><strong>使用時間課金</strong>：実際にコンピューティングが使用された秒数に対して課金</li>
        <li><strong>自動停止</strong>：一定時間アクティビティがない場合、コンピューティングを自動停止し課金を停止（ストレージ料金は継続）</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「使用パターンが断続的」「開発/テスト環境」「コスト最適化」→ サーバーレスが有効。ただし、自動停止後の再開時にはウォームアップのレイテンシが発生する。
      </div>

      <!-- ==================== -->
      <h2 id="sql-security">セキュリティ機能</h2>

      <h3>監査</h3>
      <p>データベースに対するすべての操作を記録し、コンプライアンス要件に対応する。監査ログの送信先は以下の3つ。</p>
      <ul>
        <li><strong>Azure Blob Storage</strong>：長期保存・アーカイブ向け</li>
        <li><strong>Azure Monitor（Log Analytics）</strong>：クエリによる分析向け</li>
        <li><strong>Event Hubs</strong>：サードパーティSIEMへのストリーミング向け</li>
      </ul>

      <h3>ファイアウォール</h3>
      <p>サーバーレベルおよびデータベースレベルの IP ファイアウォールルールにより、許可された IP アドレスのみがアクセス可能。VNet サービスエンドポイントやプライベートエンドポイントも利用できる。</p>

      <h3>アクセス制御（認証）</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>方式</th><th>説明</th><th>推奨度</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>SQL 認証</strong></td><td>ユーザー名とパスワードによる認証</td><td>レガシー。可能であれば避ける</td></tr>
            <tr><td><strong>Microsoft Entra ID 認証</strong></td><td>Entra ID の ID を使用して認証。MFA や条件付きアクセスを適用可能</td><td>推奨。セキュリティが高い</td></tr>
          </tbody>
        </table>
      </div>

      <h3>行レベルセキュリティ（RLS）</h3>
      <p>テーブル内の行へのアクセスを、クエリを実行するユーザーの属性（ロール、ユーザー名など）に基づいて制御する機能。同じテーブルでもユーザーごとに見える行が異なる。</p>

      <h3>動的データマスキング</h3>
      <p>クエリ結果に含まれる機密データ（PII など）をリアルタイムにマスク処理する機能。データベース内の実際の値は変更されない。サーバー側で処理される。</p>

      <h3>暗号化</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>暗号化</th><th>対象</th><th>処理場所</th><th>説明</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>転送中の暗号化</strong></td><td>ネットワーク通信</td><td>-</td><td>SSL/TLS によりクライアントとサーバー間の通信を暗号化</td></tr>
            <tr><td><strong>TDE（透過的データ暗号化）</strong></td><td>保存データ</td><td>サーバー側</td><td>既定で有効。DEK（データベース暗号化キー）でデータファイルを暗号化。カスタマーマネージドキー（BYOK）も可能</td></tr>
            <tr><td><strong>Always Encrypted</strong></td><td>特定の列</td><td>クライアント側</td><td>クライアントドライバーが暗号化/復号を実行。サーバー側では平文を見られない</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: マスキング vs Always Encrypted</div>
        <ul>
          <li><strong>動的データマスキング</strong>：サーバー側で処理。管理者や権限のあるユーザーは元データを閲覧可能。簡易的な PII 保護</li>
          <li><strong>Always Encrypted</strong>：クライアント側で暗号化。サーバー側（DBA 含む）は平文にアクセスできない。PII の厳格な保護に最適</li>
          <li>問題で「DBA にもデータを見せたくない」「PII を厳格に保護」→ <strong>Always Encrypted</strong></li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-sql">判断フロー：SQL サービスの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>SQL Server 固有機能（CLR, Service Broker等）が必要 + PaaS → <strong>SQL Managed Instance</strong></li>
          <li>OS レベルの制御が必要 / 既存 SQL Server のリフト&シフト → <strong>SQL Server on Azure VM</strong></li>
          <li>クロスデータベースクエリが必要 → <strong>MI</strong> または <strong>VM</strong></li>
          <li>複数DBのリソース共有でコスト最適化 → <strong>エラスティックプール</strong></li>
          <li>断続的なワークロードでコスト最適化 → <strong>サーバーレス</strong></li>
          <li>シンプルな単一DBワークロード → <strong>SQL Database（単一データベース）</strong></li>
          <li>PostgreSQL / MySQL ワークロード → <strong>対応するフレキシブルサーバー</strong></li>
          <li>DBA にもデータを見せない暗号化 → <strong>Always Encrypted</strong></li>
          <li>簡易的な表示マスク → <strong>動的データマスキング</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/sql-database-paas-overview" target="_blank">MS Learn: Azure SQL Database とは</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview" target="_blank">MS Learn: SQL Managed Instance</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/purchasing-models" target="_blank">MS Learn: 購入モデル</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/serverless-tier-overview" target="_blank">MS Learn: サーバーレス コンピューティング</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/security-overview" target="_blank">MS Learn: セキュリティの概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/sql/relational-databases/security/encryption/always-encrypted-database-engine" target="_blank">MS Learn: Always Encrypted</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-sql/database/dynamic-data-masking-overview" target="_blank">MS Learn: 動的データマスキング</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.3', 2, 3, 'Azure Cosmos DB', 'cosmosdb', '<h1>2.6-2.7 Azure Cosmos DB</h1>

      <!-- ==================== -->
      <h2 id="cosmosdb">2.6 非リレーショナルデータベース</h2>

      <h3>Azure Cosmos DB の概要</h3>
      <p>Azure Cosmos DB は、グローバル分散型のマルチモデル NoSQL データベースサービス。低レイテンシ、高スループット、高可用性を特徴とし、ミッションクリティカルなアプリケーションに適している。</p>

      <ul>
        <li><strong>マルチマスターレプリケーション</strong>：複数のリージョンで書き込みが可能。どのリージョンからでも読み書きできる</li>
        <li><strong>99.999% の可用性 SLA</strong>：マルチリージョン構成で業界最高水準の可用性を提供</li>
        <li><strong>5つの整合性レベル</strong>：Strong / Bounded Staleness / Session / Consistent Prefix / Eventual から選択</li>
        <li><strong>自動インデックス作成</strong>：すべてのプロパティに自動でインデックスが作成される</li>
      </ul>

      <h3>API オプション</h3>
      <p>Cosmos DB は複数の API をサポートしており、既存のアプリケーションやスキルセットに合わせた API を選択できる。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>API</th><th>データモデル</th><th>特徴</th><th>移行元</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>NoSQL</strong></td><td>ドキュメント（JSON）</td><td>SQL ライクなクエリ構文を使用。Cosmos DB ネイティブ。新規開発に推奨</td><td>新規アプリケーション</td></tr>
            <tr><td><strong>MongoDB</strong></td><td>ドキュメント（BSON）</td><td>MongoDB ワイヤプロトコル互換</td><td>既存の MongoDB アプリ</td></tr>
            <tr><td><strong>Apache Cassandra</strong></td><td>ワイドカラム</td><td>CQL（Cassandra Query Language）互換</td><td>既存の Cassandra アプリ</td></tr>
            <tr><td><strong>Apache Gremlin</strong></td><td>グラフ</td><td>Gremlin トラバーサル言語対応</td><td>グラフデータベースのワークロード</td></tr>
            <tr><td><strong>Table</strong></td><td>キーバリュー</td><td>Azure Table Storage API 互換。より高機能</td><td>Azure Table Storage からの移行</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: Cosmos DB for Table vs Azure Table Storage</div>
        <ul>
          <li><strong>Cosmos DB for Table</strong>：グローバル分散、低レイテンシ（10ms以下）、自動インデックス、SLA保証。高機能だがコストも高い</li>
          <li><strong>Azure Table Storage</strong>：単一リージョン、シンプル、低コスト</li>
          <li>高い可用性やグローバル分散が必要な場合は Cosmos DB for Table、コスト重視なら Azure Table Storage を選択</li>
        </ul>
      </div>

      <h3>Cosmos DB for PostgreSQL</h3>
      <p>PostgreSQL エンジンをベースとした、Citus 拡張機能による水平スケーリングに対応したサービス。大規模な PostgreSQL ワークロードに適している。</p>
      <ul>
        <li>テーブルのシャーディング（分散配置）により水平スケーリングを実現</li>
        <li><strong>マルチマスター不可</strong>：他の Cosmos DB API と異なり、書き込みはプライマリノードのみ</li>
        <li>読み取りレプリカによるリードスケーリングは可能</li>
        <li>既存の PostgreSQL アプリケーションをそのまま使用可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 「NoSQL」の2つの意味</div>
        <ul>
          <li><strong>広義の NoSQL</strong>：リレーショナル DB 以外のデータベース全般（ドキュメント、キーバリュー、グラフなど）</li>
          <li><strong>Cosmos DB の「NoSQL」API</strong>：Cosmos DB が提供する特定の API 名。SQL ライクなクエリが使える</li>
          <li>試験問題では文脈から「NoSQL」がどちらの意味で使われているか注意して読み取ること</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h2 id="cosmosdb-params">2.7 設計パラメータ</h2>

      <h3>要求ユニット（RU）</h3>
      <p>Cosmos DB ではスループットを「要求ユニット（RU/s）」で表現する。RU はデータベース操作のコストを正規化した単位。</p>
      <ul>
        <li><strong>1 RU</strong> = 1KB のアイテムを1回読み取る（ポイントリード）コスト</li>
        <li>書き込みは読み取りよりもコストが高い（概ね5〜6倍）</li>
        <li>クエリの複雑さ、アイテムサイズ、インデックス使用状況によって消費 RU が変動</li>
      </ul>

      <h3>容量モード</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>モード</th><th>課金方式</th><th>スループット</th><th>適したシナリオ</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>プロビジョニングスループット</strong></td><td>設定した RU/s に対する時間課金</td><td>固定（手動設定）</td><td>予測可能なワークロード。安定したトラフィック</td></tr>
            <tr><td><strong>自動スケーリング</strong></td><td>使用した最大 RU/s に対する時間課金</td><td>自動調整（最大値の10%〜100%）</td><td>トラフィックが変動するワークロード</td></tr>
            <tr><td><strong>サーバーレス</strong></td><td>消費した RU の従量課金</td><td>バースト対応</td><td>開発/テスト、断続的なトラフィック</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント: 自動スケーリング vs サーバーレス</div>
        <ul>
          <li><strong>自動スケーリング</strong>：時間単位で課金される。常時稼働するワークロードで、ピークに備えたい場合に最適</li>
          <li><strong>サーバーレス</strong>：使用した RU の従量課金。アイドル時間が長い場合にコスト効率が良い</li>
          <li>「トラフィックが予測できないが常時アクセスがある」→ 自動スケーリング</li>
          <li>「開発環境やアクセスがまばら」→ サーバーレス</li>
        </ul>
      </div>

      <h3>アクセス制御</h3>
      <p>Cosmos DB へのアクセスを制御する方法は複数用意されている。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>方式</th><th>説明</th><th>用途</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>RBAC（ロールベースアクセス制御）</strong></td><td>Entra ID の ID に対して Cosmos DB の組み込みロール or カスタムロールを割り当て</td><td>推奨される方式。きめ細かいアクセス制御が可能</td></tr>
            <tr><td><strong>プライマリキー / セカンダリキー</strong></td><td>アカウントレベルのマスターキー。フルアクセス権限</td><td>管理操作。キーのローテーションにセカンダリキーを活用</td></tr>
            <tr><td><strong>リソーストークン</strong></td><td>特定のコンテナーやアイテムへの一時的なアクセス権を付与するトークン</td><td>エンドユーザーへの限定的なアクセス許可</td></tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        プライマリキー/セカンダリキーはフルアクセス権限を持つため、本番環境ではできるだけ RBAC を使用することが推奨される。キーの漏洩リスクを低減できる。
      </div>

      <!-- ==================== -->
      <h2 id="decision-flow-nosql">判断フロー：NoSQL サービスの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>グローバル分散 + マルチリージョン書込 + 低レイテンシ → <strong>Cosmos DB</strong></li>
          <li>既存 MongoDB アプリの移行 → <strong>Cosmos DB for MongoDB</strong></li>
          <li>既存 Cassandra アプリの移行 → <strong>Cosmos DB for Cassandra</strong></li>
          <li>グラフデータの管理 → <strong>Cosmos DB for Gremlin</strong></li>
          <li>Azure Table Storage の高機能版 → <strong>Cosmos DB for Table</strong></li>
          <li>新規 NoSQL アプリ → <strong>Cosmos DB for NoSQL</strong>（推奨）</li>
          <li>PostgreSQL + 水平スケーリング → <strong>Cosmos DB for PostgreSQL</strong></li>
          <li>キャッシュ / セッション管理 → <strong>Azure Cache for Redis</strong></li>
          <li>低コストの単純なキーバリュー → <strong>Azure Table Storage</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/introduction" target="_blank">MS Learn: Azure Cosmos DB の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/choose-api" target="_blank">MS Learn: API の選択</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/request-units" target="_blank">MS Learn: 要求ユニット</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/throughput-serverless" target="_blank">MS Learn: プロビジョニングスループットとサーバーレス</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/how-to-setup-rbac" target="_blank">MS Learn: RBAC の構成</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/postgresql/introduction" target="_blank">MS Learn: Cosmos DB for PostgreSQL</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('2.4', 2, 4, 'データ分析', 'data-analytics', '<h1>2.8-2.9 データ分析ソリューション</h1>

      <!-- ==================== -->
      <h2 id="data-analytics-fundamentals">2.8 データ分析の基礎技術</h2>

      <h3>Hadoop エコシステム</h3>
      <p>Apache Hadoop は大規模データの分散処理を行うためのオープンソースフレームワーク。以下の主要コンポーネントで構成される。</p>
      <ul>
        <li><strong>HDFS（Hadoop Distributed File System）</strong>：大容量データをクラスター内の複数ノードに分散格納するファイルシステム。データの冗長性と耐障害性を提供</li>
        <li><strong>MapReduce</strong>：Map（分散処理）と Reduce（集約）の2段階で大規模データを並列処理するプログラミングモデル</li>
        <li><strong>YARN</strong>：クラスターのリソース管理とジョブスケジューリングを担当</li>
      </ul>

      <h3>Apache Spark</h3>
      <p>Hadoop の MapReduce を大幅に高速化した分散処理エンジン。データをディスクではなくメモリ上で処理（インメモリ処理）するため、MapReduce の最大100倍の速度を実現できる。</p>
      <ul>
        <li>バッチ処理とストリーム処理の両方に対応</li>
        <li>Python、Scala、Java、R、SQL をサポート</li>
        <li>機械学習ライブラリ（MLlib）やグラフ処理（GraphX）も内蔵</li>
      </ul>

      <h3>Databricks</h3>
      <p>Apache Spark の開発者が創設した企業が提供する、Spark ベースの統合分析プラットフォーム。SaaS として提供され、クラスターの管理やノートブック環境、ジョブスケジューリングなどを統合的に利用できる。Azure 上では Azure Databricks として提供されている。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Hadoop（MapReduce）はディスクベース、Spark はインメモリ。大規模データの高速処理が求められる場合は Spark（Databricks）を選択する。
      </div>

      <!-- ==================== -->
      <h2 id="data-analytics">2.9 Azure のデータ分析サービス</h2>

      <h3>データ分析の4つのステップ</h3>
      <p>Azure のデータ分析アーキテクチャは、以下の4段階で構成される。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>ステップ</th><th>目的</th><th>Azure サービス</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>1. 取り込み（Ingest）</strong></td><td>多様なデータソースからデータを収集</td><td>Azure Data Factory / Synapse パイプライン</td></tr>
            <tr><td><strong>2. 保存（Store）</strong></td><td>取り込んだデータを一元的に格納</td><td>Azure Data Lake Storage Gen2（ADLS Gen2）</td></tr>
            <tr><td><strong>3. 分析（Analyze）</strong></td><td>保存データを処理・変換・分析</td><td>Azure Databricks / Synapse Spark プール</td></tr>
            <tr><td><strong>4. 可視化（Visualize）</strong></td><td>分析結果をダッシュボードやレポートで提供</td><td>Synapse SQL プール / Analysis Services / Data Explorer / Power BI</td></tr>
          </tbody>
        </table>
      </div>

      <!-- ==================== -->
      <h3>Azure Data Factory</h3>
      <p>クラウドベースの ETL（Extract/Transform/Load）および ELT サービス。コードなしでデータパイプラインを構築できる。</p>
      <ul>
        <li><strong>マッピングデータフロー</strong>：コーディング不要のビジュアル環境でデータ変換ロジックを設計。Spark 上で実行される</li>
        <li><strong>セルフホステッド統合ランタイム</strong>：オンプレミスや他のクラウドのデータソースに接続するためのエージェント。プライベートネットワーク内のデータにアクセス可能</li>
        <li><strong>SSIS 統合ランタイム</strong>：既存の SSIS パッケージを Azure 上でそのまま実行するためのランタイム環境</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「オンプレミスのデータを Azure に取り込みたい」→ Data Factory + セルフホステッド統合ランタイム</li>
          <li>「既存の SSIS パッケージをクラウドで実行したい」→ SSIS 統合ランタイム</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h3>Azure Data Lake Storage Gen2（ADLS Gen2）</h3>
      <p>大規模データ分析に最適化されたストレージサービス。Azure Blob Storage の上に Hadoop 互換のファイルシステム機能を追加したもの。</p>
      <ul>
        <li><strong>HDFS 互換</strong>：Hadoop エコシステムのツール（Spark、Databricks など）から直接アクセス可能</li>
        <li><strong>階層型名前空間</strong>：ディレクトリとファイルの階層構造を効率的に管理。名前変更や移動がアトミック操作</li>
        <li><strong>ACL（アクセス制御リスト）</strong>：POSIX 準拠のきめ細かいアクセス制御をディレクトリ/ファイルレベルで設定可能</li>
        <li>Standard 汎用 v2 ストレージアカウントで階層型名前空間を有効化することで利用</li>
      </ul>

      <!-- ==================== -->
      <h3>Azure Databricks</h3>
      <p>Apache Spark ベースの統合分析プラットフォーム。Azure に最適化されたバージョンとして提供される。</p>
      <ul>
        <li>ノートブック環境での対話的なデータ探索</li>
        <li>自動クラスタースケーリング</li>
        <li>Delta Lake によるデータレイクの信頼性向上</li>
        <li><strong>資格情報パススルー</strong>：ユーザーの Entra ID 資格情報を ADLS Gen2 に自動転送してアクセス制御。Premium 以上の価格レベルで利用可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        Databricks の資格情報パススルーは Premium 以上の価格レベルで利用可能。Standard では利用できない。ユーザーごとのデータアクセス制御が必要な場合は Premium を選択する。
      </div>

      <!-- ==================== -->
      <h3>Azure Synapse Analytics</h3>
      <p>データ統合、データウェアハウス、ビッグデータ分析を統合したオールインワン分析サービス。1つのワークスペースから複数の分析ランタイムを利用できる。</p>

      <h4>分析ランタイム</h4>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr><th>ランタイム</th><th>エンジン</th><th>用途</th><th>課金</th></tr>
          </thead>
          <tbody>
            <tr><td><strong>Spark プール</strong></td><td>Apache Spark</td><td>ビッグデータの ETL / 機械学習 / データ探索</td><td>使用時間課金</td></tr>
            <tr><td><strong>専用 SQL プール</strong></td><td>MPP（超並列処理）</td><td>データウェアハウス。大規模なクエリの高速実行</td><td>DWU（Data Warehouse Unit）の時間課金</td></tr>
            <tr><td><strong>サーバーレス SQL プール</strong></td><td>分散SQL</td><td>データレイク上のデータをその場でクエリ（アドホック分析）</td><td>処理データ量による従量課金</td></tr>
          </tbody>
        </table>
      </div>

      <ul>
        <li><strong>マネージドワークスペース VNet</strong>：Synapse ワークスペースのコンピューティングリソースを分離された VNet 内にデプロイし、データの流出を防止</li>
        <li><strong>Synapse Link</strong>：Cosmos DB や Dataverse などの運用データベースからリアルタイムに分析用データを取り込む機能。ETL パイプラインを構築せずに HTAP（ハイブリッドトランザクション/分析処理）を実現</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「大規模 DWH + Spark + パイプラインを1つの環境で」→ Synapse Analytics</li>
          <li>「データレイクをクエリしたいが専用リソースは不要」→ サーバーレス SQL プール</li>
          <li>「Cosmos DB の運用データをリアルタイムに分析」→ Synapse Link</li>
        </ul>
      </div>

      <!-- ==================== -->
      <h3>Azure Analysis Services</h3>
      <p>エンタープライズ向けの OLAP（オンライン分析処理）エンジン。表形式のセマンティックモデルを構築し、Power BI やExcel などのクライアントツールから高速なクエリを実現する。</p>
      <ul>
        <li>セマンティックモデル（データのビジネスロジック層）を提供</li>
        <li><strong>同時接続数に制限なし</strong>：多数のユーザーが同時にレポートを閲覧するシナリオに対応</li>
        <li>DAX（Data Analysis Expressions）言語でメジャーや計算列を定義</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「多数のユーザーが同時にレポート/ダッシュボードにアクセスする」→ <strong>Analysis Services</strong>。同時接続数に制限がないことが重要な選択理由。
      </div>

      <!-- ==================== -->
      <h3>Azure Machine Learning</h3>
      <p>機械学習モデルのトレーニング、デプロイ、管理を行うためのクラウドサービス。AutoML やデザイナー（ノーコード）、Jupyter ノートブック、MLOps パイプラインなどを提供する。</p>

      <!-- ==================== -->
      <h3>Azure Data Explorer</h3>
      <p>大量のテレメトリデータやログデータに対する高速なリアルタイム分析に特化したサービス。</p>
      <ul>
        <li><strong>KQL（Kusto Query Language）</strong>を使用してクエリを実行</li>
        <li>ペタバイト級のデータに対する高速な探索的分析が可能</li>
        <li>IoT テレメトリ、アプリケーションログ、セキュリティログの分析に最適</li>
        <li>Azure Monitor の Log Analytics も内部的に Data Explorer（Kusto）エンジンを使用</li>
      </ul>

      <!-- ==================== -->
      <h3>Azure Data Share</h3>
      <p>組織間でデータを安全に共有するためのサービス。</p>
      <ul>
        <li><strong>スナップショット共有</strong>：送信者のストレージからデータのスナップショットを受信者のストレージにコピー。スケジュール設定可能</li>
        <li>受信者は自社のストレージにデータを保持するため、送信者側のデータにはアクセスしない</li>
        <li>共有の招待、承認、失効の管理が可能</li>
      </ul>

      <!-- ==================== -->
      <h3>Power BI</h3>
      <p>Microsoft のビジネスインテリジェンス（BI）ツール。データの可視化、ダッシュボード作成、レポート共有を行う。Synapse Analytics、Analysis Services、Azure SQL Database などと連携してデータを可視化する。</p>

      <!-- ==================== -->
      <h2 id="decision-flow-analytics">判断フロー：データ分析サービスの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>多様なソースからの ETL / データ統合 → <strong>Data Factory</strong>（オンプレミスあり → セルフホステッド統合ランタイム）</li>
          <li>大規模データの一元保存（データレイク）→ <strong>ADLS Gen2</strong></li>
          <li>Spark ベースの高度な分析 / ML → <strong>Databricks</strong></li>
          <li>DWH + Spark + パイプラインを統合 → <strong>Synapse Analytics</strong></li>
          <li>データレイクのアドホッククエリ → <strong>Synapse サーバーレス SQL プール</strong></li>
          <li>大規模 DWH → <strong>Synapse 専用 SQL プール</strong></li>
          <li>多数同時接続のセマンティックモデル → <strong>Analysis Services</strong></li>
          <li>ペタバイト級テレメトリの高速分析 → <strong>Data Explorer</strong></li>
          <li>組織間のデータ共有 → <strong>Data Share</strong></li>
          <li>ダッシュボード・レポート → <strong>Power BI</strong></li>
          <li>Cosmos DB のリアルタイム分析 → <strong>Synapse Link</strong></li>
        </ol>
      </div>

      <!-- ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/data-factory/introduction" target="_blank">MS Learn: Azure Data Factory の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/blobs/data-lake-storage-introduction" target="_blank">MS Learn: ADLS Gen2 の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/databricks/introduction/" target="_blank">MS Learn: Azure Databricks とは</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/synapse-analytics/overview-what-is" target="_blank">MS Learn: Azure Synapse Analytics の概要</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/analysis-services/analysis-services-overview" target="_blank">MS Learn: Azure Analysis Services</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/data-explorer/data-explorer-overview" target="_blank">MS Learn: Azure Data Explorer</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/data-share/overview" target="_blank">MS Learn: Azure Data Share</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cosmos-db/synapse-link" target="_blank">MS Learn: Synapse Link</a></li>
        </ul>
      </div>

      <!-- ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
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
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.2', 4, 2, 'アプリケーションアーキテクチャ', 'app-architecture', '<h1>4.2 アプリケーションアーキテクチャ</h1>

      <!-- ==================== メッセージング ==================== -->
      <h2 id="messaging">メッセージングサービス</h2>
      <p>分散アプリケーションにおいてコンポーネント間の通信を疎結合化するために、メッセージングサービスを利用する。メッセージングにはキュー（1 対 1）とトピック（パブリッシュ/サブスクライブ、1 対多）の 2 つの基本パターンがある。</p>

      <h3>Azure Queue Storage</h3>
      <p>Azure Storage アカウントの一機能として提供されるシンプルなキューサービス。</p>
      <ul>
        <li>メッセージの最大サイズは <strong>64 KB</strong></li>
        <li>キューの容量は事実上<strong>無制限</strong>（Storage アカウントの容量まで）</li>
        <li>REST API でアクセス。シンプルなキューイングに適している</li>
      </ul>

      <h3>Azure Service Bus</h3>
      <p>エンタープライズ向けのフルマネージドメッセージブローカー。キューとトピックの両方をサポートする。</p>
      <ul>
        <li><strong>キュー</strong> — 1 対 1 のメッセージ配信（1 つのコンシューマーが処理）</li>
        <li><strong>トピック</strong> — パブリッシュ/サブスクライブ（1 つのメッセージを複数のサブスクライバーが受信）</li>
        <li>メッセージの最大サイズは <strong>256 KB</strong>（Standard）/ <strong>100 MB</strong>（Premium）</li>
        <li>キュー容量は最大 <strong>80 GB</strong></li>
        <li><strong>FIFO 保証</strong>にはセッション機能を使用する</li>
        <li>トランザクション、重複検出、デッドレター キューなどのエンタープライズ機能を装備</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「FIFO（先入先出）が必要」→ <strong>Service Bus + セッション</strong></li>
          <li>「1 対多のメッセージ配信」→ <strong>Service Bus トピック</strong></li>
          <li>「シンプルなキュー + 大容量」→ <strong>Azure Queue Storage</strong></li>
          <li>Queue Storage は 64 KB / 無制限容量、Service Bus は 256 KB / 80 GB</li>
        </ul>
      </div>

      <!-- ==================== イベントドリブン ==================== -->
      <h2 id="event-driven">イベントドリブンアーキテクチャ</h2>

      <h3>Azure Event Grid</h3>
      <p>パブリッシュ/サブスクライブ型のイベントルーティングサービス。Azure サービスやカスタムアプリからの「出来事（イベント）」を、サブスクライバーに配信する。リソースの状態変更（Blob の作成、リソースグループの変更など）をトリガーに、Functions や Logic Apps などを起動するシナリオに最適。</p>

      <h3>Azure Event Hubs</h3>
      <p>大量のイベントやテレメトリデータを受信するための高スループットなデータストリーミングサービス。毎秒<strong>数百万件</strong>のイベントを処理できる。</p>
      <ul>
        <li><strong>キャプチャ機能</strong> — 受信したイベントを Azure Data Lake Storage Gen2 に自動保存。保存形式は <strong>Avro</strong>、<strong>Parquet</strong>、<strong>Delta Lake</strong> に対応</li>
        <li>IoT デバイスからのテレメトリ、ログ集約、クリックストリーム分析に適している</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>Event Grid</strong> → Azure サービス間の統合・イベントルーティング（「Blob が作成されたら Functions を実行」など）</li>
          <li><strong>Event Hubs</strong> → 大量データのストリーミング・取り込み（「毎秒百万件のテレメトリを処理」など）</li>
          <li>この 2 つの使い分けは頻出。サービス統合 = Event Grid、大量データ処理 = Event Hubs</li>
        </ul>
      </div>

      <!-- ==================== キャッシュ ==================== -->
      <h2 id="caching">キャッシュソリューション</h2>

      <h3>Azure CDN</h3>
      <p>コンテンツ配信ネットワーク。世界各地のポイント オブ プレゼンス（PoP）にコンテンツをキャッシュし、ユーザーに最も近い場所から配信することでレイテンシを削減する。静的コンテンツ（画像、CSS、JS）の配信高速化に有効。</p>

      <h3>Azure Cache for Redis</h3>
      <p>Redis ベースのフルマネージドなインメモリデータストア。データベースへのアクセスを減らし、アプリケーションの応答速度を大幅に向上させる。セッション管理、ページキャッシュ、リーダーボードなどに利用される。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        「DB の読み取り負荷を軽減したい」「応答速度を改善したい」→ <strong>Azure Cache for Redis</strong>。「静的コンテンツの配信を高速化したい」→ <strong>CDN</strong>。
      </div>

      <!-- ==================== 統合 ==================== -->
      <h2 id="api-management">API 管理と統合</h2>

      <h3>Azure API Management</h3>
      <p>バックエンドの API に対してゲートウェイを提供し、認証・認可、使用量の制限（レート制限）、変換、監視などの横断的な機能を一元管理するサービス。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>接続種類</th>
              <th>説明</th>
              <th>必要な SKU</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>なし（外部アクセスのみ）</strong></td>
              <td>API ゲートウェイがパブリックに公開される</td>
              <td>すべての SKU</td>
            </tr>
            <tr>
              <td><strong>VNet 外部</strong></td>
              <td>ゲートウェイは VNet 内に配置されるが、外部からアクセス可能</td>
              <td><strong>Premium</strong></td>
            </tr>
            <tr>
              <td><strong>VNet 内部</strong></td>
              <td>ゲートウェイは VNet 内のみからアクセス可能</td>
              <td><strong>Premium</strong></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        API Management の VNet 統合（外部/内部）→ <strong>Premium SKU</strong> が必要。
      </div>

      <h3>Azure Logic Apps</h3>
      <p>ノーコード/ローコードのワークフロー自動化サービス。数百種類のコネクタを使って、異なるサービス間の統合を視覚的に構築できる。</p>
      <ul>
        <li>トリガー例：スケジュール（定期実行）、Gmail の受信、HTTP リクエスト</li>
        <li>アクション例：Azure Functions の呼び出し、メール送信、DB 操作</li>
        <li><strong>オンプレミスデータゲートウェイ</strong>を使うと、オンプレミスのデータソース（SQL Server、ファイルサーバー等）にも接続可能</li>
      </ul>

      <!-- ==================== 構成管理 ==================== -->
      <h2 id="config-management">構成管理</h2>

      <h3>Azure App Configuration</h3>
      <p>アプリケーションの設定値を一元的に管理するサービス。複数のアプリやマイクロサービスの構成を集中管理し、変更を即座に反映できる。</p>
      <ul>
        <li>キーと値のペアで設定を管理（ラベル機能で環境ごとに分離可能）</li>
        <li><strong>機能フラグ</strong>（Feature Flag）により、コードを変更せずに機能の有効/無効を切り替えられる</li>
        <li>Key Vault への参照をサポートし、機密情報は Key Vault に保持したまま参照可能</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li><strong>App Configuration</strong> → アプリケーションの構成・設定値の一元管理、機能フラグ</li>
          <li><strong>Key Vault</strong> → シークレット（パスワード、接続文字列、証明書）の保護</li>
          <li>この 2 つは補完関係にあり、混同しないこと</li>
        </ul>
      </div>

      <!-- ==================== 自動化デプロイ ==================== -->
      <h2 id="automation-deploy">自動化デプロイ</h2>

      <h3>ARM テンプレート / Bicep</h3>
      <p>Infrastructure as Code（IaC）を実現する Azure ネイティブのツール。JSON 形式の ARM テンプレートまたは Bicep（DSL）でリソースの望ましい状態を定義し、宣言的にデプロイする。</p>
      <ul>
        <li>冪等性（何度実行しても同じ結果）を持つ</li>
        <li>リソースグループ、サブスクリプション、管理グループ、テナントのいずれのスコープにもデプロイ可能</li>
        <li>テンプレートスペックとして共有・バージョン管理が可能</li>
      </ul>

      <h3>Azure Automation</h3>
      <p>クラウドおよびオンプレミス環境の管理タスクを自動化するサービス。Runbook を使って定型作業を自動実行する。</p>
      <ul>
        <li><strong>Runbook</strong> — PowerShell または Python で記述する自動化スクリプト</li>
        <li>スケジュール実行、Webhook トリガー、アラートからの起動が可能</li>
        <li>Update Management による OS パッチ管理にも利用される</li>
      </ul>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「インフラをコードで管理したい」→ <strong>ARM テンプレート / Bicep</strong></li>
          <li>「定期的な運用タスクを自動化したい」→ <strong>Azure Automation + Runbook</strong></li>
          <li>ARM テンプレートは宣言的（What）、Runbook は手続き的（How）</li>
        </ul>
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-architecture">判断フロー：アーキテクチャコンポーネントの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>1 対 1 のメッセージ配信、シンプル・大容量 → <strong>Azure Queue Storage</strong></li>
          <li>1 対 1 + FIFO / エンタープライズ機能 → <strong>Service Bus キュー + セッション</strong></li>
          <li>1 対多のメッセージ配信 → <strong>Service Bus トピック</strong></li>
          <li>Azure サービス間のイベント統合 → <strong>Event Grid</strong></li>
          <li>大量データのストリーミング取り込み → <strong>Event Hubs</strong></li>
          <li>静的コンテンツの高速配信 → <strong>CDN</strong></li>
          <li>DB 読み取りの高速化 → <strong>Azure Cache for Redis</strong></li>
          <li>API のゲートウェイ・レート制限 → <strong>API Management</strong></li>
          <li>サービス間ワークフローの自動化 → <strong>Logic Apps</strong></li>
          <li>アプリ設定の一元管理 → <strong>App Configuration</strong></li>
          <li>機密情報の管理 → <strong>Key Vault</strong></li>
          <li>インフラのコード化 → <strong>ARM テンプレート / Bicep</strong></li>
          <li>運用タスクの自動化 → <strong>Azure Automation</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/storage/queues/storage-queues-introduction" target="_blank">MS Learn: Azure Queue Storage</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/service-bus-messaging/service-bus-messaging-overview" target="_blank">MS Learn: Azure Service Bus</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/event-grid/overview" target="_blank">MS Learn: Azure Event Grid</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/event-hubs/event-hubs-about" target="_blank">MS Learn: Azure Event Hubs</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/cdn/cdn-overview" target="_blank">MS Learn: Azure CDN</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-cache-for-redis/cache-overview" target="_blank">MS Learn: Azure Cache for Redis</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/api-management/api-management-key-concepts" target="_blank">MS Learn: API Management</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/logic-apps/logic-apps-overview" target="_blank">MS Learn: Logic Apps</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-app-configuration/overview" target="_blank">MS Learn: App Configuration</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/templates/overview" target="_blank">MS Learn: ARM テンプレート</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/automation/overview" target="_blank">MS Learn: Azure Automation</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.3', 4, 3, 'ネットワーク', 'network', '<h1>4.6 ネットワークソリューション</h1>

      <!-- ==================== VNet ==================== -->
      <h2 id="vnet">Azure Virtual Network（VNet）</h2>
      <p>VNet は Azure 上のプライベートネットワークの基盤。リソースをサブネットに配置し、ネットワークレベルの分離とセキュリティを提供する。VNet は<strong>リージョンごと</strong>に作成され、リージョンをまたぐことはできない（VNet ピアリングで接続は可能）。</p>

      <h3>インターネット接続</h3>
      <p>VNet 内のリソースからインターネットへの接続（送信/受信）は、以下の方法で実現する。</p>

      <h3>送信（アウトバウンド）</h3>
      <ul>
        <li><strong>既定の送信アクセス</strong> — VNet 内の VM は既定でインターネットへの送信が可能（Azure が動的に IP を割り当て）</li>
        <li><strong>NAT Gateway</strong> — サブネットに関連付けて固定のパブリック IP で送信接続を行う。送信元 IP を固定したい場合に利用</li>
      </ul>

      <h3>受信（インバウンド）</h3>
      <ul>
        <li><strong>パブリック IP</strong> — リソースに直接パブリック IP を割り当て</li>
        <li><strong>Load Balancer</strong> — レイヤー 4 の負荷分散で受信トラフィックを複数の VM に分散</li>
        <li><strong>Application Gateway</strong> — レイヤー 7 の負荷分散。URL パスベースのルーティング、SSL ターミネーション、WAF 統合が可能</li>
      </ul>

      <!-- ==================== オンプレミス接続 ==================== -->
      <h2 id="on-premises-connectivity">オンプレミス接続</h2>

      <h3>VPN Gateway</h3>
      <p>暗号化されたトンネルを介してオンプレミスネットワークと Azure VNet を接続する。</p>
      <ul>
        <li><strong>サイト間（S2S）VPN</strong> — オンプレミスの VPN デバイスと Azure VPN Gateway を IPsec/IKE トンネルで接続。拠点間の常時接続に利用</li>
        <li><strong>ポイント対サイト（P2S）VPN</strong> — 個々のクライアント端末から Azure VNet に接続。OpenVPN、IKEv2、SSTP プロトコルに対応。リモートワーカー向け</li>
      </ul>

      <h3>ExpressRoute</h3>
      <p>接続プロバイダーを介した Azure への<strong>プライベート接続</strong>。公衆インターネットを経由しないため、高い信頼性、高速なスループット、低遅延を実現する。ミッションクリティカルなワークロードに最適。</p>

      <h3>ExpressRoute Global Reach</h3>
      <p>複数のオンプレミスデータセンター同士を ExpressRoute 経由で接続する機能。BGP ルーティングを使用し、Azure のバックボーンネットワークを中継してオンプレ DC 間の通信を実現する。</p>

      <h3>Azure Virtual WAN</h3>
      <p>ネットワーク、セキュリティ、ルーティングの機能を単一の運用インターフェースに統合するサービス。仮想ハブを中心に、ブランチ（VPN）、ExpressRoute、VNet を接続する。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>SKU</th>
              <th>対応する接続</th>
              <th>備考</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Basic</strong></td>
              <td>S2S VPN のみ</td>
              <td>小規模拠点向け</td>
            </tr>
            <tr>
              <td><strong>Standard</strong></td>
              <td>S2S VPN + P2S VPN + ExpressRoute + VNet 間接続</td>
              <td>フル機能</td>
            </tr>
          </tbody>
        </table>
      </div>
      <p>Basic から Standard への<strong>アップグレードは可能</strong>だが、Standard から Basic への<strong>ダウングレードは不可</strong>。</p>

      <h3>セキュリティ保護付き仮想ハブ</h3>
      <p>Virtual WAN のハブに Azure Firewall、NVA（ネットワーク仮想アプライアンス）、またはサードパーティの SaaS セキュリティソリューションを統合したもの。ハブ経由のトラフィックにセキュリティポリシーを適用できる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「オンプレミスと Azure をプライベートに接続」→ <strong>ExpressRoute</strong></li>
          <li>「オンプレ DC 間を Azure バックボーンで接続」→ <strong>ExpressRoute Global Reach</strong></li>
          <li>「多数の拠点を一元管理」→ <strong>Virtual WAN</strong></li>
          <li>Virtual WAN の Basic は S2S のみ。P2S や ExpressRoute が必要なら Standard</li>
        </ul>
      </div>

      <!-- ==================== Private Link ==================== -->
      <h2 id="private-link">Azure Private Link</h2>
      <p>Azure PaaS サービスへの接続をパブリックインターネットを経由せずに行う仕組み。2 つのアプローチがある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>機能</th>
              <th>サービスエンドポイント</th>
              <th>プライベートエンドポイント</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>仕組み</strong></td>
              <td>サブネットからサービスへのルートを最適化</td>
              <td>VNet 内にプライベート IP を持つ NIC を作成</td>
            </tr>
            <tr>
              <td><strong>コスト</strong></td>
              <td>無料</td>
              <td>有料</td>
            </tr>
            <tr>
              <td><strong>オンプレミスからのアクセス</strong></td>
              <td>不可（VNet 内のみ）</td>
              <td>可能（VPN/ExpressRoute 経由）</td>
            </tr>
            <tr>
              <td><strong>DNS 構成</strong></td>
              <td>ルートテーブルで制御</td>
              <td>プライベート DNS ゾーンを使用</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Azure Monitor Private Link Scope（AMPLS）</h3>
      <p>Azure Monitor のデータ収集・クエリ通信をプライベートエンドポイント経由で行うための仕組み。Log Analytics ワークスペースや Application Insights への接続をプライベートネットワーク内に閉じることができる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「オンプレミスから PaaS サービスにプライベートアクセスしたい」→ <strong>プライベートエンドポイント</strong></li>
          <li>「無料でプライベートアクセスしたい（VNet 内のみ）」→ <strong>サービスエンドポイント</strong></li>
        </ul>
      </div>

      <!-- ==================== パフォーマンス ==================== -->
      <h2 id="network-performance">ネットワークパフォーマンスの最適化</h2>

      <h3>高速ネットワーク（AccelNet / SR-IOV）</h3>
      <p>VM のネットワークスタックをバイパスし、NIC から VM に直接データを転送する技術（SR-IOV）。ネットワークレイテンシの大幅な削減とスループットの向上を実現する。対応する VM サイズで利用可能。</p>

      <h3>Receive Side Scaling（RSS）</h3>
      <p>受信ネットワークトラフィックを複数の CPU コアに分散して処理する技術。マルチコア VM でのネットワーク処理の並列化を可能にする。</p>

      <h3>近接配置グループ</h3>
      <p>複数の VM を同じデータセンター内に物理的に近接して配置する論理的なグループ。VM 間のネットワークレイテンシを最小化する。HPC やリアルタイム処理など、低レイテンシが重要なシナリオに使用する。</p>

      <!-- ==================== セキュリティ ==================== -->
      <h2 id="network-security">ネットワークセキュリティ</h2>

      <h3>多層防御の考え方</h3>
      <p>ネットワークセキュリティは多層防御（Defense in Depth）の原則に基づいて設計する。</p>
      <ul>
        <li><strong>エッジ層</strong> — DDoS Protection と WAF でインターネットからの攻撃を防御</li>
        <li><strong>内部層</strong> — NSG と Azure Firewall でネットワーク内部のトラフィックを制御</li>
      </ul>

      <h3>Azure DDoS Protection</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>プラン</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>IP 保護</strong></td>
              <td>個別のパブリック IP に対する保護。小規模な環境向け</td>
            </tr>
            <tr>
              <td><strong>VNet 保護</strong></td>
              <td>VNet 全体を保護。テレメトリ、アラート、コスト保証などの追加機能を提供</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Web Application Firewall（WAF）</h3>
      <p>Web アプリケーションを SQL インジェクションや XSS などの一般的な攻撃から保護するファイアウォール。以下のサービスと統合して利用する。</p>
      <ul>
        <li><strong>Application Gateway</strong> — リージョン内の Web アプリ保護</li>
        <li><strong>Azure Front Door</strong> — グローバルなエッジでの Web アプリ保護</li>
        <li><strong>Azure CDN</strong> — CDN エッジでのコンテンツ保護</li>
      </ul>

      <h3>ネットワークセキュリティグループ（NSG）</h3>
      <p>サブネットまたは NIC に関連付けるステートフルなパケットフィルター。送信元/宛先の IP、ポート、プロトコルに基づいてトラフィックを許可/拒否するルールを定義する。</p>

      <h3>Azure Firewall</h3>
      <p>フルマネージドなクラウドネイティブのネットワークファイアウォール。L3-L7 のフィルタリング、FQDN フィルタリング、脅威インテリジェンスベースのフィルタリングを提供する。</p>
      <ul>
        <li><strong>ルールコレクション</strong>からファイアウォール<strong>ポリシー</strong>への移行が推奨されている</li>
        <li>ポリシーは<strong>親ポリシー/子ポリシー</strong>の階層構造を持てる（グローバルルールを親に定義し、リージョンごとのルールを子で上書き）</li>
        <li>ファイアウォールポリシーは<strong>リージョン間で共有できない</strong>（各リージョンに個別のポリシーが必要）</li>
      </ul>

      <h3>Azure Firewall Manager</h3>
      <p>複数の Azure Firewall インスタンスのセキュリティポリシーを一元管理するサービス。グローバルポリシーを定義し、各ハブやリージョンのファイアウォールに適用できる。セキュリティ保護付き仮想ハブとも統合される。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>NSG は<strong>サブネット/NIC レベル</strong>のフィルタリング。Azure Firewall は<strong>VNet レベル</strong>の集中管理型ファイアウォール</li>
          <li>「FQDN ベースのフィルタリング」「脅威インテリジェンス」→ <strong>Azure Firewall</strong></li>
          <li>「NSG のルールが正しく適用されているか確認したい」→ <strong>Network Watcher の IP フロー検証</strong></li>
          <li>ファイアウォールポリシーはリージョン共有不可。リージョンごとにポリシーを作成する</li>
        </ul>
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-network">判断フロー：ネットワークソリューションの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>オンプレミスと暗号化接続（コスト重視） → <strong>VPN Gateway（S2S）</strong></li>
          <li>リモートユーザーから VNet へ接続 → <strong>VPN Gateway（P2S）</strong></li>
          <li>オンプレミスと高信頼/高速なプライベート接続 → <strong>ExpressRoute</strong></li>
          <li>オンプレ DC 間を Azure 経由で接続 → <strong>ExpressRoute Global Reach</strong></li>
          <li>多数のブランチ拠点を一元管理 → <strong>Virtual WAN</strong></li>
          <li>PaaS サービスにプライベートアクセス（VNet 内のみ） → <strong>サービスエンドポイント</strong></li>
          <li>PaaS サービスにプライベートアクセス（オンプレミスからも） → <strong>プライベートエンドポイント</strong></li>
          <li>送信 IP を固定したい → <strong>NAT Gateway</strong></li>
          <li>L7 負荷分散 + WAF → <strong>Application Gateway</strong></li>
          <li>サブネット/NIC のトラフィック制御 → <strong>NSG</strong></li>
          <li>集中型のネットワークセキュリティ → <strong>Azure Firewall</strong></li>
          <li>DDoS 攻撃対策 → <strong>DDoS Protection</strong></li>
          <li>VM 間の低レイテンシ → <strong>近接配置グループ + 高速ネットワーク</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-network/virtual-networks-overview" target="_blank">MS Learn: Azure Virtual Network</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/vpn-gateway/vpn-gateway-about-vpngateways" target="_blank">MS Learn: VPN Gateway</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/expressroute/expressroute-introduction" target="_blank">MS Learn: ExpressRoute</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-wan/virtual-wan-about" target="_blank">MS Learn: Virtual WAN</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/private-link/private-link-overview" target="_blank">MS Learn: Azure Private Link</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-network/accelerated-networking-overview" target="_blank">MS Learn: 高速ネットワーク</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/ddos-protection/ddos-protection-overview" target="_blank">MS Learn: DDoS Protection</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/web-application-firewall/overview" target="_blank">MS Learn: WAF</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/firewall/overview" target="_blank">MS Learn: Azure Firewall</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/firewall-manager/overview" target="_blank">MS Learn: Firewall Manager</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/network-watcher/network-watcher-monitoring-overview" target="_blank">MS Learn: Network Watcher</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/logs/private-link-security" target="_blank">MS Learn: AMPLS</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();
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