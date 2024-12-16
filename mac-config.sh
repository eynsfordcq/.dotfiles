#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# home and end behavior like windows
KEYBINDING_FILE="$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
if [ ! -f "$KEYBINDING_FILE" ]; then
    mkdir -p $HOME/Library/KeyBindings
    echo '{
    "\UF729" = "moveToBeginningOfLine:"; /* Home */
    "\UF72B" = "moveToEndOfLine:"; /* End */
    "$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
    "$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
    }' > "$KEYBINDING_FILE"
fi

# keyboard
defaults write -g KeyRepeat -int 2          # key repeat rate
defaults write -g InitialKeyRepeat -int 15  # delay until repeat

# mouse
defaults write -g com.apple.mouse.scaling -float 1      # tracking speed
defaults write -g com.apple.mouse.linear -bool true    # disable pointer acceleration

# finder
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true