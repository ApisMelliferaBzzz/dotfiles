#!/bin/sh
get_cpu() {
	/home/bee/.config/dzenScripts/cpubar.sh
  # gcpubar -c 5 -i 0.1 -fg $GFG -bg $GBG -h 10 -w 100 | tail -1
}
get_bat() {
	/home/bee/.config/dzenScripts/battery.sh
}
while true; do
	echo "^pa(10;)^p(;)^ib(0)$(get_cpu) ^pa(;100)$(get_bat)"
done