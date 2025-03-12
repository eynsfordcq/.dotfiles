#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title LLM - Generate Tags
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📋

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

# Get the clipboard content
CLIPBOARD=$(pbpaste)

# Check if the clipboard is not empty
if [ -z "$CLIPBOARD" ]; then
  echo "Error: Clipboard is empty."
  exit 1
fi

# Create the XML wrapped content
PROMPT="<context>
$CLIPBOARD
</context>
Analyze the above context and generate 2-5 tags that best describes its topic or domain. 
Example of tags include:
#backend, #aws, #devops, #network, #cloud, #data, or any other relevant category. 
Output the tags, separated by space without comma.
Output only the tags."

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