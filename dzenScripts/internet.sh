#!/bin/sh
source ./vars.sh

STATE=$(LC_ALL=C wicd-cli -i | awk NR\ ==\ 1\{print\ \$3\})
TYPE=$(LC_ALL=C wicd-cli -i | awk NR\ ==\ 2\{print\ \$3\})
ID='#303030'

if [[ $STATE = 'Not' ]]; then
	echo '^fg('$FG')^i(./icons/net_no.xbm)';
else
	if [[ $TYPE = 'wireless' ]]; then
		echo '^fg('$ID')^i(./icons/wifi_03.xbm)';
	elif [[ $TYPE = 'wired' ]]; then
		echo '^fg('$ID')^i(./icons/net_wired.xbm)';
	elif [[ $TYPE = 'Wireless' ]]; then
		echo '^fg('$IFG')^i(./icons/wifi_03.xbm)';
	else
		echo '^fg('$IFG')^i(./icons/net_wired.xbm)';
	fi
fi
