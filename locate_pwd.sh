#!/bin/bash

folder_path=$(pwd)

# Check if the folder exists
if [ $# -eq 1 ]; then
	found=$(find . -type f -iname "*$1*")
	# located=$(locate "$PWD*/*$1*")
	echo "$found"
else
	echo "Give string to look for."
fi
