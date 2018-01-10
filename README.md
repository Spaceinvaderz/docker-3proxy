# What is Docker-3Proxy
Docker-3Proxy is a container for socks5 proxy server based on [3proxy](http://www.3proxy.ru/).

# How to use :fire:

## Basic usage
Exposed Ports

- 3128/tcp

Volumes:

 - /etc/3proxy/log

```
docker run --name 3proxy -d -p 3128:3128 --env PROXY_LOGIN=pr0xyUser --env PROXY_PASSWORD=passw0rd riftbit/3proxy
```

After container starts you will see params for connection setup:

```
Proxy user login:         pr0xyUser
Proxy user password:      passw0rd
Proxy process pid:        6
Proxy process started!
```

## Daemon usage

### Run

```
docker run --name 3proxy -d --env PROXY_LOGIN=pr0xyUser --env PROXY_PASSWORD=passw0rd -p 3128:3128 riftbit/3proxy
```
