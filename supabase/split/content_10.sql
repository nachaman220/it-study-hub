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