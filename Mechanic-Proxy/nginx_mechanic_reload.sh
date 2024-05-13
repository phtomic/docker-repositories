#!/bin/bash
AMBIENTES=$(find /etc/nginx/conf.d/ -type f -print0 | xargs -0 egrep '^(\s|\t)*server_name' | sed -r -e 's/[ \t]*$//' -e 's/^[ \t]*//' -e 's/^#.*$//' -e 's/[ \t]*#.*$//' -e '/^$/d' | sed -e 's/\([^;\{\}]\)\n/\1 /g' | grep -P 'server_name[ \t]' | grep -v '\$' | grep '\.' | sed -r -e 's/(\S)[ \t]+(\S)/\1\n\2/g' -e 's/[\t ]//g' -e 's/;//' -e 's/server_name//' -e 's/\n/-d /' -e 's/\n//' -e 's/\r//' | tr '\n' ' ')
if ! test -z "$AMBIENTES"
then
    certbot --nginx --noninteractive --agree-tos --register-unsafely-without-email ${AMBIENTES}
fi;
nginx -s reload