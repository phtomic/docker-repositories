#!/bin/bash
if [ -z "$(ls -A /mechanic-proxy)" ]; then
   cp -r /opt/base/* /mechanic-proxy
fi

service nginx start
tail -f /var/log/nginx/*.log