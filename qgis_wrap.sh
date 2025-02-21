#!/bin/bash
# Deactivate Conda environment if it's active
conda deactivate &
/usr/bin/qgis "$@"
