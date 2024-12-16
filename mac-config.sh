#!/bin/bash

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
defaults write -g com.apple.mouse.linear -string "1"    # disable pointer acceleration

# keyboard shortcuts
# spotlight search, finder search window
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{ enabled = 0; }"
# map show launchpad to opt+space
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 160 '{ enabled = 1; value = { parameters = (32, 49, 524288); type = "standard"; }; }'
# map "copy picture of selected area to clipboard" to shift + cmd + S
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 31 '{ enabled = 1; value = { parameters = (115, 1, 1179648); type = "standard"; }; }'

# raycast 
# raycast launch key
defaults write com.raycast.macos raycastGlobalHotkey -string "Command-49"