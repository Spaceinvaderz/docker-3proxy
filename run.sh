#!/bin/bash

docker run --name dproxy \
  --net host \
  --detach \
  -p 3128:3128 \
  --env PROXY_LOGIN=LOGIN \
  --env PROXY_PASSWORD=PASSWORD \
  "$1"
