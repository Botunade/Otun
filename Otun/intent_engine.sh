#!/bin/bash
# otun/intent_engine.sh - Normalizes input text

if [ -z "$1" ]; then
    echo ""
    exit 1
fi

INPUT="$1"

# Convert to lowercase
NORMALIZED=$(echo "$INPUT" | tr '[:upper:]' '[:lower:]')

# Trim leading and trailing spaces (using sed)
NORMALIZED=$(echo "$NORMALIZED" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# Remove noise words (like "please", "can you", "could you", "the")
NORMALIZED=$(echo "$NORMALIZED" | sed -E 's/\b(please|can you|could you|the|open up|go to)\b//g')

# Clean up any resulting double spaces or new edge spaces
NORMALIZED=$(echo "$NORMALIZED" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' -e 's/[[:space:]]\+/ /g')

echo "$NORMALIZED"
exit 0
