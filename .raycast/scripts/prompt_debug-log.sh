#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Prompt - Debug Log
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
OUTPUT="<context>\n$CLIPBOARD\n</context>\n\n \
Analyze the following logs and help user debug. \
List your observations. \
Summarize your findings and suggest next steps."

# Set the output back to the clipboard
echo -e "$OUTPUT" | pbcopy

# Simulate the paste action (Cmd+V on macOS)
osascript -e 'tell application "System Events" to keystroke "v" using command down'

echo "Context tag and prompt added!"
