#!/bin/bash

# Opțiunile menajate special pentru tine
options="󰐥 Shutdown\n󰜉 Reboot\n󰤄 Suspend\n󰗽 Logout"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -config ~/.config/rofi/powerman.rasi)"

case $chosen in
    *Shutdown) poweroff ;;
    *Reboot) reboot ;;
    *Suspend) systemctl suspend ;;
    *Logout) hyprctl dispatch exit ;;
esac
