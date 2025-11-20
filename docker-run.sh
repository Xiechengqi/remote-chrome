#!/usr/bin/env bash

name="chrome-novnc"
docker rm -f ${name}
docker run -itd \
  --restart=always \
  --privileged \
  -p 5000:5000 \
  -p 2222:2222 \
  -p 7900:7900 \
  -e NOVNC_PASSWORD="123123" \
  -e TERMINAL_PASSWORD="123123" \
  -v ${PWD}/scripts:/app/scripts \
  --name ${name} \
  fullnode/chrome-novnc:latest
