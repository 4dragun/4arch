#!/usr/bin/env bash

while ! amixer -M -c 1 set "PCM" 9%; do
  sleep 0.5
done

exit 0
