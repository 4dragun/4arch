#!/usr/bin/env bash

D="dbus-run-session gsettings set org.gnome.desktop.interface"

$D gtk-theme 'adw-gtk3-dark'
$D icon-theme 'matutela'
$D font-name 'Rubik 12'
