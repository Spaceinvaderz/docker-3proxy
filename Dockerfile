# 3proxy docker
# VERSION               0.3

FROM alpine:latest

MAINTAINER Riftbit ErgoZ <ergozru@riftbit.com>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=0.8.11

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="3proxy Socks5 Proxy Container" \
	org.label-schema.description="3proxy Socks5 Proxy Container" \
	org.label-schema.url="https://riftbit.com/" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/riftbit/docker-3proxy" \
	org.label-schema.vendor="Riftbit Studio" \
	org.label-schema.version=$VERSION \
	org.label-schema.schema-version="1.0" \
	maintainer="Riftbit ErgoZ"

RUN DIR=$(mktemp -d) && cd ${DIR} && \
    apk add --update alpine-sdk wget bash && \
    wget -q http://3proxy.ru/${VERSION}/3proxy-${VERSION}.tgz && \
    tar -xf 3proxy-${VERSION}.tgz && \
    cd 3proxy && \
    make -f Makefile.Linux && \
    mkdir -p /etc/3proxy/log && \
    cd src && mv 3proxy /etc/3proxy/ && \
    chmod -R 777 /etc/3proxy && \
    cd / && rm -rf ${DIR} && \
    apk del alpine-sdk wget && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME ["/etc/3proxy/log"]

EXPOSE 3128:3128/tcp

CMD ["start_proxy"]
