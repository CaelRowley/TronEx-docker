#!/bin/bash

docker-compose -f docker-compose.yml up -d

sleep 60

#sudo docker cp ./cassandra/cass.sql tronexdocker_cassandra-1_1:./cass.sql

docker exec tronexdocker_cassandra-1_1 ./cass.sh
echo "SETUP DB TABLES ON CASSANDRA CLUSTER"

elasticsearch_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' elasticsearch)
cass_1_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tronexdocker_cassandra-1_1)
tron_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tronexdocker_tron-node_1)

sed -i -e "s/elasticsearch_ip=\"*.*.*.*\"/elasticsearch_ip=\"$elasticsearch_ip\"/g" ./service-layer/update-ips.sh
sed -i -e "s/cass_1_ip=\"*.*.*.*\"/cass_1_ip=\"$cass_1_ip\"/g" ./service-layer/update-ips.sh
sed -i -e "s/tron_ip=\"*.*.*.*\"/tron_ip=\"$tron_ip\"/g" ./service-layer/update-ips.sh

docker cp service-layer/update-ips.sh tronex-docker_service-layer_1:/block-chain-explorer/update-ips.sh
sudo docker exec tronex-docker_service-layer_1 /bin/sh -c "./update-ips.sh"
