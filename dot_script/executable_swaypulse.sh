#!/usr/bin/env bash

# a script to choose pulseaudio default sink and source via wofi/pamixer/pactl, on wlroots-based compositor session.
# requirement: bash, wofi, pamixer, pactl (you may also use other wofi alternatives: eg. rofi, dmenu)

#sinklist=$(pamixer --list-sinks | grep output | awk -F\" '{print $2}' | tr ' ' '\n')
#sinknamelist=$(pamixer --list-sinks | grep output | awk -F\" '{print $4}')

setdefault () {
  menu=$(pamixer --list-$1s | grep -e $2 -e $1 -e "Headset" -e "WebCam" -e "Microphone" | grep -v "monitor" | awk -F\" '{print $4}' | wofi -i -b -p $1-list --dmenu --width 1000 --lines=5 --style=${HOME}/.config/wofi/powermenu.css --conf=${HOME}/.config/wofi/powermenu.conf) &&
    id=$(pamixer --list-$1s | grep -v "monitor" | grep -e "${menu}" | awk -F\" '{print $1}')
    pactl set-default-$1 "${id}"
}

pref=$(echo -e "input \noutput ﰝ" | wofi -i -b -p in/out --dmenu --width 300 --lines=2 --style=${HOME}/.config/wofi/powermenu.css --conf={$HOME}/.config/wofi/powermenu.conf | awk '{print tolower($1)}' )&&
  echo $pref
  case $pref in
    input)
      setdefault "source" "input"
      ;; 
    output)
      setdefault "sink" "output"
      ;;

esac