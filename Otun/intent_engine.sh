#!/data/data/com.termux/files/usr/bin/bash

INPUT="$1"

# VALID COMMANDS

if [[ "$INPUT" == *"open chrome"* ]] || [[ "$INPUT" == *"chrome"* ]]; then
    am start -n com.android.chrome/com.google.android.apps.chrome.Main >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"open whatsapp"* ]] || [[ "$INPUT" == *"whatsapp"* ]]; then
    am start -n com.whatsapp/com.whatsapp.HomeActivity >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"open telegram"* ]] || [[ "$INPUT" == *"telegram"* ]]; then
    am start -n org.telegram.messenger/org.telegram.ui.LaunchActivity >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"wifi"* ]]; then
    am start -a android.settings.WIFI_SETTINGS >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"bluetooth"* ]]; then
    am start -a android.settings.BLUETOOTH_SETTINGS >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"data"* ]]; then
    am start -a android.settings.DATA_ROAMING_SETTINGS >/dev/null 2>&1
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"home"* ]]; then
    input keyevent 3
    termux-tts-speak "Understood Boss"
    exit
fi

if [[ "$INPUT" == *"back"* ]]; then
    input keyevent 4
    termux-tts-speak "Understood Boss"
    exit
fi

# FALLBACK
termux-tts-speak "I don't understand Boss"
