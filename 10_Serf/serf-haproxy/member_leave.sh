#!/bin/bash

while read line; do
  print $line
  NAME=$(echo $line | awk '{print $1 }')
  sed -i'' "/${NAME} /d" /etc/haproxy/haproxy.cfg
done

/etc/init.d/haproxy reload
