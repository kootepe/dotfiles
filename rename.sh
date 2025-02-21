#!/bin/bash

# Usage: ./rename_files.sh <directory> <search_string> <replace_string>

DIRECTORY=$1
SEARCH_STRING=$2
REPLACE_STRING=$3

if [ -z "$DIRECTORY" ] || [ -z "$SEARCH_STRING" ] || [ -z "$REPLACE_STRING" ]; then
  echo "Usage: $0 <directory> <search_string> <replace_string>"
  exit 1
fi

# Iterate over files in the directory
for FILE in "$DIRECTORY"/*; do
  if [[ -f "$FILE" && "$FILE" == *"$SEARCH_STRING"* ]]; then
    NEW_NAME="${FILE//$SEARCH_STRING/$REPLACE_STRING}"
    mv "$FILE" "$NEW_NAME"
    echo "Renamed: $FILE -> $NEW_NAME"
  fi
done

echo "Done!"
