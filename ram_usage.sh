#!/bin/bash

# Get total memory
total_mem=$(free -m | grep Mem | awk '{print $2}')

# Get used memory
used_mem=$(free -m | grep Mem | awk '{print $3}')

# Get free memory
free_mem=$(free -m | grep Mem | awk '{print $4}')

# Calculate the percentage of used memory
used_percent=$(echo "scale=2; ($used_mem / $total_mem) * 100" | bc)

# Display the results
echo "$used_mem MB / $total_mem MB / $used_percent%"
# echo "Total Memory: $total_mem MB"
# echo "Used Memory: $used_mem MB"
# echo "Free Memory: $free_mem MB"
# echo "Memory Usage: $used_percent %"
