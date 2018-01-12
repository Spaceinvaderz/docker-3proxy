# What is Docker 3Proxy
Docker 3Proxy is a container with socks5 proxy server based on [3proxy](http://www.3proxy.ru/).

[![](https://images.microbadger.com/badges/version/riftbit/3proxy.svg)](https://microbadger.com/images/riftbit/3proxy) [![](https://images.microbadger.com/badges/image/riftbit/3proxy.svg)](https://microbadger.com/images/riftbit/3proxy) [![Docker Pulls](https://img.shields.io/docker/pulls/riftbit/3proxy.svg)](https://hub.docker.com/r/riftbit/3proxy/) [![Docker Stars](https://img.shields.io/docker/stars/riftbit/3proxy.svg)](https://hub.docker.com/r/riftbit/3proxy/) [![GitHub last commit](https://img.shields.io/github/last-commit/riftbit/docker-3proxy.svg)](https://github.com/riftbit/docker-3proxy) [![Docker Build Status](https://img.shields.io/docker/build/riftbit/3proxy.svg)](https://hub.docker.com/r/riftbit/3proxy/)
  
Link on docker hub: [riftbit/3proxy](https://hub.docker.com/r/riftbit/3proxy/)

Link on github: [riftbit/docker-3proxy](https://github.com/riftbit/docker-3proxy)

### Build Args

 - PROXY_VERSION=0.8.11
 
 
### Environment variables:
 
 - PROXY_LOGIN - login for proxy user (:exclamation:required!)
 - PROXY_PASSWORD - password for proxy user (:exclamation:required!)

### Exposed Ports

 - **3128:3128/tcp**

### Volumes
 - /etc/3proxy/log

### Container Changelog (dd.mm.yy)

- **12.01.18** - readme cleanups. fixes and updates

### Example usage

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
