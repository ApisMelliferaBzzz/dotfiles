#!/bin/sh

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
for (( i = 1; i < $LENGHT; i++ )); do
	OCCUP[$(wmctrl -l | awk '{if (NR=='$i+1') {print $2}}')]=true
done

for (( i = 0; i <= 9; i++ )); do
	if [[ ${OCCUP[$i]} == true ]]; then
		if [[ $CURRENT == $i ]]; then
			# current + occupied
			echo -en "^ca(1,wmctrl -s " $i ")^i("$PAT"/icons/tag_curr_occup.xpm)^ca()"
		else
			# occupied
			echo -en "^ca(1,wmctrl -s " $i ")^i("$PAT"/icons/tag_occup.xpm)^ca()"
		fi
	else
		if [[ $CURRENT == $i ]]; then
			# current + not occupied
			echo -en "^ca(1,wmctrl -s " $i ")^i("$PAT"/icons/tag_curr.xpm)^ca()"
		else
			# not occupied
			echo -en "^ca(1,wmctrl -s " $i ")^i("$PAT"/icons/tag.xpm)^ca()"
		fi
	fi
done
