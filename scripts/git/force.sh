#!/usr/bin/env bash

echo -e "\n GIT COMMIT MESSAGE EDITOR\n"

cd "$HOME/4arch"
read -p "~ ENTER NEW COMMIT MESSAGE: " mas
echo; git commit --amend -m "$mas"
echo; git push --force

echo -e "\n GIT COMMIT MESSAGE EDITED AND FORCE-PUSHED!\n"
