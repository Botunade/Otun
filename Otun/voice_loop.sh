#!/bin/bash
# otun/voice_loop.sh - Captures voice input via Termux dialog

# Uses termux-dialog speech to get voice input.
# termux-dialog returns a JSON object, we need to extract the "text" field.
# Example output from termux-dialog speech: { "code": 0, "text": "hello" }

RESULT=$(termux-dialog speech)

# Check if termux-dialog was successful and extract text using jq
if [ -n "$RESULT" ]; then
    TEXT=$(echo "$RESULT" | jq -r '.text' 2>/dev/null)

    # Check if user cancelled or error occurred (text might be empty or null)
    if [ "$TEXT" != "null" ] && [ -n "$TEXT" ]; then
        echo "$TEXT"
        exit 0
    fi
fi

# Return empty if nothing was captured
echo ""
exit 1
