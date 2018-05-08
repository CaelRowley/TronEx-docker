curl -XPUT http://localhost:9200/blocks
echo "added blocks index"
curl -XPUT http://localhost:9200/issuedassets
echo "added issuedassets index"

curl -XPUT "http://localhost:9200/blocks/block/_mapping" -H'Content-Type: application/json' -d @blockMapping.json
echo "added blocks mappings"
curl -XPUT "http://localhost:9200/issuedassets/issuedasset/_mapping" -H'Content-Type: application/json' -d @issuedAssetMapping.json
echo "added issuedassets mappings"
