#!/bin/bash
set -e

if [ -z "$1" ]; then 
    PROXY_USR_PWD=$(pwgen -s -N 1)
else
    PROXY_USR_PWD=$1
fi

if [ -z "$2" ]; then 
    PROXY_ADM_PWD=$(pwgen -s -N 1)
else
    PROXY_ADM_PWD=$2
fi

echo "
nserver 8.8.8.8
nserver 8.8.4.4
nscache 65536
nsrecord www.porno.com 127.0.0.1
daemon
pidfile /var/run/3proxy.pid
log /var/log/3proxy.log D
rotate 7
users proxy:CL:$PROXY_USR_PWD
auth strong
socks -p3128
flush
users admin:CL:$PROXY_ADM_PWD
maxconn 1
auth strong
admin -p31331
flush
" > /etc/3proxy/3proxy.cfg

chmod 600 /etc/3proxy/3proxy.cfg

exec /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg
PROXY_PID=$(cat /var/run/3proxy.pid)

echo "IP address:               $(hostname -I)"
echo "Proxy user login:         proxy"
echo "Proxy user password:      $PROXY_USR_PWD"
echo "Proxy admin user:         admin"
echo "Proxy admin password:     $PROXY_ADM_PWD"
echo "Proxy process pid:        $PROXY_PID"
