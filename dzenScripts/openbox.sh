#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh
get_pager() {
	$PAT/openboxPager.sh
}
get_mpd() {
	$PAT/music.sh
}
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
while true; do
	echo "^bg(#222)^pa(0;)^p(;) ^fg($IFG)^ib(0)^ca(1,mygtkmenu /home/bee/.i3/LaunchMenuTop)^i(/home/bee/.dzen/icons/arch_10x10.xbm) ^ca()$(get_pager)^bg(#333)  ^fg($IFG)^pa(;5)$(get_mpd) ^ca()^ca()^ca()^ca()^pa(1368;6)^bg(#222)  ^fg($IFG)$(get_batIcon) ^p(;-1)$(get_bat)   ^p(;1)^fg($IFG)^i(/home/bee/.dzen/icons/mem.xbm) ^p(;-1)$(get_mem)   ^p(;1)^fg($IFG)^i(/home/bee/.dzen/icons/cpu.xbm) ^p(;-1)$(get_cpu)  ^fg($FG)^bg(#333)^p(0;-1)$(get_date)"
done
