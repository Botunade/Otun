#!/bin/bash
# otun/agent.sh - Main Loop Controller

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# STATE: IDLE or ACTIVE
STATE="IDLE"

echo "Otun V2 started. Currently in IDLE state."
echo "Waiting for activation phrase..."

while true; do
    # Capture voice input
    INPUT=$("$DIR/voice_loop.sh")

    if [ -z "$INPUT" ]; then
        # No input captured or user cancelled, continue looping
        continue
    fi

    # Normalize input using intent_engine
    NORMALIZED=$("$DIR/intent_engine.sh" "$INPUT")

    echo "Heard: $NORMALIZED"

    if [ "$STATE" = "IDLE" ]; then
        # In IDLE state, we only listen for the activation phrase
        if [[ "$NORMALIZED" == *"activate otun"* ]]; then
            echo "Activation detected."
            "$DIR/tts.sh" "Yes Boss 😁"
            STATE="ACTIVE"
            echo "Entered ACTIVE state."
        fi

    elif [ "$STATE" = "ACTIVE" ]; then
        # In ACTIVE state, check for deactivation first
        if [[ "$NORMALIZED" == *"otun deactivate"* || "$NORMALIZED" == *"deactivate otun"* ]]; then
            echo "Deactivation detected."
            "$DIR/tts.sh" "Goodbye Boss"
            echo "Exiting."
            exit 0
        fi

        # Route to engine
        "$DIR/router.sh" "$NORMALIZED"
        ROUTE_STATUS=$?

        if [ $ROUTE_STATUS -eq 0 ]; then
            # Success response
            "$DIR/tts.sh" "Understood Boss"
        else
            # Failure response
            "$DIR/tts.sh" "I don't understand Boss"
        fi
    fi

    # Small delay to prevent tight CPU looping if things fail fast
    sleep 0.5
done
