#!/usr/bin/env bash

while true; do
  out=$(amixer -M -c 1 get "Speaker Volume")
  
  L=$(echo "$out" | awk -F'[][]' '/Front Left:/  {gsub("%","",$2); print $2}')
  R=$(echo "$out" | awk -F'[][]' '/Front Right:/ {gsub("%","",$2); print $2}')

  echo "    $L  $R"

  sleep 0.5
done
