#!/usr/bin/env bash

/app/nginx/sbin/nginx -t && /app/nginx/sbin/nginx -g 'daemon off;'
