FROM docker.elastic.co/elasticsearch/elasticsearch:6.2.4
#
RUN yum -y update \
    && wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.4-linux-x86_64.tar.gz \
    && sha512sum kibana-6.2.4-linux-x86_64.tar.gz \
    && tar -xzf kibana-6.2.4-linux-x86_64.tar.gz
