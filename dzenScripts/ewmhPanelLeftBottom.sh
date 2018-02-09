#!/bin/sh
source ./vars.sh
get_pager() {
	./ewmhPager.sh
}
get_mpd() {
	./music.sh
}
get_launcher() {
	./launcher.sh
}
while true; do
echo -en $(get_launcher)
	echo -en $(get_pager)
	echo $(get_mpd)
	sleep 0.1
done
