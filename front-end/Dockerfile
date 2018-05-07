FROM centos:centos7

RUN yum -y update \
    && curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs \
    && yum -y install gcc-c++ make \
    && yum -y install git \
    && git clone https://github.com/PaddyMc/TronEx.git

WORKDIR /TronEx

RUN npm install
