compton & # -c -f -D 10 -O 0.065 -I 0.065 -l -16 -t -16 --backend glx  --shadow-exclude 'n:e:progress_bar' --shadow-exclude-reg 'x21+0+0' -f --inactive-dim "0.3" --focus-exclude "class_g = 'dzen'" --focus-exclude 'n:e:MPlayer' &
start-pulseaudio-x11 &
feh --bg-tile /home/bee/Media_storage/images/afterlife1080gauss1.png &
xsetroot -cursor_name left_ptr &
conky &
urxvtd &
rofi -key-run F2 -key-window F1 -color-enabled &
sudo mpd &
mpdscribble &
sh /home/bee/.config/dzenScripts/startup.sh
# feh --bg-tile /home/bee/Media_storage/images/bluewallpapersdark_v2.png &
#sh .xmonad/cos.sh | dzen2 -x '0' -y '1080' -h '21' -e 'onstart=lower' & #костыли-костылики, чтобы от тинта тень была
# tint2 &
#sh ~/.xmonad/mpd.sh | dzen2 -x '195' -h '21' -w '1044' -fn '-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*' -ta 'l' -bg '#303030' -fg '#333333' -y '0' -e 'onsstart=lower'&
#sh ~/.i3/progress_bar.sh | dzen2 -x '214' -w '1025' -h '3' -ta 'l' -bg '#333' -y '18' -title-name 'progress_bar' &
