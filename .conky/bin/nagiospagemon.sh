#!/bin/bash
URL1="http://212.7.139.19/cgi-bin/nagios3/extinfo.cgi?type=1&host="
URL2=".fusion-network.de"
URL="$URL1$1$URL2"
USERNAME="hraasch"
PASSWORD="hei1915!"

PAGE=$(curl --retry 3 -s -k -u $USERNAME:$PASSWORD $URL)
 
HOST_UP=$( echo -e "$PAGE" | grep "hostUP" ) 

if [[ "$HOST_UP" == "" ]]; then
  echo '${color6}DOWN'
else	
  echo '${color5}UP'
fi
