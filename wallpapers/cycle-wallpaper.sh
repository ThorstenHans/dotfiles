#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

# Collect valid wallpaper files (.jpg and .png only), sorted alphanumerically
wallpapers=($(find "$SCRIPT_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort))

# If no wallpapers found, exit
if [ ${#wallpapers[@]} -eq 0 ]; then
  echo "No wallpapers found in $SCRIPT_DIR"
  exit 1
fi

# Function to get current wallpaper for a screen index
get_current_wallpaper() {
  local screen_index=$1
  osascript -e "tell application \"System Events\" to get picture of desktop $screen_index"
}

# Function to set wallpaper for a screen index
set_wallpaper() {
  local screen_index=$1
  local wallpaper=$2
  osascript -e "tell application \"System Events\" to set picture of desktop $screen_index to \"$wallpaper\""
}

# Get number of screens/desktops
screen_count=$(osascript -e "tell application \"System Events\" to count of desktops")

# Loop through all screens and set next wallpaper
for ((i = 1; i <= screen_count; i++)); do
  current=$(get_current_wallpaper $i)

  # Find index of current wallpaper in the array
  next_index=0
  for j in "${!wallpapers[@]}"; do
    if [ "$current" = "${wallpapers[$j]}" ]; then
      next_index=$(((j + 1) % ${#wallpapers[@]}))
      break
    fi
  done

  next_wallpaper="${wallpapers[$next_index]}"
  set_wallpaper $i "$next_wallpaper"
done
