#!/usr/bin/env bash

cd ~/4arch

echo -e "\n  GIT commit automation started ...\n"

git add .
read -p " Enter commit message: " mas
echo
git commit -m "$mas"
echo
git push origin main

echo -e "\n  GIT commit automation finished ...\n"
