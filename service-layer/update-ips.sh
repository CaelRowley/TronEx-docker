elasticsearch_ip="172.20.0.3"
cass_1_ip="172.20.0.2"
tron_ip="172.20.0.4"

sed -i -e "s/const elasticSearchSetup = { host: '*.*.*.*:9200' };/const elasticSearchSetup = {host: '$elasticsearch_ip:9200'};/g" ./index.js
sed -i -e "s/const cassandraSetup = { contactPoints: \['*.*.*.*'\], keyspace: 'blockchainexplorer' };/const cassandraSetup = { contactPoints: ['$cass_1_ip'], keyspace: 'blockchainexplorer' };/g" ./index.js
sed -i -e "s/const GRPC_HOSTNAME_PORT = { hostname:\"*.*.*.*\", port:\"50051\" };/const GRPC_HOSTNAME_PORT = {hostname:\"$tron_ip\", port:\"50051\"};/g" ./index.js
