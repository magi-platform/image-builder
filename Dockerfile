FROM centos:latest
LABEL maintainer="michael.reynolds@twosixlabs.com"

RUN yum upgrade -y && \
    yum install -y yum-utils && \
    yum install -y python36 && \
    yum install -y make && \
    yum install -y git && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py

RUN groupadd docker && \
    usermod -aG docker root && \
    yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.10-3.2.el7.x86_64.rpm && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum -y install docker-ce docker-ce-cli containerd.io && \
    pip3 install docker-compose && \
    yum clean all && \
    rm -rf /var/cache/yum

ENTRYPOINT /bin/bash
