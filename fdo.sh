#!/bin/bash

# Check if `fd` is installed
if ! command -v fd &>/dev/null; then
  echo "'fd' is not installed. Please install it and try again."
  exit 1
fi

# Run `fd` to search for files based on user input (pass additional fd options if needed)
files=$(fd "$@")

# Check if any files were found
if [ -z "$files" ]; then
  echo "No files found."
  exit 1
fi

# Display the files with a key appended in front
declare -A file_map
key=1
echo "Choose a file to open in vim:"
while IFS= read -r file; do
  echo "[$key] $file"
  file_map["$key"]="$file"
  key=$((key + 1))
done <<<"$files"

# Ask the user to select a file by key
echo -n "Enter the number of the file you want to open: "
read -r choice

# Open the selected file in vim
if [ -n "${file_map[$choice]}" ]; then
  vim "${file_map[$choice]}"
else
  echo "Invalid choice."
fi
