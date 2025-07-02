#!/usr/bin/env bash

cd ~/4arch

echo
echo " GIT COMMIT STARTED"
echo

git add .
read -p "enter commit message: " mas
git commit -m "$mas"
git push origin main

echo " GIT COMMIT ENDED"
