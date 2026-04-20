#!/bin/bash
# otun/actions.sh - Executes app launches and navigation

if [ -z "$1" ]; then
    echo "Usage: $0 <action> [target]"
    exit 1
fi

ACTION="$1"
TARGET="$2"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPS_FILE="$DIR/apps.json"

case "$ACTION" in
    open)
        if [ -z "$TARGET" ]; then
            exit 1
        fi

        # Look up the app package/activity in apps.json
        INTENT=$(jq -r ".\"$TARGET\"" "$APPS_FILE" 2>/dev/null)

        if [ "$INTENT" != "null" ] && [ -n "$INTENT" ]; then
            am start -n "$INTENT" >/dev/null 2>&1
            exit 0
        else
            # Try launching by package name if not in mappings (best effort)
            # am start -n ... not possible just with package, would use monkey
            # Here we just fail if it's not in the map to stick to rules
            exit 1
        fi
        ;;
    home)
        input keyevent 3
        exit 0
        ;;
    back)
        input keyevent 4
        exit 0
        ;;
    *)
        exit 1
        ;;
esac
