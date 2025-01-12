#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
ENV_NAME="solar_env"
REQUIREMENTS_FILE="requirements.txt"
SCRIPT_NAME="dl_solar.py"

# Step 1: Create a virtual environment
echo "Creating virtual environment..."
python3 -m venv $ENV_NAME

# Step 2: Activate the virtual environment
echo "Activating virtual environment..."
source $ENV_NAME/bin/activate

# Step 3: Install requirements
if [ -f "$REQUIREMENTS_FILE" ]; then
  echo "Installing dependencies from $REQUIREMENTS_FILE..."
  # pip install --upgrade pip
  pip install -r $REQUIREMENTS_FILE
else
  echo "No $REQUIREMENTS_FILE file found. Skipping dependency installation."
fi

# Step 4: Run the Python script
if [ -f "$SCRIPT_NAME" ]; then
  echo "Running $SCRIPT_NAME..."
  python $SCRIPT_NAME
else
  echo "No $SCRIPT_NAME file found. Exiting."
fi

# Step 5: Deactivate virtual environment
echo "Deactivating virtual environment..."
deactivate

echo "Done!"
