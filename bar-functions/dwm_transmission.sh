#!/bin/sh

# A dwm_bar function to show the status of a torrent woth transmission-remote
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: transmission-remote

dwm_transmission () {
    TORRENT=$(transmission-remote -l | sed '2q;d' | sed 's/\(.\) /\1/g')
    ID=$(printf "%s" "$TORRENT" | awk '{print $1;}')
    STATUS=$(printf "%s" "$TORRENT" | awk '{print $8;}')
    ETA=$(printf "%s" "$TORRENT" | awk '{print $4;}')
    NAME=$(printf "%s" "$TORRENT" | awk '{for(i=9;i<=NF;++i)print $i}' | tr -d "\n" | head -c 20; printf "...")
    DONE=$(printf "%s" "$TORRENT" | awk '{print $2;}')
    UP=$(printf "%s" "$TORRENT" | awk '{print $5;}')
    DOWN=$(printf "%s" "$TORRENT" | awk '{print $5;}')

    if [ "$ID" != "Sum:" ]; then
        printf "%s" "$SEP1"
        case "$STATUS" in
            "Idle")
                printf "IDLE %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                ;;
            "Seeding")
                printf "SEEDING %s | ⬆%s ⬇%s" "$NAME" "$UP" "$DOWN"
                ;;
            "Downloading")
                printf "DOWNLOADING %s | %s %s ⬆%s ⬇%s" "$NAME" "$DONE" "$ETA" "$UP" "$DOWN"
                ;;
        esac
        printf "%s\n" "$SEP2"
    fi
}

dwm_transmission
