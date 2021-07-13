#!/bin/sh

# A dwm_bar function to display the number of emails in an inbox
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# To count mail in an inbox, change "/path/to/inbox" below to the location of your inbox. For example, "/home/$USER/.mail/new"

dwm_mail () {
    MAILBOX=$(ls /path/to/inbox | wc -l)

    printf "%s" "$SEP1"
    printf "MAI %s" "$MAILBOX"
    printf "%s\n" "$SEP2"
}

dwm_mail
