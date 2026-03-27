#!/bin/bash

# Obține profilul curent
CURRENT=$(powerprofilesctl get)

# Determină următorul profil și iconița corespunzătoare
case $CURRENT in
    power-saver)
        NEXT="balanced"
        ICON=""
        NAME="Balanced"
        ;;
    balanced)
        NEXT="performance"
        ICON=""
        NAME="Performance"
        ;;
    *)
        NEXT="power-saver"
        ICON=""
        NAME="Power Saver"
        ;;
esac

# Aplică noul profil
powerprofilesctl set $NEXT

# Trimite notificarea către SwayNC
# -u low/normal/critical, -i iconița, -t timp de afișare (ms)
notify-send -u normal -t 2000 "$ICON Power Profile" "Switched to $NAME mode" -a "System"
