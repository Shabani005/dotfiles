#!/bin/bash
# Get disk usage for root partition
read -r filesystem size used avail perc mount <<< \
  $(df -h / | awk 'NR==2 {print $1, $2, $3, $4, $5, $6}')

# Calculate free percentage (since df shows used %)
free_perc=$((100 - ${perc%\%}))

echo "$avail/$size, $free_perc% "
