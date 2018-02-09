#!/bin/sh
source ./vars.sh
get_pager() {
	./ewmhPager.sh
}
get_mpd() {
	./music.sh
}
while true; do
	echo -en "^bg($BGD)^pa(0;0)^fg($IFG)^ib(0)^ca(1,mygtkmenu ./LaunchMenuTop)^i(./icons/arch_10x10_black.xpm)"
	echo -en " ^ca()^pa(22;0)$(get_pager)"
	echo "^pa(207;4)^bg($BGL)^fg($IFG)$(get_mpd) ^ca()^ca()^ca()^ca()^bg($BGL)"
	sleep 0.1
done
