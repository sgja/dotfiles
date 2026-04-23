#!/usr/bin/env bash

# 1. Define the wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# 2. Generate a list for fuzzel with icon support
# Fuzzel dmenu mode accepts the format: "Display Name\0icon\x1f/path/to/image"
LIST=""
for file in "$WALLPAPER_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        LIST+="${filename}\0icon\x1f${file}\n"
    fi
done

SELECTION=$(printf "$LIST" | fuzzel --dmenu --prompt="󰸉 Select Wallpaper: ")

# 4. Apply the wallpaper if a selection was made
if [ -n "$SELECTION" ]; then
    swww img "$WALLPAPER_DIR/$SELECTION"
    echo "Wallpaper updated to: $SELECTION"
else
    echo "Selection cancelled."
    exit 1
fi
