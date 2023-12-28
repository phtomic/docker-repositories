#!/bin/bash
if [ -z "$(ls -A /<application>)" ]; then
   cp -r /opt/base/* /<application>
fi

/usr/bin/run_with_env.sh #ENV_PATH #NODE_APPLICATION_PATH
echo "" >>/var/log/<application>/empty

pm2 log