#!/usr/bin/env bash

name="chrome-novnc"
docker rm -f ${name}

# file
# -p 5000:5000 \
# terminal
# -p 2222:2222 \

docker run -itd \
  --restart=always \
  --privileged \
  -p 7900:7900 \
  -e NOVNC_PASSWORD="123123" \
  -e TERMINAL_PASSWORD="123123" \
  -v ${PWD}/scripts:/app/scripts \
  --name ${name} chrome-novnc:latest
