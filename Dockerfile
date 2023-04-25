FROM registry.access.redhat.com/ubi8/ubi@sha256:e3311058176628ad7f0f288f894ed2afef61be77ad01d53d5b69bca0f6b6cec1

RUN dnf module enable nodejs:16 -y && \
    yum install -y \
    git \
    openssh-clients \
    npm \
 && yum clean all -y \
 && rm -rf /var/cache/yum/*

RUN mkdir /opt/semantic-release

WORKDIR /opt/semantic-release

COPY package.json /opt/semantic-release/package.json
COPY default.releaserc.json /opt/semantic-release/default.releaserc.json

RUN npm install

WORKDIR /root
