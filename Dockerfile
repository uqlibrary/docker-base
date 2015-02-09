FROM centos:centos7

RUN \
  yum update -y && \
  yum install -y python-setuptools hostname inotify-tools wget tar unzip && \
  yum clean all && \
  easy_install supervisor && \
  easy_install pip && \
  pip install awscli
