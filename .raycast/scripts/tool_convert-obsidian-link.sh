#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Convert Obsidian Image Link
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋

# Function to percent-encode a string
percent_encode() {
  echo -n "$1" | perl -pe 's/([^a-zA-Z0-9_.-])/sprintf("%%%02X", ord($1))/ge'
}

# Get the selected text using AppleScript
SELECTED_TEXT=$(osascript -e 'tell application "System Events" to keystroke "c" using {command down}' -e 'delay 0.1' -e 'the clipboard as text')

# Check if the selected text matches the pattern
if [[ $SELECTED_TEXT =~ ^\!\[\[Pasted\ image\ ([0-9]+)\.png\]\]$ ]]; then
  FILENAME="Pasted image ${BASH_REMATCH[1]}.png"
  ENCODED_FILENAME=$(percent_encode "$FILENAME")
  NEW_LINK="![alt text](attachments/$ENCODED_FILENAME)"
  
  echo -n "$NEW_LINK" | pbcopy
  osascript -e 'tell application "System Events" to keystroke "v" using command down'
  echo "Converted and pasted!"
else
  echo "Error: Selected text does not match the expected pattern."
  exit 1
fi
