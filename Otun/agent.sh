#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/Otun"
MODE="INACTIVE"

while true; do

    INPUT=$(bash $BASE/voice_loop.sh | tr '[:upper:]' '[:lower:]')

    # ACTIVATION
    if [[ "$INPUT" == *"activate agent"* ]]; then
        MODE="ACTIVE"
        termux-tts-speak "Yes Boss 😁"
        continue
    fi

    # DEACTIVATION
    if [[ "$INPUT" == *"deactivate agent"* ]]; then
        MODE="INACTIVE"
        termux-tts-speak "Yes Boss 😁"
        continue
    fi

    # Ignore if inactive
    if [[ "$MODE" == "INACTIVE" ]]; then
        continue
    fi

    # ACTIVE MODE → process commands
    bash $BASE/intent_engine.sh "$INPUT"

done
