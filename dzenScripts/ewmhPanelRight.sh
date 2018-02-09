#!/bin/sh
source ./vars.sh
get_bat() {
	./battery.sh
}
get_cpu() {
	./cpubar.sh
}
get_batIcon() {
	./batIcon.sh
}
get_mem() {
	./mem.sh
}
get_date() {
	./date.sh
}
get_vol() {
	./volume.sh
}
get_net() {
	./internet.sh
}
while true; do
	echo -en "^pa(0;6)^bg($BGD)  ^fg($IFG)$(get_vol)^ca()^ca()"
	echo -en "^pa(146;6)^bg($BGD)^fg($IFG)^i(./icons/mem.xbm) ^p(;-1)$(get_mem)   "
	echo -en "^pa(279;6)^bg($BGD)^fg($IFG)^i(./icons/cpu.xbm) ^p(;-1)$(get_cpu)"
	echo -en "^pa(402;6)^bg($BGD) $(get_net)  "
	echo "^pa(428;4)^fg($FG)^bg($BGL)$(get_date)^pa(;0)^i(./icons/black/tag.xpm) " #иконка - костыль для светлого фона после даты
	sleep 1
done
