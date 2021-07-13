#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    CHARGE=$(cat /sys/class/power_supply/BATT/capacity)
    STATUS=$(cat /sys/class/power_supply/BATT/status)

    printf "%s" "$SEP1"
    printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    printf "%s\n" "$SEP2"
}

dwm_battery

