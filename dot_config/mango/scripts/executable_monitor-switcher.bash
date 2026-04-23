#!/bin/bash

OPTIONS='extend\nright\nleft'

selection=$(echo -en $OPTIONS | fuzzel --dmenu --prompt "🖥️ ")

echo $selection

case $selection in
  extend)
    wlr-randr --output HDMI-A-1 --preferred --left-of DP-2 --output DP-2 --mode 3440x1440@143.923004 --adaptive-sync enabled
    ;;
  left)
    wlr-randr --output HDMI-A-1 --preferred --left-of DP-2 --output DP-2 --off --mode 3440x1440@143.923004 --adaptive-sync enabled
    ;;
  right)
    wlr-randr --output HDMI-A-1 --preferred --off --left-of DP-2 --output DP-2 --mode 3440x1440@143.923004 --adaptive-sync enabled
    ;;
  *)
    echo "Invalid option"
    ;;
esac
