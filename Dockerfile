FROM centos:centos7

ENV HOME /root

RUN ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm
RUN rpm -Uvh http://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-14.ius.centos7.noarch.rpm

COPY etc/profile.d/lts.sh /etc/profile.d/lts.sh
COPY etc/profile.d/nss-sdb-cache.sh /etc/profile.d/nss-sdb-cache.sh

RUN \
  yum update -y && \
  yum install -y \
    python-setuptools \
    hostname \
    inotify-tools \
    wget \
    tar \
    unzip \
    nano \
    which \
    jq && \
  yum clean all && \
  easy_install supervisor && \
  easy_install pip && \
  pip install awscli
