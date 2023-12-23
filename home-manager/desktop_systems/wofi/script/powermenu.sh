#!/usr/bin/env bash

pkill wofi || {
menu=$( echo -e " Poweroff\n󰑓 Reboot\n Lock\n󰗽 Logout" | wofi -i -b -p powermenu --dmenu --line=5 --style=${HOME}/.config/wofi/powermenu.css --conf=${HOME}/.config/wofi/powermenu.config | awk '{print tolower($2)}' )

case $menu in 
        poweroff)
                poweroff
                ;;
        reboot)
                reboot
                ;;
        lock)
            	env LANG=en.US_UTF-8 swaylock -f
                ;;
        logout)
                swaymsg exit
                ;;
esac
}
