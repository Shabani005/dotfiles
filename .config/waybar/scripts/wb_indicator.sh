#!/bin/bash

active_ws=$(hyprctl monitors -j | jq -r '.[] | select(.name=="HDMI-A-1") | .activeWorkspace.id')

case "$active_ws" in
    1) echo 1 ;;
    3) echo 2 ;;
    5) echo 3 ;;
    *) echo "cannot detect" ;; # fallback
esac
