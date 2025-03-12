#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tool - Add Prompt Tag
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Tag", "optional": true }

# Check if a tag argument is provided
if [ -z "$1" ]; then
  TAG="code"
else
  TAG="$1"
fi

# Get the clipboard content
CLIPBOARD=$(pbpaste)

# Check if the clipboard is not empty
if [ -z "$CLIPBOARD" ]; then
  echo "Error: Clipboard is empty."
  exit 1
fi

# Create the XML wrapped content
OUTPUT="<$TAG>\n$CLIPBOARD\n</$TAG>"

# Set the output back to the clipboard
echo -e "$OUTPUT" | pbcopy
echo "Tag added!"

