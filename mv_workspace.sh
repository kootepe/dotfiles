#!/bin/bash
for WS in 1 2 3 4 5 6 7 8 9; do
  swaymsg [workspace=$WS] move workspace to output HDMI-A-1
done
