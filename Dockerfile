FROM centos:7

ENV HOME /root

RUN ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
RUN rpm -Uvh https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-15.ius.centos7.noarch.rpm

COPY etc/papertrail-bundle.pem /etc/papertrail-bundle.pem
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
    groff \
    jq && \
  yum clean all && \
  easy_install supervisor && \
  easy_install pip && \
  pip install awscli
