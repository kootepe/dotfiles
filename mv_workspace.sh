#!/bin/bash
for WS in 2 3 4 5; do
  swaymsg [workspace=$WS] move workspace to output HDMI-A-1
done
