#!/bin/bash

__ALL__=$(/usr/bin/vboxmanage list vms | wc -l)

echo "$__ALL__"
