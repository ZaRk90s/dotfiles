#!/bin/sh
 
ip_address=$(/run/current-system/sw/bin/cat /home/zark90s/.config/polybar/scripts/target | awk '{print $1}')
machine_name=$(/run/current-system/sw/bin/cat /home/zark90s/.config/polybar/scripts/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#e51d0b}󰯐 %{F#ffffff}$ip_address%{u-} - $machine_name"
else
    echo "%{F#e51d0b}󰯐 %{u-}%{F#ffffff}No target"
fi
