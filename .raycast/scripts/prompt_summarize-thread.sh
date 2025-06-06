#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Prompt - Carry on New Thread
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋

# Create the XML wrapped content
OUTPUT="
This chat is getting lengthy. Please provide a concise prompt I can use in a new chat that captures all the essential context from our current discussion.
Include any key technical details, decisions made, and next steps we were about to discuss.
"

# Set the output back to the clipboard
echo -e "$OUTPUT" | pbcopy

# Simulate the paste action (Cmd+V on macOS)
osascript -e 'tell application "System Events" to keystroke "v" using command down'

echo "Done!"
