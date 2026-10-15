#!/bin/bash

#https://mywiki.wooledge.org/BashGuide/TestsAndConditionals#Control_Operators_.28.26.26_and_.7C.7C.29

#edid-decode /sys/class/drm/card0-<HDMI-A-1|DP-2>/edid 2>/dev/null | awk -F': ' '/Display Product Name/ {gsub(/\047/, ""); print $2}' to find my model names
#xwinwrap -g 1920x810 -ov -ni -s -nf -- gifview -w WID ~/Gifs/mario.gif -a &

#this solution feels very prone to errors
#primary_output="$(xrandr --prop | awk '/ connected primary/ {print $1}')"
#secondary_output="$(xrandr --prop | awk '/ connected/ && !/primary/ {print $1}')"
#model_name=$(edid-decode "$file" 2>/dev/null | awk -F': ' '/Display Product Name/ {gsub(/\047/, ""); print $2}')

read -r primary_output PRIMARY_HZ ultrawide_output ULTRAWIDE_HZ < <(~/.local/bin/get_monitor_info.sh)
card_number=2
device_muted="Speaker"
gentoo-pipewire-launcher restart &
disown

if [ -z "$primary_output" ] || [ -z "$secondary_output" ]; then
  echo "Could not match both monitors" >&2
  exit 1
fi

xrandr --output "$primary_output" --primary --mode 1920x1080 --rate "$PRIMARY_HZ"
xrandr --output "$secondary_output" --mode 3440x1440 --rate "$ULTRAWIDE_HZ" --left-of "$primary_output"
amixer -c "$card_number" set "$device_muted" 0% mute
