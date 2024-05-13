#!/bin/bash
if [ -z "$(ls -A /ookla)" ]; then
    cp -r /opt/base/* /ookla
fi

/ooklaserver.sh start -i /ookla
tail -f /dev/null