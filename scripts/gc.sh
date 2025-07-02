#!/usr/bin/env bash

cd ~/4arch

echo && echo " GIT COMMIT STARTED"

git add .
echo && read -p "enter commit message: " mas
git commit -m "$mas"
git push origin main

echo && echo " GIT COMMIT ENDED" && echo
