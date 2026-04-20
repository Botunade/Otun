#!/bin/bash
# otun/tts.sh - Handles text-to-speech responses

if [ -z "$1" ]; then
    echo "Usage: $0 'Text to speak'"
    exit 1
fi

TEXT="$1"

# Speak the text
termux-tts-speak "$TEXT"
