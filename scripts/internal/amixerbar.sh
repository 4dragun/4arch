#!/usr/bin/env bash

out=$(amixer -M -c 1 get "Speaker Volume")

# Extract percentage numbers without the % sign
L=$(echo "$out" | awk -F'[][]' '/Front Left:/  {gsub("%","",$2); print $2}')
R=$(echo "$out" | awk -F'[][]' '/Front Right:/ {gsub("%","",$2); print $2}')

echo "    $L  $R"
