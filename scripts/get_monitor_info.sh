#!/bin/bash
ULTRAWIDE_MONITOR="LS34A650U"
ULTRAWIDE_HZ=100
PRIMARY_MONITOR="LG FHD"
PRIMARY_HZ=120

primary_output=""
ultrawide_output=""
for out in $(xrandr | awk '/ connected/ {print $1}'); do
  hex=$(xrandr --prop | awk -v out="$out" '
    $1 == out  { f = 1; next }
    /^[A-Za-z]/ { f = 0 }
    f && /^[ \t]+[0-9a-f]{32}[ \t]*$/ { gsub(/[ \t\r]/, ""); printf "%s", $0 }')                                           #xrandr --prop formats output so that everything belonging to a port is indented with tabs or spaces, so we can turn off the flag f when we encounter any letter at column 0
  name=$(xxd -r -p <<<"$hex" | edid-decode 2>/dev/null | awk -F': ' '/Display Product Name/ {gsub(/\047/, ""); print $2}') #note that 047 is the octal escape for a single quote (since the Display Product Name outputs with single quotes idk kind of weird tbh, i just used gsub to get rid of them)
  case "$name" in
  "$PRIMARY_MONITOR")
    primary_output="$out"
    ;;
  "$ULTRAWIDE_MONITOR")
    ultrawide_output="$out"
    ;;
  esac
done

if [ -z "$primary_output" ] || [ -z "$ultrawide_output" ]; then
  echo "Could not match both monitors" >&2
  exit 1
fi

echo "$primary_output $PRIMARY_HZ $ultrawide_output $ULTRAWIDE_HZ"
