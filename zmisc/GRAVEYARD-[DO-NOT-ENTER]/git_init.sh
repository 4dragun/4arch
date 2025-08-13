#!/usr/bin/env bash

G="git config --global"

$G user.name 4
$G user.email 4
# $G credential.helper manager
$G credential.credentialStore cache
$G credential.cacheOptions "--timeout 1800"

echo -e "\n 󰊤 GIT initialised\n"
