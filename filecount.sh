#!/bin/bash
# Specify the folder path (default is the current working directory)
folder_path=$(pwd)

# Check if the folder exists
# if [ -d "$folder_path" ]; then
# Count all files in the folder by default
# file_count=$(find "$folder_path" -maxdepth 1 -type f | wc -l)

if [ $# -eq 1 ]; then
	# If a parameter is provided, count files containing the specified string
	string_count=$(find "$folder_path" -type f -name "*$1*" | wc -l)
	echo "Filenames in $folder_path with '$1': $string_count"
else
	file_count=$(find "$folder_path" -type f | wc -l)
	echo "Number of files in $folder_path: $file_count"
fi
# else
# 	echo "Folder does not exist: $folder_path"
# fi
