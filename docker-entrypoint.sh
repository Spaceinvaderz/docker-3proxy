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

sed -e "s/proxy:CL:.*/proxy:CL:$PROXY_USR_PWD/" /etc/3proxy/3proxy.cfg > /etc/3proxy/3proxy.cfg
sed -e "s/admin:CL:.*/proxy:CL:$PROXY_ADM_PWD/" /etc/3proxy/3proxy.cfg > /etc/3proxy/3proxy.cfg

exec /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg
PROXY_PID=$(cat /var/run/3proxy.pid)

echo "IP address:               $(hostname -I)"
echo "Proxy user login:         proxy"
echo "Proxy user password:      $PROXY_USR_PWD"
echo "Proxy admin user:         admin"
echo "Proxy admin password:     $PROXY_ADM_PWD"
echo "Proxy process pid:        $PROXY_PID"
