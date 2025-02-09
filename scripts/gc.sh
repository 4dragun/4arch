#!/usr/bin/env bash

cd ~/4arch
echo "GIT COMMIT STARTED"
git add .
read -p "enter commit message: " msg
git commit -m "$msg"
git push origin main
echo "GIT COMMIT ENDED"
