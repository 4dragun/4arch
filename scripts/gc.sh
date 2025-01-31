#!/usr/bin/env bash

toilet="toilet -t --metal --font pagga"

cd ~/4end
echo "GIT COMMIT STARTED" | $toilet
git add .
read -p "enter commit message: " msg
git commit -m "$msg"
git push origin main
echo "GIT COMMIT ENDED" | $toilet
