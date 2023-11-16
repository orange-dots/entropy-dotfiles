#cgi-bin/nagios3/!/bin/bash
#
# Written by Dieter Plaetinck
# Updated by Bernhard Brunner: output for conky
#
# Licensed under the GPL V3
# See gnu.org/licenses/gpl-3.0.html
#
# works for Nagios 2.x or nagios 3.x
URL=http://212.7.139.19/cgi-bin/nagios3/tac.cgi
USERNAME=hraasch
PASSWORD=hei1915!

#curl -s -k -u hraasch:hei1915! http://212.7.139.19/cgi-bin/nagios3/extinfo.cgi?type=1&host=server05.fusion-network.de
#curl -s -k -u hraasch:hei1915! http://212.7.129.19/cgi-bin/tac.cgi
PAGE=$(curl -s -k -u $USERNAME:$PASSWORD $URL)
#echo $PAGE
 
HOSTS_DOWN=$( echo -e "$PAGE" | grep "hoststatustypes=4' class='hostHeader'" | awk '{print $5}' | cut -c 20-)
HOSTS_UNREACHABLE=$( echo -e "$PAGE" | grep "hoststatustypes=8' class='hostHeader'" | awk '{print $5}' | cut -c 20-)
HOSTS_UP=$( echo -e "$PAGE" | grep "hoststatustypes=2' class='hostHeader'" | awk '{print $5}' | cut -c 20-)
HOSTS_PENDING=$( echo -e "$PAGE" | grep "hoststatustypes=1' class='hostHeader'" | awk '{print $5}' | cut -c 20-)
 
SERVICES_CRIT=$( echo -e "$PAGE" | grep "servicestatustypes=16' class='serviceHeader'" | awk '{print $5}' | cut -c 23-)
SERVICES_WARN=$( echo -e "$PAGE" | grep "servicestatustypes=4' class='serviceHeader'" | awk '{print $5}' | cut -c 23-)
SERVICES_UNKNOWN=$( echo -e "$PAGE" | grep "servicestatustypes=8' class='serviceHeader'" | awk '{print $5}' | cut -c 23-)
SERVICES_OK=$( echo -e "$PAGE" | grep "servicestatustypes=2' class='serviceHeader'" | awk '{print $5}' | cut -c 23-)
SERVICES_PENDING=$( echo -e "$PAGE" | grep "servicestatustypes=1' class='serviceHeader'" | awk '{print $5}' | cut -c 23-)

echo "[ Hosts ]\${alignr}${color3}Down: \${color6}$HOSTS_DOWN \${color3}| Up: \${color5}$HOSTS_UP \${color3}| Pending: \${color4}$HOSTS_PENDING\${color3}"
echo "\${offset 15}[ Services ]\${alignr}${color3}Ok: \${color5}$SERVICES_OK \${color3}| Warn: \${color4}$SERVICES_WARN \${color3}| Crit: \${color6}$SERVICES_CRIT \${color3}| Unkown: \${color4}$SERVICES_UNKNOWN"

#if [[ "$HOSTS_DOWN" == "" ]]
#then
#  echo '${font Radio Space:size=13}${color red}Nagios:DOWN${color}${font}'
#else	
#  if [[ $(($HOSTS_DOWN + $SERVICES_CRIT)) > 0 ]]
#  then
#    echo '${font Radio Space:size=13}${color red}Nagios:ERROR${color}${font}'
#  else
#    if [[ $SERVICES_WARN > 0 ]]
#    then
#      echo '${font Radio Space:size=12}${color orange}Nagios:Warn${color}${font}'
#    else
#      echo '${font Radio Space:size=11}${color }Nagios:OK${color}${font}'
#    fi
#  fi
#fi
