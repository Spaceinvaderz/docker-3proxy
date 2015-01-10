#!/bin/sh
echo -n "Initializing..."
PROXY_USR_PWD=$(pwgen -s -N 1)
sed -e "s/proxy:CL:.*/proxy:CL:$PROXY_USR_PWD/" /usr/local/etc/3proxy/3proxy.cfg > /usr/local/etc/3proxy/3proxy.cfg
PROXY_ADM_PWD=$(pwgen -s -N 1)
sed -e "s/admin:CL:.*/proxy:CL:$PROXY_ADM_PWD/" /usr/local/etc/3proxy/3proxy.cfg > /usr/local/etc/3proxy/3proxy.cfg
PROXY_IP=$(hostname -i)
echo -e "\r               \rIP address:\t\t$PROXY_IP"
echo -e "\r               \rProxy user login:\tproxy"
echo -e "\r               \rProxy user password:\t$PROXY_USR_PWD"
echo -e "\r               \rProxy admin user:\tadmin"
echo -e "\r               \rProxy admin password:\t$PROXY_ADM_PWD"
/usr/local/etc/3proxy/bin/3proxy /usr/local/etc/3proxy/3proxy.cfg
PROXY_PID=$(cat /usr/local/etc/3proxy/3proxy.pid)
echo -e "\r               \rProxy process pid: $PROXY_PID"