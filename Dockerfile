FROM registry.cn-beijing.aliyuncs.com/zanda/alpine:latest

LABEL maintainer="panda"

RUN apk --no-cache add sudo python3 py3-pip openssl ca-certificates sshpass openssh-client rsync git \
    && apk --no-cache add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base \
    && pip3 install --upgrade pip cffi \
    && pip3 install ansible==2.9.15 \
    && pip3 install mitogen ansible-lint jmespath \
    && pip3 install --upgrade pywinrm \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /etc/ansible

WORKDIR /etc/ansible
