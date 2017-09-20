#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh
OCCUP=( false false false false false false false false false false )

# FIND CURRENT DESCTOP
for (( i = 0; i <= 9; i++ )); do
	if [[ $(wmctrl -d | awk '{if (NR=='$i+1') {print $2}}') == '*' ]]; then
		CURRENT=$i
		break
	fi
done

LENGHT=$(wmctrl -l | awk 'END{print NR}')
# FIND OCCUPIED DESCTOPS
for (( i = 1; i <= $LENGHT; i++ )); do
	OCCUP[$(wmctrl -l | awk '{if (NR=='$i') {print $2}}')]=true
done

# ICO = Icon Current Occupied
# INO = Icon NotCurrent Occupied
# ICN = Icon Current NotOcupied
# INN = Icon NotCurrent NotOccupied

echo -en " ^ca()^pa(22;)"

for (( i = 0; i <= 9; i++ )); do
	if [[ ${OCCUP[$i]} == true ]]; then
		if [[ $CURRENT == $i ]]; then
			# current + occupied
			echo -en "^ca(1,wmctrl -s  $i )$ICO^ca()"
			# echo -en "^ca(1,wmctrl -s " $i ")^i(/home/bee/.dzen/icons/tag_curr_occup.xpm)^ca()"
		else
			# occupied
			echo -en "^ca(1,wmctrl -s  $i )$INO^ca()"
		fi
	else
		if [[ $CURRENT == $i ]]; then
			# current + not occupied
			echo -en "^ca(1,wmctrl -s  $i )$ICN^ca()"
		else
			# not occupied
			echo -en "^ca(1,wmctrl -s  $i )$INN^ca()"
		fi
	fi
done
	# sleep 0.1
# done
