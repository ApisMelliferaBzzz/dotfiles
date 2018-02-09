#!/bin/sh
source ./vars.sh
gcpubar -c 5 -i 0.1 -fg $GFG -bg $GBG -h 10 -w 100 | tail -1
