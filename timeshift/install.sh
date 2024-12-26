#!/usr/bin/sh
# This script assumes the user is running on an arch system with systemd

# Innstall necesarry packages
sudo pacman -S --needed timehift cronie grub-btrfs

# Enable grub-btrfsd to work with Timeshift
# Replace grub-btrfsd --syslog /.snapshots with grub-btrfsd --syslog -t
sudo systemctl edit --full grub-btrfsd

