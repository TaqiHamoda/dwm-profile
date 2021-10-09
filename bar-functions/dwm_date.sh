#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon, Jul 20, 2018 11:45:58 AM]"
dwm_date () {
    printf "%s" "$SEP1"
    printf "%s" "$(date "+%A %d %B, %T")"
#    printf "%s\n" "$SEP2"
}

dwm_date
