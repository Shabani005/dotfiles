#!/bin/bash

focused=""

while IFS= read -r line; do
    # Detect vdesk line
    if [[ $line =~ ^- ]]; then
        vdesk=$(echo "$line" | awk '{print $2}' | tr -d ':')
    fi
    # Detect Focused line
    if [[ $line =~ Focused:\ true ]]; then
        focused=$vdesk
        break
    fi
done < <(hyprctl printstate)

case "$focused" in
    1) echo "  " ;;
    2) echo "  " ;;
    3) echo "  " ;;
    *) echo "  " ;;
esac
