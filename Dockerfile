FROM centos:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

USER root

RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y centos-release-scl && \
    yum install -y python36 && \
    yum install -y make && \
    yum install -y git && \
    yum install -y docker && \
    yum clean all && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py

ENTRYPOINT /bin/bash