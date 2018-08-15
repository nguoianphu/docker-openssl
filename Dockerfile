### Dockerfile for building latest OpenSSL

# Alpine OS 3.8
# http://dl-cdn.alpinelinux.org/alpine/v3.8/community/x86_64/
FROM alpine:3.8

MAINTAINER Tuan Vo <vohungtuan@gmail.com>


####################################################
########               GCC   and tools          ###########
####################################################
# The GNU Compiler Collection 5.3.0-r0

RUN set -x \
    && apk add --no-cache \
        bash \
		wget \
        gcc \
        tar \
        alpine-sdk \
        perl \
        linux-headers \
    && rm -rf /var/cache/apk/*

###############################################################################
#                                INSTALLATION
###############################################################################

### Some env variables
### I don't know how to get the latest version of OpenSSL, like openssl-latest.tar.gz
### So I have to put the version here
ENV OPENSSL_VERSION="1.0.2p"

RUN set -x \
 ### BUILD OpenSSL
 && wget --no-check-certificate -O /tmp/openssl-${OPENSSL_VERSION}.tar.gz "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz" \
 && tar -xvf /tmp/openssl-${OPENSSL_VERSION}.tar.gz -C /tmp/ \
 && rm -rf /tmp/openssl-${OPENSSL_VERSION}.tar.gz \ 
 && cd /tmp/openssl-${OPENSSL_VERSION} \
 && ./Configure linux-x86_64 shared\
 && make \
 && make test \
 && make install \
 && cd .. \
 && rm -rf openssl-${OPENSSL_VERSION}
 
 ENV PATH /usr/local/ssl/bin:$PATH
 
