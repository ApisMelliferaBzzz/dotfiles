#!/bin/sh
source ./vars.sh
CHARGE=$(upower -d | gawk '{if (NR==23) {print $2}}')

# if [[ $CHARGE = 'charging' ]]; then 
	# if [[ $COST = 1 ]]; then
	  # echo '^i(/home/bee/.dzen/icons/bat_full_02.xbm)'
	  # $COST = 0
	# else
	  # echo '^i(/home/bee/.dzen/icons/bat_empty_02.xbm)'
	# fi
	# elif [[ $CHARGE = 'fully-charged' ]]; then
		# echo '^i(/home/bee/.dzen/icons/bat_full_02.xbm)'
	# else
		# echo '^i(/home/bee/.dzen/icons/bat_empty_02.xbm)'
# fi

TOTALBAT=$(cat /sys/class/power_supply/BAT1/charge_full)
USEDBAT=$(cat /sys/class/power_supply/BAT1/charge_now)
BBAR=$(( $(echo "scale = 0; $USEDBAT * 100 / $TOTALBAT" | bc -l) ))

if [[ $BBAR -le 20 ]]; then
	GBG='#700'
fi

eval echo $BBAR $GDBAR
