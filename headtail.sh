#!/bin/bash

# Define the number of lines to display from head and tail
HEAD_LINES=5
TAIL_LINES=5

# Check if user provided an argument
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file or glob pattern>"
  exit 1
fi

# Loop through each file matching the argument
for file in "$@"; do
  # Check if the file exists
  if [ -f "$file" ]; then
    echo "=== File: $file ==="

    # Print head of the file
    head -n $HEAD_LINES "$file"

    # Print tail of the file
    tail -n $TAIL_LINES "$file"

    echo ""
  else
    echo "File '$file' does not exist."
  fi
done
