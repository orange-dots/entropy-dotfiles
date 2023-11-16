#!/bin/bash

__RUNNING__=$(/usr/bin/vboxmanage list runningvms | wc -l)

echo "$__RUNNING__"
