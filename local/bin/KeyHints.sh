#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Keyhints. Idea got from Garuda Hyprland

# Detect monitor resolution and scale
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')

# Calculate width and height based on percentages and monitor resolution
width=$((x_mon * hypr_scale / 100))
height=$((y_mon * hypr_scale / 100))

# Set maximum width and height
max_width=1200
max_height=1000

# Set percentage of screen size for dynamic adjustment
percentage_width=70
percentage_height=70

# Calculate dynamic width and height
dynamic_width=$((width * percentage_width / 100))
dynamic_height=$((height * percentage_height / 100))

# Limit width and height to maximum values
dynamic_width=$(($dynamic_width > $max_width ? $max_width : $dynamic_width))
dynamic_height=$(($dynamic_height > $max_height ? $max_height : $dynamic_height))

# Launch yad with calculated width and height
yad --width=$dynamic_width --height=$dynamic_height \
    --center \
    --title="Keybindings" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
"ESC" "close this app" "" "=" "SUPER KEY (Windows Key)" "(SUPER KEY)" \
"" "" "" \
"" "APPLICATION" "" \
" enter" "Terminal" "(kitty)" \
" or  D" "App Launcher" "(Rofi)" \
" E" "Open File Manager" "(Thunar)" \
" B" "Open browser" "(Chromium/Firefox)" \
" Q" "Closes a specified window" "(Window)" \
" Shift W" "Choose wallpaper" "(Wallpaper menu)" \
"Print" "Screenshot" "(Grim)" \
" Shift Print" "Screenshot area select" "(Grim + Slurp)" \
" X" "Power-menu" "(Rofi powermenu)" \
" M" "Hyprland Exit" "(SAVE YOUR WORK!!!)" \
" L" "Lock" "Hyprlock" \
" Shift K" "Keybinds hint" "Keylist window" \
"" "" "" \
"" "WINDOW MANAGEMENT" "" \
" T" "Toggle opague" "Toggle window opague" \
" V" "Floating" "Toggles to floating window" \
" K" "Toggle Dwindle | Pseudo" "Hyprland Layout" \
" J" "Toggle split" "Window" \
" G" "Toggle group" "Toggle group window" \
" Left/Rght" "Change group active" "Group window" \
" l+r+u+d" "Move focus with mainMod + arrow keys" "Focus window" \
" 1-9" "Switch workspaces with mainMod + [0-9]" "Workspaces" \
" Shift 1-9" "Move active window to a workspace" "Workspaces" \
" Ctrl Down" "Move to the first empty workspace" "Workspaces" \
" Ctrl Alt R/L" "Move focused window to a relative workspace" "Workspaces" \
"Ctrl Alt R/L" "Change active workspace back and forth" "Workspaces" \



