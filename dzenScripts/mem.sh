#!/bin/sh
source ./vars.sh
TOTALMEM=$(free | gawk '{if (NR==2) {print $2}}')
USEDMEM=$(free | gawk '{if (NR==2) {print $3}}')
MBAR=$(( $(echo "scale = 0; $USEDMEM * 100 / $TOTALMEM" | bc -l ) ))

if [[ $MBAR -ge 80 ]]; then
	GFG='#700'
fi

eval echo $MBAR $GDBAR
