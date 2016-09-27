# Build the latest OpenSSL by docker container.

### Using the Docker.io Cloud machine

[![Build Status](https://travis-ci.org/nguoianphu/docker-openssl.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-openssl) [![](https://images.microbadger.com/badges/image/nguoianphu/docker-openssl.svg)](http://microbadger.com/images/nguoianphu/docker-openssl "Get your own image badge on microbadger.com")

### It's really awesome!

#### OS base on CentOS

``` centos:latest ```

### I don't know how to get the latest version of OpenSSL, like openssl-latest.tar.gz
### So I have to put the version here
## OPENSSL VERSION=```1.0.2h```

## Build and run

    docker build -t "openssl" .
    docker run --rm -it openssl openssl version

or
   
    docker run --rm -it nguoianphu/docker-openssl openssl version
