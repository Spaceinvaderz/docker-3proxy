# 3proxy docker
#
# VERSION               0.1
# Run with: docker run --rm -d -p 3128:3128 -p 31331:31331 riftbit/miniproxy
# or docker run --rm -t -i -p 3128:3128 -p 31331:31331 riftbit/miniproxy

FROM debian:stable
MAINTAINER ErgoZ <ergozru@gmail.com>

# required packages
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install build-essential pwgen wget

RUN echo "Getting 3proxy sources..." && \
    wget -q http://3proxy.ru/0.7.1.1/3proxy-0.7.1.1.tgz && \
    echo "Unpacking 3proxy sources..." && \
    tar -xf 3proxy-0.7.1.1.tgz && \
    rm 3proxy-0.7.1.1.tgz && \
    cd 3proxy && \
    echo "Compiling 3proxy from sources..." && \
    make -f Makefile.Linux

RUN mkdir -p /usr/local/etc/3proxy/bin && \
    mkdir -p /usr/local/etc/3proxy/logs && \
    cp /3proxy/src/3proxy /usr/local/etc/3proxy/bin/3proxy

ADD 3proxy.cfg /usr/local/etc/3proxy/3proxy.cfg
ADD start_proxy.sh /

EXPOSE 3128:3128/tcp 31331:31331/tcp

CMD /start_proxy.sh

#CMD echo -n "Initializing..." && \
#    PROXY_USR_PWD=$(pwgen -s -N 1) && \
#    sed -e "s/proxy:CL:.*/proxy:CL:$PROXY_USR_PWD/" /usr/local/etc/3proxy/3proxy.cfg > /usr/local/etc/3proxy/3proxy.cfg && \
#    PROXY_ADM_PWD=$(pwgen -s -N 1) && \
#    sed -e "s/admin:CL:.*/proxy:CL:$PROXY_ADM_PWD/" /usr/local/etc/3proxy/3proxy.cfg > /usr/local/etc/3proxy/3proxy.cfg && \
#    PROXY_IP=$(hostname -I) && \
#    echo -e "\r               \rIP address:\t\t$PROXY_IP" && \
#    echo -e "\r               \rProxy user login:\tproxy" && \
#    echo -e "\r               \rProxy user password:\t$PROXY_USR_PWD" && \
#    echo -e "\r               \rProxy admin user:\tadmin" && \
#    echo -e "\r               \rProxy admin password:\t$PROXY_ADM_PWD" && \
#    /usr/local/etc/3proxy/bin/3proxy /usr/local/etc/3proxy/3proxy.cfg && \
#    PROXY_PID=$(cat /usr/local/etc/3proxy/3proxy.pid) && \
#    echo -e "\r               \rProxy process pid: $PROXY_PID"