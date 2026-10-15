#!/bin/bash
ARG_ONE=$1
BATTERY_LIFE="$(bluetoothctl info | grep Battery | awk -F' ' '{gsub(/[()]/, ""); print $4 "%"}')"
NAME="$(bluetoothctl info | grep Name: | awk -F' ' '{print $2 " BATTERY: "}')"

case $ARG_ONE in
0)
  notify-send "$NAME$BATTERY_LIFE"
  ;;
1)

  BT_DEVICE_MAC="$(cat "$HOME/.config/bluetooth/bt_headphones" 2>/dev/null)"
  [ -n "$BT_DEVICE_MAC" ] || {
    notify-send "Bluetooth" "No device set in ~/.config/bluetooth/bt_headphones"
    exit 1
  }

  bluetoothctl connect "$BT_DEVICE_MAC" | xargs -I{} notify-send "THE BLUETOOTH DEVICE IS READY TO PAIR..." "{}"
  ;;

esac
