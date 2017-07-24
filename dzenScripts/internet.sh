#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh

STATE=$(LC_ALL=C wicd-cli -i | awk NR\ ==\ 1\{print\ \$3\})
TYPE=$(LC_ALL=C wicd-cli -i | awk NR\ ==\ 2\{print\ \$3\})

if [[ $STATE = 'Not' ]]; then
	echo '^fg('$FG')^i('$PAT'/icons/net_no.xbm)';
else
	if [[ $TYPE = 'wireless' ]]; then
		echo '^fg('$FG')^i('$PAT'/icons/wifi_03.xbm)';
	elif [[ $TYPE = 'wired' ]]; then
		echo '^fg('$FG')^i('$PAT'/icons/net_wired.xbm)';
	elif [[ $TYPE = 'Wireless' ]]; then
		echo '^fg('$IFG')^i('$PAT'/icons/wifi_03.xbm)';
	else
		echo '^fg('$IFG')^i('$PAT'/icons/net_wired.xbm)';
	fi
fi
