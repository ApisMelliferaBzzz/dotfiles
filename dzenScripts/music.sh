#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh

if [ -n "$(pgrep mpd)" ]; then

	PAUSE=$(mpc -h "bucCelLati@0.0.0.0" | awk NR\ ==\ 2\{print\ \$1\})
	CURRENT=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
	CONTROLS=$(echo '^ca()^fg('$FG')^p(;-2)^ca(1,mpc -h "bucCelLati@0.0.0.0" toggle)^ca(4,mpc -h "bucCelLati@0.0.0.0" prev)^ca(5,mpc -h "bucCelLati@0.0.0.0" next)^ca(2,urxvt -e ncmpcpp)')
	
	if [[ $PAUSE = '[paused]' ]]; then
		echo '^p(;2)^i('$PAT'/icons/pause.xbm)'$CONTROLS $CURRENT;
	else
	# IC="~/.i3/icons/note.xbm";
		echo '^p(;2)^i('$PAT'/icons/note.xbm)'$CONTROLS $CURRENT;
	fi
else
	echo '^fg('$FG')MPD server is not running'
fi

#LENGTH=$(echo "${#CURRENT} * 6" | bc -l)
#PERC=$(mpc -h "bucCelLati@0.0.0.0" | awk -F"(" 'NR == 2 {print $2}' | awk -F"%" '{print $1}')
# echo "^pa(1000;0)"
# eval echo "$PERC | gdbar -h '2' -w $LENGTH -fg '#256' -bg '#202020'"
