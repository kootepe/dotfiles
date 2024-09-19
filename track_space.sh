#!/bin/bash
# while :; do
# 	du -sk .
# 	echo "Press [CTRL+C] to stop.."
# 	sleep 1
# done
#!/bin/bash

# Set the path to the folder you want to monitor
folder_path="."

# Initialize the variable to store the previous size
prev_size=$(du -s "$folder_path" | cut -f1)

# Infinite loop
while true; do
	# Wait for 1 second
	sleep 1

	# Get the current size of the folder
	current_size=$(du -s "$folder_path" | cut -f1)

	# Calculate the difference in size
	size_diff=$((current_size - prev_size))
	mb_size=$((current_size / 1024))

	# Display the difference in size
	echo "Current size = $mb_size Mb, Size difference: $size_diff KB"

	# Update the previous size for the next iteration
	prev_size=$current_size
done
