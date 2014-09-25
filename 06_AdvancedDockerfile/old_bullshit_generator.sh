#!/bin/bash
stuff=("$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000001,Added to active LTE,LTE" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000001,Deleted non active from LTE,LTE" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000002,Added to active LTE,LTE" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000002,Deleted non active from LTE,LTE" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000003,Blocked,3G" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000003,Unblocked,3G" "$((((RANDOM%1024))+1024)),$((RANDOM%512)),$((RANDOM%256)),260019900000003,Blocked,3G")

mkdir -p /opt/logs
mkdir -p /opt/2logs

for k in {1..7}; do
  num_days_ago=$((k))
  data=`date --d "${num_days_ago} days ago" '+%Y%m%d_%H%M%S'`

  for z in {1..2}; do
    file=/opt/2logs/Volleyball_Log_ECSA${z}_$data.log
    for i in {1..10}; do
      seconds_ago=$((86400*$num_days_ago + $((i*17))))
      ut_seconds_ago=$((`date --universal +%s` - ${seconds_ago} | bc))
      echo "`date -ud@${ut_seconds_ago} '+%b %d %H:%M:%S'`,${stuff[$(($RANDOM%${#stuff[*]}))]}" >> $file
    done
    mv $file /opt/logs
  done
done


for k in {2..52}; do
  num_days_ago=$((k*7))
  data=`date --d "${num_days_ago} days ago" '+%Y%m%d_%H%M%S'`

  for z in {1..2}; do
    file=/opt/2logs/Volleyball_Log_ECSA${z}_$data.log
    for i in {1..10}; do
      seconds_ago=$((86400*$num_days_ago + $((i*17))))
      ut_seconds_ago=$((`date --universal +%s` - ${seconds_ago} | bc))
      echo "`date -ud@${ut_seconds_ago} '+%b %d %H:%M:%S'`,${stuff[$(($RANDOM%${#stuff[*]}))]}" >> $file
    done
    mv $file /opt/logs
  done
done
