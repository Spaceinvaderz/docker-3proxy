# What is Docker-MiniProxy
Docker-MiniProxy is a container for socks5 proxy server [3proxy](http://www.3proxy.ru/).

# How to use

## Basic usage

```
docker run --rm --name miniproxy -ti -p 3128:3128 -p 31331:31331 riftbit/docker-miniproxy
```

After container starts you will see params for connection setup:

```

```

## Daemon usage

### First run

```
docker run --name miniproxy -di -p 3128:3128 -p 31331:31331 riftbit/docker-miniproxy
```

### Second and other run

```
docker start miniproxy
```

### After container started get connection params

```
docker logs miniproxy
```

### Remove container if you not needs in it

```
docker rm miniproxy
```

### Manual set password for proxy user and admin user
When you starts container you can use manual password set. 
First param is for proxy user.
Second param is for admin user.
You can set only proxy user password, or both (user and admin) password.

Only user password:
```
docker run --name miniproxy -di -p 3128:3128 -p 31331:31331 riftbit/docker-miniproxy proxy_user_password
```

User password and Admin password:

```
docker run --name miniproxy -di -p 3128:3128 -p 31331:31331 riftbit/docker-miniproxy proxy_user_password proxy_admin_password
```
