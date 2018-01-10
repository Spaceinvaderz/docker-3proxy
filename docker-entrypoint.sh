#!/bin/bash

if [ -z "$PROXY_LOGIN" ] || [ -z "$PROXY_PASSWORD" ]; then
			echo >&2 'error: proxy is uninitialized, variables is not specified '
			echo >&2 '  You need to specify PROXY_LOGIN and PROXY_PASSWORD'
			exit 1
fi

if [ "$1" = "start_proxy" ]; then
	echo "
nserver 8.8.8.8
nserver 8.8.4.4
nscache 65536
nsrecord www.porno.com 127.0.0.1
daemon
pidfile /etc/3proxy/3proxy.pid
log /etc/3proxy/log/3proxy.log D
rotate 7
users $PROXY_LOGIN:CL:$PROXY_PASSWORD
auth strong
socks -p3128
flush
" > /etc/3proxy/3proxy.cfg

	/etc/3proxy/3proxy /etc/3proxy/3proxy.cfg
	PROXY_PID=$(cat /etc/3proxy/3proxy.pid)

	echo "Proxy user login:         $PROXY_LOGIN"
	echo "Proxy user password:      $PROXY_PASSWORD"
	echo "Proxy process pid:        $PROXY_PID"
	echo
	echo "Proxy process started!"
	
	tail -f /dev/null
	
else
	exec "$@"
fi

	


