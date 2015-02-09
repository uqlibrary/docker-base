FROM centos:centos7

RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN \
  yum update -y && \
  yum install -y python-setuptools hostname inotify-tools wget tar unzip && \
  yum clean all && \
  easy_install supervisor && \
  easy_install pip && \
  pip install awscli
