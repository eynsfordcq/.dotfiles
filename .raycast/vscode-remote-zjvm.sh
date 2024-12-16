#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Remote in VS Code
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Tag", "optional": true }

# Documentation:
# @raycast.description open vscode and connect to remote host zjvm and goto dev folder

# Check if a tag argument is provided
if [ -z "$1" ]; then
  TAG="/home/globeoss/dev"
else
  TAG="$1"
fi

code --remote ssh-remote+goss-zjvm $TAG
echo $TAG

