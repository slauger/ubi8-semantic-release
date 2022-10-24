FROM registry.access.redhat.com/ubi8/ubi@sha256:38e7c463209e3c5b7f1fcb79bb250e4653a66f3be9f23f5d175eeeadf8c3da79

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
