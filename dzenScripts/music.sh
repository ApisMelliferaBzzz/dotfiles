#!/bin/sh
source ./vars.sh

if [ -n "$(pgrep mpd)" ]; then

	PAUSE=$(mpc -h "bucCelLati@0.0.0.0" | awk NR\ ==\ 2\{print\ \$1\})
	CURRENT=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
	CONTROLS=$(echo ' ^ca()^fg('$FG')^p(-6;-2)^ca(1,mpc -h "bucCelLati@0.0.0.0" toggle)^ca(4,mpc -h "bucCelLati@0.0.0.0" prev)^ca(5,mpc -h "bucCelLati@0.0.0.0" next)^ca(2,urxvt -e ncmpcpp)')

	if [[ $PAUSE = '[paused]' ]]; then
		ICON='pause'
	else
		ICON='note'
	fi
else
	CONTROLS=''
	CURRENT="^fg($FG)MPD server is not running"
fi

echo -en "^pa(224;2)^bg($BGL)^fg($IFG)^p(;2)^i(./icons/$ICON.xbm)$CONTROLS $CURRENT ^ca()^ca()^ca()^ca()^bg($BGL)"
