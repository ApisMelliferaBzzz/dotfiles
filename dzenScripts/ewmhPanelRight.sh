#!/bin/sh
#sh .config/dzenScripts/ewmhPanel.sh | dzen2 -x 0 -y 0 -h 21 -w 1920 -ta l -fn 'Terminus:pixelsize=12' -bg '#333'
source /home/bee/.config/dzenScripts/vars.sh
get_bat() {
	$PAT/battery.sh
}
get_cpu() {
	$PAT/cpubar.sh
}
get_batIcon() {
	$PAT/batIcon.sh
}
get_mem() {
	$PAT/mem.sh
}
get_date() {
	$PAT/date.sh
}
get_net() {
	$PAT/internet.sh
}
while true; do
	# echo -en "^bg(#222)^pa(0;5) ^fg($IFG)^ib(0)^ca(1,mygtkmenu /home/bee/.i3/LaunchMenuTop)^i(/home/bee/.dzen/icons/arch_10x10.xbm) ^ca()"
	# echo -en "^pa(22;0)$(get_pager)" &
	# echo -en "^pa(207;4)^bg(#333)^fg($IFG)$(get_mpd) ^ca()^ca()^ca()^ca()" &
	echo -en "^pa(0;6)^bg($BGD)  ^fg($IFG)$(get_batIcon)" &
	echo -en "^pa(21;5)^bg($BGD) $(get_bat)   " &
	echo -en "^pa(146;6)^bg($BGD)^fg($IFG)^i("$PAT"/icons/mem.xbm) ^p(;-1)$(get_mem)   " &
	echo -en "^pa(279;6)^bg($BGD)^fg($IFG)^i("$PAT"/icons/cpu.xbm) ^p(;-1)$(get_cpu)" &
	echo -en "^pa(402;6)^bg($BGD) $(get_net)  "
	echo "^pa(428;4)^fg($FG)^bg($BGL)$(get_date)^pa(;0)^i($PAT/icons/tag.xpm) " #иконка - костыль для светлого фона после даты
	sleep 1
	# wait;
done
