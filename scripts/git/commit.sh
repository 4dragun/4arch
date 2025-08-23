#!/usr/bin/env bash

echo -e "\n GIT COMMIT AUTOMATION STARTED\n"

cd "$HOME/4arch"
git add .
read -p "~ ENTER COMMIT MESSAGE: " mas
echo; git commit -m "$mas"
echo; git push origin main

echo -e "\n GIT COMMIT AUTOMATION FINISHED\n"
