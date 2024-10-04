#!/bin/bash

# Check if `fd` is installed
if ! command -v fd &>/dev/null; then
  echo "'fd' is not installed. Please install it and try again."
  exit 1
fi

# Run `fd` to search for files based on user input (pass additional fd options if needed)
files=$(fd --max-depth 2 "$@")

# Check if any files were found
if [ -z "$files" ]; then
  echo "No files found."
  exit 1
fi

# Generate the key list (numbers 1-9, then a-z)
keys=({1..9} {a..z})

# Display the files with a key appended in front
declare -A file_map
key_index=0
echo "Choose a file to open in vim (press the corresponding key):"
while IFS= read -r file; do
  key="${keys[$key_index]}"
  echo "[$key] $file"
  file_map["$key"]="$file"
  key_index=$((key_index + 1))
done <<<"$files"

# Ask the user to select a file by key (no need to press enter)
echo -n "Press the key corresponding to the file you want to open: "

# Read a single character from the user
read -n 1 choice
echo

# Open the selected file in vim
if [ -n "${file_map[$choice]}" ]; then
  nvim "${file_map[$choice]}"
else
  echo "Invalid choice."
fi
