#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title LLM - Help Me Reply
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋
# @raycast.argument1 { "type": "text", "placeholder": "Response", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": "Message", "optional": true }
# @raycast.argument3 { "type": "text", "placeholder": "Tone", "optional": true }

# source env file
[ -f $HOME/.env ] && source $HOME/.env

# Check if LLM_API_KEY is set
if [ -z "$LLM_API_KEY" ]; then
  echo "Error: LLM_API_KEY is not set."
  exit 1
fi

# Determine the MODEL to use
if [ -z "$MODEL" ]; then
  if [ -z "$LLM_GLOBAL_MODEL" ]; then
    echo "Error: Neither MODEL nor LLM_GLOBAL_MODEL is set."
    exit 1
  else
    MODEL="$LLM_GLOBAL_MODEL"
  fi
fi

# Set user's response
if [ -z "$1" ]; then
  RESP="none"
else
  RESP="$1"
fi

# Set message either from parameter or clipboard
if [ -z "$2" ]; then
  MSG=$(pbpaste)
  if [ -z "$MSG" ]; then
    echo "Error: Clipboard is empty."
    exit 1
  fi
else
  MSG="$2"
fi

# Set tone if provided
if [ -z "$3" ]; then
  TONE="casual"
else
  TONE="$3"
fi

# Create the prompt content
PROMPT="You are tasked to help users reply to messages.
The message to reply to:
<message>
$MSG
</message>
User's intended response:
<response>
$RESP
</response>
Use a $TONE tone. 
Keep message concise.
Output the response in text only."

# Build JSON payload safely using jq
json_payload=$(jq -n \
  --arg model $MODEL \
  --arg prompt "$PROMPT" \
  '{model: $model, messages: [{role: "user", content: $prompt}]}'
)

# Send the API request and capture the response
api_response=$(curl https://api.groq.com/openai/v1/chat/completions -s \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $LLM_API_KEY" \
  -d "$json_payload"
)

# Extract the assistant's reply
reply=$(echo "$api_response" | jq -r '.choices[0].message.content')

# Output the reply only
echo "$reply" | pbcopy
echo "Done! Reply copied to clipboard."