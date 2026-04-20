#!/bin/bash
# otun/router.sh - Decides where to route the command

if [ -z "$1" ]; then
    exit 1
fi

COMMAND="$1"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Route logic
case "$COMMAND" in
    # APP CONTROL
    "open chrome"|"chrome")
        "$DIR/actions.sh" open chrome
        exit $?
        ;;
    "open whatsapp"|"whatsapp")
        "$DIR/actions.sh" open whatsapp
        exit $?
        ;;
    "open telegram"|"telegram")
        "$DIR/actions.sh" open telegram
        exit $?
        ;;

    # SETTINGS CONTROL
    "wifi"|"open wifi"|"wifi settings")
        "$DIR/settings.sh" wifi
        exit $?
        ;;
    "bluetooth"|"open bluetooth"|"bluetooth settings")
        "$DIR/settings.sh" bluetooth
        exit $?
        ;;
    "data"|"mobile data"|"open data")
        "$DIR/settings.sh" data
        exit $?
        ;;

    # NAVIGATION
    "home"|"go home")
        "$DIR/actions.sh" home
        exit $?
        ;;
    "back"|"go back")
        "$DIR/actions.sh" back
        exit $?
        ;;

    # FALLBACK
    *)
        exit 1
        ;;
esac
