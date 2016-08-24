### Dockerfile for building latest OpenSSL

### I like CentOS
FROM centos:latest
## CentOS 7

MAINTAINER nguoianphu@gmail.com

### Some env variables
### I don't know how to get the latest version of OpenSSL, like openssl-latest.tar.gz
### So I have to put the version here
ENV OPENSSL_VERSION="1.0.2h"

RUN yum clean all \
 && yum -y update \
 ### Install tool for compiling
 && yum -y install gcc \
 && yum -y install make \
 && yum -y install wget \
 && yum -y install tar \
 && yum -y install perl \
 && yum clean all \
 ### BUILD OpenSSL
 && wget "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz" -P /tmp/ \
 && tar -xvf /tmp/openssl-${OPENSSL_VERSION}.tar.gz \
 && rm -rf /tmp/openssl-${OPENSSL_VERSION}.tar.gz \
 && cd openssl-${OPENSSL_VERSION} \
 && ./Configure linux-x86_64 \
 && make \
 && make test \
 && make install \
 && cd .. \
 && rm -rf openssl-${OPENSSL_VERSION}
 
 ENV PATH /usr/local/ssl/bin:$PATH
 
