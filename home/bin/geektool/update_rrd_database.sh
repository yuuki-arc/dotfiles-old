#!/bin/bash
rrdtool="/usr/local/bin/rrdtool"
while :
do
    data=$(netstat -i -b | grep en1 | tail -n 1 | awk '{print $7" "$10}')
    inbytes=$( echo $data | awk '{print $1}')
    oubytes=$( echo $data | awk '{print $2}')
    $rrdtool update bandwidthusage_db.rrd N:$inbytes:$oubytes
    sleep 9
done
