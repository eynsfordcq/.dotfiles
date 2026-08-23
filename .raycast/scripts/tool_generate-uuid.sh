#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tool - Generate UUID
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🆔
# @raycast.packageName Text Utilities

# Documentation:
# @raycast.description Generates a UUID, copies it to the clipboard, and shows it.

UUID=$(uuidgen | tr '[:upper:]' '[:lower:]')

echo -n "$UUID" | pbcopy
echo "$UUID"
