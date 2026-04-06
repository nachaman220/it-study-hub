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