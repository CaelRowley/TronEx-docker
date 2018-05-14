curl -XPUT http://localhost:9200/blocks
curl -XPUT http://localhost:9200/issuedassets
curl -XPUT http://localhost:9200/accounts

curl -XPUT "http://localhost:9200/blocks/block/_mapping" -H'Content-Type: application/json' -d @blockMapping.json
curl -XPUT "http://localhost:9200/issuedassets/issuedasset/_mapping" -H'Content-Type: application/json' -d @issuedAssetMapping.json
curl -XPUT "http://localhost:9200/accounts/account/_mapping" -H'Content-Type: application/json' -d @accountMapping.json

curl -XPUT "http://localhost:9200/nodes" -H 'Content-Type: application/json' -d @nodeMapping.json
