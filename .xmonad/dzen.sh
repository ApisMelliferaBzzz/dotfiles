#!/bin/sh
#up down vol mem cpu batt temp
COST=1
GFG='#256'
IFG='#589'
GBD='#222'
GBG='#333'
GDBAR=' | gdbar -h "10" -w "100" -fg $GFG -bg $GBG '
# DOWN=0
# UP=0

if [ -z "$DOWN" ] || [ -z "$UP" ]; then
	DOWN=0
	UP=0
	echo $DOWN $UP
fi
#---FUNCTIONS
get_down() {
	# sleep 1;
	# DOWN2=$(cat /sys/class/net/enp3s0/statistics/rx_bytes)
	DOWN1=$(cat /sys/class/net/enp3s0/statistics/rx_bytes)
	RES=$(( $(echo "scale = 0; ($DOWN1 - $DOWN) / 1024" | bc -l) ))
	echo "DOWN=" $DOWN
	DOWN=$DOWN1
	echo $RES $DOWN
	# echo $DOWN $DOWN1
}
get_up() {
	# sleep 1;
	# UP2=$(cat /sys/class/net/enp3s0/statistics/tx_bytes)
	UP1=$(cat /sys/class/net/enp3s0/statistics/tx_bytes)
	RES=$(( $(echo "scale = 0; ($UP1 - $UP) / 1024" | bc -l) ))
	UP=$UP1
	# echo $RES
}
get_vol () {
  CURRENT=$(amixer get Master | awk '/Mono:/ {print $4}' | tr -d '[%]')
  MUTE_CHECK=$(amixer -c0 get Master | awk '/^  Mono/ { print $6 }')

  if [[ $MUTE_CHECK = '[off]' ]]; then
    GFG='#333'
    VBAR=$(( $(echo "scale = 0; $CURRENT" | bc -l) ))
  else
    VBAR=$(( $(echo "scale = 0; $CURRENT" | bc -l) ))
  fi

  eval echo $VBAR $GDBAR
}

get_vol_pcm () {
  MAX=$(amixer -M -c0 get PCM | awk '/^  Limits/ { print $5 }')
  CURRENT=$(amixer -M -c0 get PCM | awk '/^  Front\ Left:/ { print $5 }' | tr -d '[%]')
  MUTE_CHECK=$(amixer -c0 get Master | awk '/^  Mono/ { print $6 }')

  if [[ $MUTE_CHECK = '[off]' ]]; then
    GFG='#333'
    VBAR=$(( $(echo "scale = 0; $CURRENT" | bc -l) ))
  else
    VBAR=$(( $(echo "scale = 0; $CURRENT" | bc -l) ))
  fi

  eval echo $VBAR $GDBAR
}

get_vol_pulse () {
  VALUE=$(ponymix get-volume)

  eval echo $VALUE $GDBAR
}

get_bat_icon () {
  CHARGE=$(upower -d | gawk '{if (NR==23) {print $2}}')

  if [[ $CHARGE = 'charging' ]]; then 
    if [[ $COST = 1 ]]; then
      echo '^i(/home/bee/.dzen/icons/bat_full_02.xbm)'
    else
      echo '^i(/home/bee/.dzen/icons/bat_empty_02.xbm)'
    fi
  elif [[ $CHARGE = 'fully-charged' ]]; then
    echo '^i(/home/bee/.dzen/icons/bat_full_02.xbm)'
  else
    echo '^i(/home/bee/.dzen/icons/bat_empty_02.xbm)'
  fi
}

get_bat () {
  TOTALBAT=$(cat /sys/class/power_supply/BAT1/charge_full)
  USEDBAT=$(cat /sys/class/power_supply/BAT1/charge_now)
  BBAR=$(( $(echo "scale = 0; $USEDBAT * 100 / $TOTALBAT" | bc -l) ))

  if [[ BBAR -le 20 ]]; then
    GBG='#700'
  fi

  eval echo $BBAR $GDBAR
}

get_swap () {
  TOTALSWAP=$(swapon -s | gawk '{if (NR==2) {print $3}}')
  USEDSWAP=$(swapon -s | gawk '{if (NR==2) {print $4}}')
  SBAR=$(( $(echo "scale = 0; $USEDSWAP * 100 / $TOTALSWAP" | bc -l ) ))

  eval echo $SBAR $GDBAR
}

get_date () {
  echo "^fg(#888)$(date +' %a %x  %H:%M:%S') "
}

get_cpu () {
  gcpubar -c 5 -i 0.1 -fg $GFG -bg $GBG -h 10 -w 100 | tail -1
}

get_mem () {
  TOTALMEM=$(free | gawk '{if (NR==2) {print $2}}')
  USEDMEM=$(free | gawk '{if (NR==2) {print $3}}')
  MBAR=$(( $(echo "scale = 0; $USEDMEM * 100 / $TOTALMEM" | bc -l ) ))

  if [[ MBAR -ge 80 ]]; then
    GFG='#700'
  fi

  eval echo $MBAR $GDBAR
}

while true; do
	DOWN1=$(cat /sys/class/net/enp3s0/statistics/rx_bytes)
	RESDOWN=$(( $(echo "scale = 0; ($DOWN1 - $DOWN) / 1024" | bc -l) ))
	DOWN=$DOWN1

	UP1=$(cat /sys/class/net/enp3s0/statistics/tx_bytes)
	RESUP=$(( $(echo "scale = 0; ($UP1 - $UP) / 1024" | bc -l) ))
	UP=$UP1

	# echo "$(get_up)"
	echo " ^bg($BG)^p(-3;)^ca(1,sh ~/.i3/cards.sh)^fg($IFG) $(get_bat_icon)^ca() $(get_bat)  ^bg($GBD)^i(/home/bee/.dzen/icons/net_up01.xbm)^bg($BG) $RESDOWN   ^fg($IFG)^i(/home/bee/.dzen/icons/mem.xbm) $(get_mem)   ^fg($IFG)^i(/home/bee/.dzen/icons/diskette.xbm) $(get_vol_pulse)   ^fg($IFG)^i(/home/bee/.dzen/icons/cpu.xbm) $(get_cpu)  ^fg($FG)^bg(#333)^p(0;)$(get_date)"
  COST=$( echo "-1 * $COST" | bc -l )
  sleep 0.5
done
