#!/bin/bash

if [ "$1" = "start_proxy" ]; then
  if [ -z $PROXY_USR_LOGIN ]; then echo "PROXY_USR_LOGIN is unset";
  if [ -z $PROXY_USR_PWD ]; then echo "PROXY_USR_PWD is unset";
  if [ -z $PROXY_ADMIN_LOGIN ]; then echo "PROXY_ADMIN_LOGIN is unset";
  if [ -z $PROXY_ADMIN_PWD ]; then echo "PROXY_ADMIN_PWD is unset";

  echo "
  nserver 8.8.8.8
  nserver 8.8.4.4
  nscache 65536
  nsrecord www.porno.com 127.0.0.1
  daemon
  pidfile /tmp/3proxy.pid
  log /etc/3proxy/3proxy.log D
  rotate 7
  users $PROXY_USR_LOGIN:CL:$PROXY_USR_PWD
  auth strong
  socks -p3128
  flush
  users $PROXY_ADMIN_LOGIN:CL:$PROXY_ADMIN_PWD
  maxconn 1
  auth strong
  admin -p31331
  flush
  " > /etc/3proxy/3proxy.cfg

  chmod 600 /etc/3proxy/3proxy.cfg

  exec /etc/3proxy/3proxy /etc/3proxy/3proxy.cfg
  PROXY_PID=$(cat /var/run/3proxy.pid)

  echo "IP address:               $(hostname -I)"
  echo "Proxy user login:         $PROXY_USR_LOGIN"
  echo "Proxy user password:      $PROXY_USR_PWD"
  echo "Proxy admin user:         $PROXY_ADMIN_LOGIN"
  echo "Proxy admin password:     $PROXY_ADMIN_PWD"
  echo "Proxy process pid:        $PROXY_PID"
fi

exec "$@"
