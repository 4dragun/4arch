#!/usr/bin/env bash

echo
echo " GIT COMMIT AUTOMATION STARTED"
echo

cd "$HOME/4arch"

git add .
read -p "~ ENTER COMMIT MESSAGE: " mas
echo
git commit -m "$mas"
echo
git push origin main

echo
echo " GIT COMMIT AUTOMATION FINISHED"
echo
