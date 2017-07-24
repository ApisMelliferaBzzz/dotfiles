#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh

CHARGE=$(upower -d | gawk '{if (NR==23) {print $2}}')
if [[ $CHARGE = 'charging' ]]; then 
	  echo '^i('$PAT'/icons/bat_low_02.xbm)'
else
	echo '^i('$PAT'/icons/bat_full_02.xbm)'
fi
