#!/usr/bin/env bash

echo
echo " GIT COMMIT MESSAGE EDITOR"
echo

cd "$HOME/4arch"

read -p "~ ENTER NEW COMMIT MESSAGE: " mas
echo
git commit --amend -m "$mas"
echo
git push --force

echo
echo " GIT COMMIT MESSAGE EDITED AND FORCE-PUSHED!"
echo
