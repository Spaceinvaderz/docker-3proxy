# 3proxy docker
#
# VERSION               0.3
# Run with: docker run --rm --name 3proxy -d -p 3128:3128 riftbit/3proxy
# or docker run --rm --name 3proxy -t -i -p 3128:3128 riftbit/3proxy

FROM alpine:latest
MAINTAINER Riftbit ErgoZ <ergozru@riftbit.com>

ARG PROXY_VERSION=0.8.11

RUN DIR=$(mktemp -d) && cd ${DIR} && \
    apk add --update alpine-sdk wget bash && \
    echo "Getting 3proxy sources..." && \
    wget -q http://3proxy.ru/${PROXY_VERSION}/3proxy-${PROXY_VERSION}.tgz && \
    echo "Unpacking 3proxy sources..." && \
    tar -xf 3proxy-${PROXY_VERSION}.tgz && \
    rm 3proxy-${PROXY_VERSION}.tgz && \
    cd 3proxy && \
    echo "Compiling 3proxy from sources..." && \
    make -f Makefile.Linux && \
    mkdir -p /etc/3proxy/log && \
    echo "Move binaries..." && \
    cd src && \
    mv 3proxy /etc/3proxy/ && \
    chmod -R 777 /etc/3proxy && \
    rm -rf ${DIR}

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3128
CMD ["start_proxy"]
