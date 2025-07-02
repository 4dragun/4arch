#!/usr/bin/env bash

cd ~/4arch

echo
echo " GIT COMMIT MESSAGE EDITOR"
echo
read -p "enter new commit message: " mas
git commit --amend -m "$mas"
git push --force

echo " GIT COMMIT EDITED and FORCE-PUSHED"
