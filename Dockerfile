FROM centos:centos7

RUN \
  yum update -y && \
  yum install -y epel-release && \
  yum install -y python-setuptools hostname inotify-tools && \
  yum install -y java-1.7.0-openjdk && \
  yum install -y elasticsearch && \
  yum clean all && \
  easy_install supervisor
