#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Prompt - Summarize 
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋

# Get the clipboard content
CLIPBOARD=$(pbpaste)

# Check if the clipboard is not empty
if [ -z "$CLIPBOARD" ]; then
  echo "Error: Clipboard is empty."
  exit 1
fi

# Create the XML wrapped content
OUTPUT="
Summarize the following context in a concise and clear manner, 
focusing on the key points and main ideas. 
Avoid unnecessary details, but ensure that all essential information is captured.
<context>
$CLIPBOARD
</context>"

# Set the output back to the clipboard
echo -e "$OUTPUT" | pbcopy

# Simulate the paste action (Cmd+V on macOS)
osascript -e 'tell application "System Events" to keystroke "v" using command down'

echo "Done!"
