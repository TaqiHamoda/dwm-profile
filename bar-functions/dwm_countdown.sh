#!/bin/sh

# A dwm_status function that displays the status of countdown.sh
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: https://github.com/joestandring/countdown

dwm_countdown () {
    for f in /tmp/countdown.*; do
        if [ -e "$f" ]; then
            printf "%s" "$SEP1"
            printf "CDN %s" "$(tail -1 /tmp/countdown.*)"
            printf "%s\n" "$SEP2"

            break
        fi
    done
}

dwm_countdown
