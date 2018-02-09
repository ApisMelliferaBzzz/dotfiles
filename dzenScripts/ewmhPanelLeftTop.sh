#!/bin/sh
source ./vars.sh
get_pager() {
	./ewmhPager.sh
}
get_progress() {
	if [ -n "$(pgrep mpd)" ]; then
		TITLE=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
		LENGTH=$(echo "${#TITLE} * 6" | bc -l)
		PERC=$(mpc -h "bucCelLati@0.0.0.0" | awk -F"(" 'NR == 2 {print $2}' | awk -F"%" '{print $1}')
		eval echo "$PERC | gdbar -h '2' -w '$LENGTH' -fg '$GFG' -bg '$BGD'"
	else
		eval echo "100 | gdbar -h '2' -w '1' -fg '$BGD' -bg '$BGD'^ca()^ca()^ca()"
	fi

}
while true; do
	echo -en "^bg($BGD)^pa(0;0)^fg($IFG)^ib(0)^ca(1,mygtkmenu ./LaunchMenuTop)^i(./icons/arch_10x10_black_long.xpm)"
	echo -en $(get_pager)
	echo "^ca(1,mpc -h 'bucCelLati@0.0.0.0' toggle)^ca(4,mpc -h 'bucCelLati@0.0.0.0 prev)^ca(5,mpc -h 'bucCelLati@0.0.0.0' next)^pa(237;0)^bg($BGL)^fg($IFG)$(get_progress)^bg($BGL)"
	sleep 0.1
done
