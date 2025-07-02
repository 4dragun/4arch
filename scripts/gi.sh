#!/usr/bin/env bash

gi="git config --global"

$gi user.name 4
$gi user.email 4
$gi credential.helper manager
$gi credential.credentialStore cache
