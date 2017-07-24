#!/bin/sh
#sh .config/dzenScripts/ewmhPanel.sh | dzen2 -x 0 -y 0 -h 21 -w 1920 -ta l -fn 'Terminus:pixelsize=12' -bg '#333'
source /home/bee/.config/dzenScripts/vars.sh
get_pager() {
	$PAT/ewmhPager.sh
}
get_mpd() {
	$PAT/music.sh
}
# get_bat() {
# 	/home/bee/.config/dzenScripts/battery.sh
# }
# get_cpu() {
# 	/home/bee/.config/dzenScripts/cpubar.sh
# }
# get_batIcon() {
# 	/home/bee/.config/dzenScripts/batIcon.sh
# }
# get_mem() {
# 	/home/bee/.config/dzenScripts/mem.sh
# }
# get_date() {
# 	/home/bee/.config/dzenScripts/date.sh
# }
while true; do
	echo "^bg($BGD)^pa(0;5) ^fg($IFG)^ib(0)^ca(1,mygtkmenu "$PAT"/LaunchMenuTop)^i("$PAT"/icons/arch_10x10.xbm) ^ca()^pa(22;0)$(get_pager)^pa(207;4)^bg($BGL)^fg($IFG)$(get_mpd) ^ca()^ca()^ca()^ca()^bg($BGL)"
	# echo -en "^pa(1368;6)^bg(#222)  ^fg($IFG)$(get_batIcon) " &
	# echo -en "^pa(1394;5)^bg(#222)$(get_bat)   " &
	# echo -en "^pa(1512;6)^bg(#222)^fg($IFG)^i(/home/bee/.dzen/icons/mem.xbm) ^p(;-1)$(get_mem)   " &
	# echo -en "^pa(1644;6)^bg(#222)^fg($IFG)^i(/home/bee/.dzen/icons/cpu.xbm) ^p(;-1)$(get_cpu)  " &
	# echo "^pa(1770;4)^fg($FG)^bg(#333)$(get_date)"
	sleep 0.1
	# wait;
done
