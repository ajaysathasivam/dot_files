#!/usr/bin/env bash

# Fuhynction to silently move a window to a workspace
hyprctl dispatch togglefloating 
hyprctl dispatch resizeactive exact 640 480
hyprctl dispatch centerwindow
