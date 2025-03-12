#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Prompt - Generate Code Flow 
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
Given the following code, generate a summary consisting of:
- High-Level Overview - Provide a concise summary of the purpose and functionality of the code.
- Overall Flow - Describe the sequence of operations and interactions within the code.
- Pseudocode Representation - Translate the code into human-readable pseudocode while preserving logical flow.

**Guidelines:**
- Focus on logical constructs, decision-making, loops, and function calls.
- Retain key details that affect the program's execution flow.
- Exclude boilerplate elements like variable declarations, client/service initialization, and other setup details unless they contribute to the logic.
- If applicable, mention dependencies, external API interactions, and any key assumptions the code makes.
- If applicable, mention input and output, whether it's a function input/output, or whether the program reads a file as input, or the program output processed data to a database.

**Example Output Structure:**
### High Level Overview
This code is doing something something something.

### Overall Flow
1. Initialization
- The program start by initializing myClass, loading configs...

2. Data Input Stage
- The program reads the file from `/etc/somefile`.
- Load into a spark rdd.

...

### Psuedocode

```psuedocode
// psuedocode here
```

<context>
$CLIPBOARD
</context>"

# Set the output back to the clipboard
echo -e "$OUTPUT" | pbcopy

# Simulate the paste action (Cmd+V on macOS)
osascript -e 'tell application "System Events" to keystroke "v" using command down'

echo "Done!"
