#!/bin/sh
source ./vars.sh
get_mpd_control() {
	if [ -n "$(pgrep mpd)" ]; then
		TITLE=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
		LENGTH=$(echo "${#TITLE} * 6" | bc -l)
		PERC=$(mpc -h "bucCelLati@0.0.0.0" | awk -F"(" 'NR == 2 {print $2}' | awk -F"%" '{print $1}')
		eval echo "$PERC | gdbar -h '2' -w '$LENGTH' -fg '$GFG' -bg '$BGD'"
	else
		eval echo "100 | gdbar -h '2' -w '1' -fg '$BGD' -bg '$BGD'"
	fi
}

while true; do
	echo "^bg($BGL)$(get_mpd_control)"
	sleep 1
done
