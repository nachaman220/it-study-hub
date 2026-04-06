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