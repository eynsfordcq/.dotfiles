#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tool - JSON to One-Line
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🛠️

# Get the clipboard content
CLIPBOARD=$(pbpaste)

# Check if the clipboard is not empty
if [ -z "$CLIPBOARD" ]; then
  echo "Error: Clipboard is empty."
  exit 1
fi

# Trim spaces and convert JSON to a one-line string
OUTPUT=$(echo "$CLIPBOARD" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/\\n/g' -e 's/[[:space:]]\{1,\}/ /g')

# Set the output back to the clipboard
echo -n "$OUTPUT" | pbcopy
echo "JSON converted!"

