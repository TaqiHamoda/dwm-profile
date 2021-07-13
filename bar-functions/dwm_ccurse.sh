#!/bin/sh

# A dwm_bar function to show the closest appointment in calcurse
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: calcurse

dwm_ccurse () {
    APTSFILE="$HOME/.calcurse/apts"
    APPOINTMENT=$(head -n 1 "$APTSFILE" | sed -r 's/\[1\] //')

    if [ "$APPOINTMENT" != "" ]; then
        printf "%s" "$SEP1"
        printf "APT %s" "$APPOINTMENT"
        printf "%s\n" "$SEP2"
    fi
}

dwm_ccurse
