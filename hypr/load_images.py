#!/usr/bin/python3

# Cant guarantee this wont destroy your config file. should have a backup

import os
import subprocess

def main():
    # Get wallpapers stored in wallpaper directories
    wallpapers = [
        os.path.join("/home/terym/images/wallpaper", file)
        for file in os.listdir("/home/terym/images/wallpaper")
        if file.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif'))
    ]

    f = open("/home/terym/dotfiles/hypr/hyprpaper.conf", "r")

    preloadfree = []
    wallpaper = ""

    # Extract all lines that are not preloads
    for line in f:
        splits = line.split(' ', 10)
        if splits[0] == "preload":
            continue
        elif splits[0] == "wallpaper":
            splits[3] = wallpapers[0] + '\n'
            line = ' '.join(splits)

        preloadfree.append(line)

    f.close()

    print(preloadfree)
    print(wallpapers)

    # Open up config file to write new images
    fw = open("/home/terym/dotfiles/hypr/hyprpaper.conf", "w")

    for wallpaper in wallpapers:
        fw.write(f"preload = {wallpaper}\n")
        print(f"preload = {wallpaper}\n")

    for line in preloadfree:
        fw.write(line)
        print(line)

    fw.close()

    # Restart the hyprpaper service
    subprocess.run("systemctl --user restart hyprpaper", shell=True)

if __name__ == "__main__":
    main()
