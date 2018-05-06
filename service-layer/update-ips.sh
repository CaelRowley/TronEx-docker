elasticsearch_ip="172.24.0.2"
cass_1_ip="172.23.0.3"
tron_ip="172.23.0.2"

sed -i -e "s/var elasticSearchSetup = {host: '*.*.*.*:9200'};/var elasticSearchSetup = {host: '$elasticsearch_ip:9200'};/g" ./index.js
sed -i -e "s/var cassandraSetup = { contactPoints: \['*.*.*.*'\], keyspace: 'blockchainexplorer' };/var cassandraSetup = { contactPoints: ['$cass_1_ip'], keyspace: 'blockchainexplorer' };/g" ./index.js
sed -i -e "s/const GRPC_HOSTNAME_PORT = {hostname:\"*.*.*.*\", port:\"50051\"};/const GRPC_HOSTNAME_PORT = {hostname:\"$tron_ip\", port:\"50051\"};/g" ./index.js
