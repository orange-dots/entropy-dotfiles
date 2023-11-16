__OUTPUT=`grep -ir 'sync to ygritte finished' /var/log/syslog | tail -n 1 | cut -c1-16`
__LOGTIME=`grep -ir 'sync to ygritte finished' /var/log/syslog | tail -n 1 | awk '{print $NF}'`
__ACTTIME=`date +%s`
__DELTA=$((ACTTIME-LOGTIME))

if [ $__DELTA -gt 3600 ]; then
  echo "${color6}$__OUTPUT"
else
  echo "${color5}$__OUTPUT"
fi
