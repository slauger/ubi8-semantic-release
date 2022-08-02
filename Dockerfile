FROM registry.access.redhat.com/ubi8/ubi@sha256:6edca3916b34d10481e4d24d14ebe6ebc6db517bec1b2db6ae2d7d47c2ecfaee

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
