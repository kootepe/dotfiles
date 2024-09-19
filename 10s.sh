#!/bin/bash

source ~/.bashrc
# Read the command from standard input
read -r cmd

# Run the command in an infinite loop every 10 seconds
while true; do
  # Run the command
  eval "$cmd"

  # Wait for 10 seconds
  sleep 10
done
