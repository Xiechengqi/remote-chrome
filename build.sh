#!/usr/bin/env bash

BASEPATH=`dirname $(readlink -f ${BASH_SOURCE[0]})` && cd $BASEPATH

docker buildx build . --tag fullnode/chrome-novnc:latest
