FROM registry.access.redhat.com/ubi8/ubi@sha256:f3e11575aee05d474cb994c0ece89d992ece85be0596480582251fdec7a68f0b

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
COPY package-lock.json /opt/semantic-release/package-lock.json
COPY default.releaserc.json /opt/semantic-release/default.releaserc.json

RUN npm install

WORKDIR /root
