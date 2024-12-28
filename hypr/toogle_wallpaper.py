#!/usr/bin/python3

import subprocess

def execute_command(command):
    try:
        # Run the command and capture the output
        result = subprocess.run(command, shell=True, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return result.stdout
    except subprocess.CalledProcessError as e:
        # Handle errors
        exit()

def main():

    wallpaper_array = execute_command("hyprctl hyprpaper listloaded")
    wallpaper_array = wallpaper_array.split('\n', 10)

    # Last element will be blank because so we can remove it
    wallpaper_array.pop()

    # For my laptop i only use eDP-1 monitor, i therefor extract the correct wallpaper for that monitor
    loaded_wallpaper = execute_command("hyprctl hyprpaper listactive").split(' ', 5)[2].strip()

    # Find index in array of currently loaded in wallpaper (enables us to load the next wallpaper)
    next_wallpaper_index = wallpaper_array.index(loaded_wallpaper) + 1
    if (next_wallpaper_index > len(wallpaper_array) - 1):
        next_wallpaper_index = 0

    # Set the new wallpaper
    command = f"hyprctl hyprpaper wallpaper 'eDP-1,{wallpaper_array[next_wallpaper_index]}'"
    execute_command(command)

if __name__ == "__main__":
    main()


