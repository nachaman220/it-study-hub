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