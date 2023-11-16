#!/bin/bash
if ping -c 3 -W 1 $1 > /dev/null; then
 echo "Up"
  else
  echo "Down"
fi
