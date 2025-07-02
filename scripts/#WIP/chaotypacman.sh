#!/bin/bash

CONF="/etc/pacman.conf"
BACKUP="$CONF.bak"

# Backup first
sudo cp "$CONF" "$BACKUP"

awk '
  # When we see [options], add the candy right after
  $0 == "[options]" {
    print
    print "ILoveCandy"
    print "VerbosePkgLists"
    print "Color"
    next
  }

  # Remember we saw [multilib]
  $0 == "[multilib]" {
    in_multilib = 1
    print
    next
  }

  # When we see the include line after [multilib], add chaotic-aur after it
  in_multilib && /^Include =/ {
    print
    print ""                            # Blank line for spacing
    print "[chaotic-aur]"
    print "Include = /etc/pacman.d/chaotic-mirrorlist"
    in_multilib = 0                     # Done adding
    next
  }

  # Print everything else as-is
  { print }
' "$CONF" | sudo tee "$CONF" > /dev/null

echo "✅ Done! Backup saved as $BACKUP"

