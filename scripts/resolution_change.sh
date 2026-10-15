#!/bin/bash

RES_CHANGE=$1 #Take the first argument
read -r primary_output PRIMARY_HZ ultrawide_output ULTRAWIDE_HZ < <(~/.local/bin/get_monitor_info.sh)

primary_resolutions=("1920x1080" "1600x900" "1280x720")    #RES_CHANGE = 0, 1, ..., p_count - 1
ultrawide_resolutions=("3440x1440" "2560x1080" "1920x810") #RES_CHANGE = p_count, ... (total - 1)
p_count=${#primary_resolutions[@]}
u_count=${#ultrawide_resolutions[@]}
total=$((p_count + u_count))

output=""
native=""
target=""
rate=""

if ((RES_CHANGE >= p_count && RES_CHANGE < total)); then
  output="$ultrawide_output"
  native="${ultrawide_resolutions[0]}"
  target="${ultrawide_resolutions[RES_CHANGE - p_count]}"
  rate="$ULTRAWIDE_HZ"
elif ((RES_CHANGE >= 0 && RES_CHANGE < p_count)); then
  output="$primary_output"
  native="${primary_resolutions[0]}"
  target="${primary_resolutions[RES_CHANGE]}"
  rate="$PRIMARY_HZ"
else
  exit 1
fi

xrandr --output "$output" --mode "$native" --rate "$rate" --scale-from "$target"
notify-send --expire-time=8000 "Resolution Changed to" "$target"
