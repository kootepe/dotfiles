#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <folder1> <folder2>"
  exit 1
fi

# Assign folders to variables
folder1=$1
folder2=$2

# Check if both arguments are directories
if [ ! -d "$folder1" ]; then
  echo "Error: $folder1 is not a directory."
  exit 1
fi

if [ ! -d "$folder2" ]; then
  echo "Error: $folder2 is not a directory."
  exit 1
fi

# Find and move files that are in folder1 but not in folder2
echo "Comparing files in $folder1 and $folder2..."
while IFS= read -r -d '' file; do
  # Remove folder1 prefix and get the relative path
  relative_path="${file#$folder1/}"
  target_file="$folder2/$relative_path"

  # Check if the file exists in folder2
  if [ ! -e "$target_file" ]; then
    echo "Moving: $relative_path"
    mkdir -p "$(dirname "$target_file")" # Create target directories if needed
    mv "$file" "$target_file"
  fi
done < <(find "$folder1" -type f -print0)

echo "File transfer complete!"
