var QUIZ_DATA_website_151 = {
  "source": "original",
  "questions": [
    {
      "id": 151,
      "question": "以下の表に示すリソースがあります。CDB1 には継続的に更新される運用データを格納するコンテナーがホストされています。AS1 を使用して運用データを日次で分析するソリューションを設計しており、運用データストアのパフォーマンスに影響を与えずにデータを分析するためには、どのソリューションを推奨すべきですか。名前 | 種類------------------AS1 | Azure Synapse Analytics インスタンスCDB1 | NoSQL アカウント用の Azure Cosmos DB",
      "choices": [
        "Azure Synapse Link for Azure Cosmos DB",
        "Azure Cosmos DB および Azure Synapse Analytics コネクタを備えた Azure Data Factory",
        "Azure Cosmos DB 変更フィード",
        "PolyBase データ読み込みを使用した Azure Synapse Analytics"
      ],
      "answer": 0,
      "explanation": "Azure Synapse Link for Azure Cosmos DB は、Cosmos DB と Synapse Analytics の間に緊密な統合を構築し、トランザクションワークロードのパフォーマンスに影響を及ぼすことなく運用データに対するほぼリアルタイムの分析を可能にします。ETL 不要の環境を実現し、運用データを直接分析できます。Azure Data Factory を介したコネクタ方式では ETL 操作が伴い運用ストアに負荷がかかる可能性があります。PolyBase は Azure Blob Storage や Data Lake Storage 等の外部ソースからの読み込み向けです。変更フィードは分析ニーズに直接対応するものではありません。https://learn.microsoft.com/ja-jp/azure/cosmos-db/synapse-link",
      "category": "",
      "tags": [
        "data-fundamentals",
        "blob-storage",
        "cosmosdb",
        "data-analytics",
        "containers"
      ]
    }
  ]
};
