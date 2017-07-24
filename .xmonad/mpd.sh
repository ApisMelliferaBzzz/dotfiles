#!/bin/sh
get_mpd() {
  PAUSE=$(mpc -h "bucCelLati@0.0.0.0" | awk NR\ ==\ 2\{print\ \$1\})
  CURRENT=$(mpc -h "bucCelLati@0.0.0.0" current -f '%artist% - %title% (%date% - %album%)')
  if [[ $PAUSE = '[paused]' ]]; then
	echo '^p(;2)^ca(1,sh /home/bee/.dzen/get_mpd_conrol.sh)^i(/home/bee/.i3/icons/pause.xbm)^ca()^fg(#888)^p(;-2)^ca(1,mpc -h "bucCelLati@0.0.0.0" toggle)^ca(4,mpc -h "bucCelLati@0.0.0.0" prev)^ca(5,mpc -h "bucCelLati@0.0.0.0" next)^ca(2,urxvt -e ncmpcpp)' $CURRENT;
  else
	# IC="~/.i3/icons/note.xbm";	
	echo '^p(;2)^ca(1,sh /home/bee/.dzen/get_mpd_conrol.sh)^i(/home/bee/.i3/icons/note.xbm)^ca()^fg(#888)^p(;-2)^ca(1,mpc -h "bucCelLati@0.0.0.0" toggle)^ca(4,mpc -h "bucCelLati@0.0.0.0" prev)^ca(5,mpc -h "bucCelLati@0.0.0.0" next)^ca(2,urxvt -e ncmpcpp)' $CURRENT;
  fi
}
while true; do
	echo "^bg(#222)^pa(4;3)^p(0;1)^fg(#589)^ib(0)^bg(#303030) $(get_mpd)^ca()^ca()^ca()^ca()                                                                                                                    "
#	echo -n "^bg(#222)^pa(4;3)^p(0;1)^fg(#589)^ib(0)^bg(#303030) $(get_mpd)^ca()^ca()^ca()^ca()"
	sleep 0.001
done
