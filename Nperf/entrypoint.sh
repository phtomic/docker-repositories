#!/bin/bash
if [ -z "$(ls -A /nperf)" ]; then
    cp -r /opt/base/* /nperf
fi
su
/etc/init.d/nperf-server start
tail -f /dev/null