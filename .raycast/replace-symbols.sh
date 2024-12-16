#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Replace Symbols with Spaces
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔄
# @raycast.packageName Text Utilities

# Documentation:
# @raycast.description This script replaces any "-" or "_" symbols in the selected text with spaces and pastes the modified text in place.

tell application "System Events"
    -- Copy the selected text
    keystroke "c" using {command down}
    delay 0.1 -- Allow some time for the clipboard to update
end tell

-- Get the clipboard content and replace "-" and "_" with spaces
set modifiedText to (the clipboard as text)
set modifiedText to do shell script "echo " & quoted form of modifiedText & " | sed 's/[-_]/ /g'"

-- Set the modified text back to the clipboard
set the clipboard to modifiedText

tell application "System Events"
    -- Paste the modified text
    keystroke "v" using {command down}
end tell

