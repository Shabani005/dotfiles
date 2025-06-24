#!/bin/bash

# Get CPU temperature using lm_sensors (Tctl for AMD)
TEMP=$(sensors | grep 'Tctl:' | awk '{print $2}' | tr -d '+' | cut -d'.' -f1)

if [ -n "$TEMP" ]; then
    echo "${TEMP}"
else
    echo "CPU: N/A"
fi
