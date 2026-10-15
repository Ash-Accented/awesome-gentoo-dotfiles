#!/bin/bash
volume_increase=2000
card_number=2
device_name=$1
get_req_output=$2 #First argument passed, which returns either 0 or 1
amixer_output="$(amixer get -d "$device_name" | grep "%")"
volume_index=3
toggle_index=5

read -ra sentence <<<"$amixer_output"
case $get_req_output in
"toggle")
  amixer set -d "$device_name" toggle
  toggle_state="$(echo "$amixer_output" | awk -F' ' 'NR==1{print $7}')"
  notify-send "$toggle_state"
  ;;
"volume-up")
  amixer set -d "$device_name" "$volume_increase"+
  volume="$(echo "$amixer_output" | awk -F' ' 'NR==1{print $5}')"
  notify-send "$volume"
  ;;
"volume-down")
  amixer set -d "$device_name" "$volume_increase"-
  volume="$(echo "$amixer_output" | awk -F' ' 'NR==1{print $5}')"
  notify-send "$volume"
  ;;
esac
