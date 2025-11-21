#!/usr/bin/env bash

[ ".${TERMINAL_USER}" != "." ] && [ ".${TERMINAL_PASSWORD}" != "." ] && OPTS="-c ${TERMINAL_USER}:${TERMINAL_PASSWORD}"
/app/gotty/gotty -w -p 2222 ${OPTS} /bin/sh
