#!/bin/bash

while read line; do
  ROLE=`echo $line | awk '{print \$3 }'`
  echo $ROLE >> /role
  if [[ "$ROLE" == "nginx" ]]; then
    echo "yay" >> /role
    echo $line | awk '{ printf "    server %s %s check\n", $1, $2 }' >> /etc/haproxy/haproxy.cfg
  fi
done

/etc/init.d/haproxy reload
