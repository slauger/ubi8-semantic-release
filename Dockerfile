FROM registry.access.redhat.com/ubi8/ubi@sha256:8b8cc63bcc10374ef349ec4f27a3aa1eb2dcd5a098d4f5f51fafac4df5db3fd7

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
