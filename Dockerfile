FROM centos:centos7

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y python-setuptools hostname inotify-tools wget tar unzip && \
  yum install -y java-1.7.0-openjdk && \
  yum clean all && \
  easy_install supervisor && \
  pip install awscli
