#!/bin/sh
#sh .config/dzenScripts/ewmhPanel.sh | dzen2 -x 0 -y 0 -h 21 -w 1920 -ta l -fn 'Terminus:pixelsize=12' -bg '#333'
source /home/bee/.config/dzenScripts/vars.sh
get_pager() {
	$PAT/ewmhPager.sh
}
get_progress() {
	if [ -n "$(pgrep mpd)" ]; then
		TITLE=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
		LENGTH=$(echo "${#TITLE} * 6" | bc -l)
		PERC=$(mpc -h "bucCelLati@0.0.0.0" | awk -F"(" 'NR == 2 {print $2}' | awk -F"%" '{print $1}')
		eval echo "$PERC | gdbar -h '2' -w '$LENGTH' -fg '$GFG' -bg '$BGD'"
	else
		eval echo "100 | gdbar -h '2' -w '1' -fg '$BGD' -bg '$BGD'"
	fi

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
	echo -en "^bg($BGD)^pa(0;0)^fg($IFG)^ib(0)^ca(1,mygtkmenu "$PAT"/LaunchMenuTop)^i("$PAT"/icons/arch_10x10_black.xpm)"
	echo -en $(get_pager)
	echo "^pa(245;0)^bg($BGL)^fg($IFG)$(get_progress)^bg($BGL)"
	# echo -en "^pa(1368;6)^bg(#222)  ^fg($IFG)$(get_batIcon) " &
	# echo -en "^pa(1394;5)^bg(#222)$(get_bat)   " &
	# echo -en "^pa(1512;6)^bg(#222)^fg($IFG)^i(/home/bee/.dzen/icons/mem.xbm) ^p(;-1)$(get_mem)   " &
	# echo -en "^pa(1644;6)^bg(#222)^fg($IFG)^i(/home/bee/.dzen/icons/cpu.xbm) ^p(;-1)$(get_cpu)  " &
	# echo "^pa(1770;4)^fg($FG)^bg(#333)$(get_date)"
#	echo -en "^pa(1352;6)^bg($BGD)  ^fg($IFG)$(get_batIcon)" &
#	echo -en "^pa(1372;5)^bg($BGD) $(get_bat)   " &
#	echo -en "^pa(1495;6)^bg($BGD)^fg($IFG)^i("$PAT"/icons/mem.xbm) ^p(;-1)$(get_mem)   " &
#	echo -en "^pa(1627;6)^bg($BGD)^fg($IFG)^i("$PAT"/icons/cpu.xbm) ^p(;-1)$(get_cpu) " &
#	echo -en "^pa(1747;6)^bg($BGD) $(get_net)  "
#	echo "^pa(1773;4)^fg($FG)^bg($BGL)$(get_date)^pa(;0)^i($PAT/icons/black/tag.xpm) " #иконка - костыль для светлого фона после даты
#	sleep 1
	sleep 0.1
	# wait;
done
