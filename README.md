# What is Docker-MiniProxy
Docker-MiniProxy is a container for socks5 proxy server [3proxy](http://www.3proxy.ru/).

# How to use

## Basic usage

```
docker run --rm --name miniproxy -ti -p 3128:3128 --env PROXY_LOGIN=pr0xyUser --env PROXY_PASSWORD=passw0rd riftbit/docker-miniproxy
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
docker run --name miniproxy -di --env PROXY_LOGIN=pr0xyUser --env PROXY_PASSWORD=passw0rd -p 3128:3128 riftbit/docker-miniproxy
```

### :fire: Remove container if you not needs in it

```
docker rm miniproxy
```