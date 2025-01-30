#!/usr/bin/env bash

toilet="toilet -t --metal --font future"

cd ~/4end
echo "COMMIT SCRIPT STARTED" | $toilet
git add .
read -p "enter commit message: " msg
git commit -m "$msg"
git push origin main
echo "COMMIT SCRIPT FINISHED" | $toilet
