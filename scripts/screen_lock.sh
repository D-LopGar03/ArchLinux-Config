#!/bin/zsh

wallpaper_dir="$HOME/.config/wallpapers/"

random_dir=$(find "$wallpaper_dir" -type d | shuf -n 1)

final_dir="$random_dir"

wallpaper=$(find "$final_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)

swaylock -f -i $wallpaper
