#!/bin/bash

mkdir -p /opt/logged

PORT=2003
SERVER=localhost

for i in $(ls /opt/logs | grep -v lock); do
  if test ! -f /opt/logs/$i.lock; then
    touch /opt/logs/$i.lock
    while read line; do
      date=`echo $line | cut -f1 -d\,`
      timestamp=`date --date="$date" +%s`
      server=`echo $i | cut -f3 -d\_`
      val1=`echo $line | cut -f2 -d\,`
      val2=`echo $line | cut -f3 -d\,`
      val3=`echo $line | cut -f4 -d\,`
      echo "logs.${server}.active $val1 $timestamp" | nc -q0 $SERVER $PORT
      echo "logs.${server}.disconnected $val2 $timestamp" | nc -q0 $SERVER $PORT
      echo "logs.${server}.blocked $val3 $timestamp" | nc -q0 $SERVER $PORT
    done < /opt/logs/$i
    rm /opt/logs/$i.lock
    mv /opt/logs/$i /opt/logged/$i
  fi
done
