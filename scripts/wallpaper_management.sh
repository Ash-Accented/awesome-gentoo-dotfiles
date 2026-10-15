#!/bin/bash

ARG=$1
PATH_WALLPAPERS="$HOME/.config/awesome/themes/default/wallpapers/"
#CURRENT_RESOLUTION="$(xdpyinfo | grep dimensions | awk '{print $2}')"
xwallpaper --center "$PATH_WALLPAPERS"sel_ref_"$ARG"* #AUTOCOMPLETES EXTENSION WITH ASTERICK AT END
