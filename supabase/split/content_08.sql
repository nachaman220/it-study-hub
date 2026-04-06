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