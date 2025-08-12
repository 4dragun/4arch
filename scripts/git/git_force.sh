#!/usr/bin/env bash

cd ~/4arch

echo -e "\n  GIT commit message editor ...\n"

read -p " Enter new commit message: " mas
echo
git commit --amend -m "$mas"
echo
git push --force

echo -e "\n  GIT commit message edited and FORCE-PUSHED ..!\n"
