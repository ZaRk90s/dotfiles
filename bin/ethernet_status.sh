#!/bin/sh

echo "%{F#2495e7}󰈀 %{F#ffffff}$(/run/current-system/sw/bin/ifconfig ens160 | grep "inet " | awk '{print $2}')%{u-}"
