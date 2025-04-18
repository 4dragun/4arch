#!/usr/bin/env bash
systemctl stop bluetooth
pkill blueman-applet
pkill blueman-tray
pkill blueman-manager
