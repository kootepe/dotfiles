#!/bin/bash

# Define the directory containing the CSV files
DIRECTORY=$(pwd)

# Loop through each CSV file in the directory
# for file in "$DIRECTORY"/*.data; do
for file in $(find $DIRECTORY -type f -regex '.*[0-9]\.data'); do
	echo "Processing $file"

	# Skip the first 7 rows, then print the first 20 rows of columns 50 to 53
	sed 's/\t/,/g' "$file" | awk 'NR > 8 && NR <= 27 { print $49, $50, $51, $52, $53 }' FS='\t' "$file"
	# awk 'NR > 8 && NR <= 27 { print $50, $51, $52, $53 }' FS='\t' "$file"
done
