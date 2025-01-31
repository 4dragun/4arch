#!/usr/bin/env bash

toilet="toilet -t --metal --font future"

cd ~/4arch
echo "GIT PULL SCRIPT STARTED" | $toilet
git pull origin main
echo "GIT PULL SCRIPT ENDED" | $toilet
