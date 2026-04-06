var QUIZ_DATA_website_151 = {
  "source": "it-concepts-japan.com",
  "questions": [
    {
      "id": 151,
      "question": "次の表に示すリソースがあります。 CDB1 は、継続的に更新される運用データを保存するコンテナをホストします。 あなたは、AS1 を使用して運用データを毎日分析するソリューションを設計しています。 運用データ ストアのパフォーマンスに影響を与えずにデータを分析するソリューションを推奨する必要があります。 推奨事項には何を含めるべきですか。名前 | タイプ------------------AS1 | Azure Synapse Analytics インスタンスCDB1 | NoSQL アカウント用の Azure Cosmos DB",
      "choices": [
        "Azure Synapse Link for Azure Cosmos DB",
        "Azure Cosmos DB および Azure Synapse Analytics コネクタを備えた Azure Data Factory",
        "Azure Cosmos DB 変更フィード",
        "PolyBase データ読み込みを使用した Azure Synapse Analytics"
      ],
      "answer": 0,
      "explanation": "Azure Synapse Link for Azure Cosmos DB は、Azure Cosmos DB と Azure Synapse Analytics の間に緊密な統合を作成し、Azure Cosmos DB の運用データに対してほぼリアルタイムの分析を実行できるようにします。これにより、トランザクション ワークロードのパフォーマンスに影響を与えることなくデータを直接分析できる「非 ETL(抽出、変換、読込」 環境が作成されます。Azure Cosmos DB および Azure Synapse Analytics コネクタを備えた Azure Data Factory には ETL 操作が必要となり、運用データ ストアのパフォーマンスに影響を与える可能性があります。PolyBase データ読み込みを備えた Azure Synapse Analytics は、Azure Blob Storage や Azure Data Lake Storage などの外部データ ソースからのデータの読み込みに適しています。Azure Cosmos DB 変更フィードは、運用データ ストアのパフォーマンスに影響を与えることなく、分析のニーズに直接対処するものではありません。https://learn.microsoft.com/ja-jp/azure/cosmos-db/synapse-link",
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
