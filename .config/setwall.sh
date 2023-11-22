#!/usr/bin/env bash
feh --bg-fill $(find "$HOME/.config/wallpapers" -type f | shuf -n 1)
