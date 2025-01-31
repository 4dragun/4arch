#!/usr/bin/env bash

gity="git config --global"

$gity user.name 4
$gity user.email 4
$gity credential.helper manager
$gity credential.credentialStore cache
