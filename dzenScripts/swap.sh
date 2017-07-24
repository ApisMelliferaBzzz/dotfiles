#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh
TOTALSWAP=$(swapon -s | gawk '{if (NR==2) {print $3}}')
USEDSWAP=$(swapon -s | gawk '{if (NR==2) {print $4}}')
SBAR=$(( $(echo "scale = 0; $USEDSWAP * 100 / $TOTALSWAP" | bc -l ) ))

eval echo $SBAR $GDBAR