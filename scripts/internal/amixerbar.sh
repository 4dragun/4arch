#!/usr/bin/env bash

while true; do
  out=$(amixer -M -c 1 get "Speaker Volume" 2>/dev/null)
  
  [[ -z "$out" ]] && echo " " && sleep 0.5 && continue
  
  L=$(awk -F'[][]' '/Front Left:/ {gsub("%","",$2); print $2}' <<< "$out")
  R=$(awk -F'[][]' '/Front Right:/ {gsub("%","",$2); print $2}' <<< "$out")
  
  echo "    $L  $R"
  sleep 0.5
done
