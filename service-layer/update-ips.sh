elasticsearch_ip="172.24.0.2"
cass_1_ip="172.23.0.3"
tron_ip="172.23.0.2"

sed -i -e "s/const GRPC_HOSTNAME_PORT = {hostname:\"*.*.*.*\", port:\"50051\"};/const GRPC_HOSTNAME_PORT = {hostname:\"$elasticsearch_ip\", port:\"50051\"};/g" ./index.js
# sed -i -e "s/const GRPC_HOSTNAME_PORT = {hostname:\"*.*.*.*\", port:\"50051\"};/const GRPC_HOSTNAME_PORT = {hostname:\"$cass_1_ip\", port:\"50051\"};/g" ./index.js
# sed -i -e "s/const GRPC_HOSTNAME_PORT = {hostname:\"*.*.*.*\", port:\"50051\"};/const GRPC_HOSTNAME_PORT = {hostname:\"$tron_ip\", port:\"50051\"};/g" ./index.js
