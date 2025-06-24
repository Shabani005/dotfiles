#!/bin/bash

# Function to get the active workspace on the active monitor
get_active_workspace() {
    hyprctl activeworkspace -j | jq -r '.id'
}

# Function to get the active monitor name
get_active_monitor() {
    hyprctl monitors -j | jq -r '.[] | select(.focused) | .name'
}

# Define your monitor order (ensure these match your actual Hyprland monitor names)
MONITOR_M1="HDMI-A-1"  # This monitor now gets odd workspaces (1, 3, 5...)
MONITOR_M2="DP-2"      # This monitor now gets even workspaces (2, 4, 6...)

# Max number of groups you want to display (e.g., 3 groups for 1-6)
MAX_GROUPS=3 # Adjust as needed

# --- Main Logic ---

active_workspace=$(get_active_workspace)
active_monitor=$(get_active_monitor)

# Determine the current group based on the active workspace
current_group=0
if [[ "$active_monitor" == "$MONITOR_M1" ]]; then
    # If M1 (HDMI-A-1) is active, its workspace is odd: 1, 3, 5...
    # Group formula: (workspace + 1) / 2
    current_group=$(( (active_workspace + 1) / 2 ))
elif [[ "$active_monitor" == "$MONITOR_M2" ]]; then
    # If M2 (DP-2) is active, its workspace is even: 2, 4, 6...
    # Group formula: workspace / 2
    current_group=$(( active_workspace / 2 ))
fi

# Fallback: If no specific monitor is focused (e.g., a floating window),
# try to infer the group from the workspace number alone.
# This makes it more robust if the monitor focus isn't always clear.
if [ "$current_group" -eq 0 ] && [ "$active_workspace" -gt 0 ]; then
    if (( active_workspace % 2 != 0 )); then # Odd workspace -> M1's pattern
        current_group=$(( (active_workspace + 1) / 2 ))
    else # Even workspace -> M2's pattern
        current_group=$(( active_workspace / 2 ))
    fi
fi


# Build the JSON output for Waybar
output="["
for i in $(seq 1 $MAX_GROUPS); do
    is_active="false"
    # Ensure correct comparison: numeric for $i and $current_group
    if [[ "$i" -eq "$current_group" ]]; then
        is_active="true"
    fi

    # Add optional icons if desired (ensure you have a font with these glyphs)
    icon="" # Default icon
    if [[ "$is_active" == "true" ]]; then
        icon="" # Active icon
    fi

    output+="{
        \"id\": $i,
        \"name\": \"$i\",
        \"active\": $is_active,
        \"icon\": \"$icon\",
        \"on-click\": \"~/.local/scripts/switch_workspace_pair.sh $i\"
    }"
    if [[ "$i" -lt "$MAX_GROUPS" ]]; then
        output+=","
    fi
done
output+="]"

echo "$output"
