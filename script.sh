#!/bin/bash

[[ -z "${SLEEP_TIME}" ]] && sleepTime='30' || sleepTime="${SLEEP_TIME}"

while sleep ${sleepTime};
 do date;
 echo "********** Network *********";
 tail /var/log/netstats
 echo "********** Memory  *********";
 free -m;
 echo "********** CUP %   *********" ;
 grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print "CPU used: ",usage, "%"}';

 echo "###################################";
done