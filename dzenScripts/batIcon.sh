#!/bin/sh
#source ./vars.sh

CHARGE=$(upower -d | gawk '{if (NR==23) {print $2}}')
if [[ $CHARGE = 'charging' ]]; then 
	  echo '^i(./icons/bat_low_02.xbm)'
else
	echo '^i(./icons/bat_full_02.xbm)'
fi
