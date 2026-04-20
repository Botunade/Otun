#!/bin/bash
# otun/settings.sh - Executes settings intents

if [ -z "$1" ]; then
    echo "Usage: $0 <setting>"
    exit 1
fi

SETTING="$1"

case "$SETTING" in
    wifi)
        am start -a android.settings.WIFI_SETTINGS >/dev/null 2>&1
        exit 0
        ;;
    bluetooth)
        am start -a android.settings.BLUETOOTH_SETTINGS >/dev/null 2>&1
        exit 0
        ;;
    data)
        # Mobile data settings
        am start -a android.settings.DATA_ROAMING_SETTINGS >/dev/null 2>&1
        exit 0
        ;;
    *)
        exit 1
        ;;
esac
