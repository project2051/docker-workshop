while read line; do
    print $line
    ROLE=`echo $line | awk '{print \$3 }'`

    echo $line | awk '{ printf "    server %s %s check\n", $1, $2 }' >> /etc/haproxy/haproxy.cfg
done

service haproxy reload 
