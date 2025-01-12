#!/bin/bash

# Set source and target directories
source_dir="$HOME/dotfiles/config"
target_dir="$HOME/.config"

# Ensure the target directory exists
# mkdir -p "$target_dir"

# Loop through all directories in the source directory
for dir in "$source_dir"/*/; do
    # Get the base name of the directory
    base_name=$(basename "$dir")

    # Create the symbolic link in the target directory
    ln -sfn "$dir" "$target_dir/$base_name"

    echo "Linked $dir to $target_dir/$base_name"
done

echo "All directories in $source_dir have been linked to $target_dir."

