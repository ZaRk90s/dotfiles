#!/bin/sh

ip_address=$(cat /home/zark90s/.config/bin/target | awk '{print $1}')
machine_name=$(cat /home/zark90s/.config/bin/target | awk '{print $2}')
 
if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#e51d0b}󰯐 %{F#ffffff}$ip_address%{u-} - $machine_name"
else
    echo "%{F#e51d0b}󰯐 %{u-}%{F#ffffff} No target"
fi
