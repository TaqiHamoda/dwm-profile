#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP using NetworkManager
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

dwm_networkmanager () {
    RATE="$(iwconfig | grep Rate | awk '{print $2;}')"
    UNIT="$(iwconfig | grep Rate | awk '{print $3;}')"
    QUALITY="$(iwconfig | grep Quality | awk '{print $2;}')"
    CONNAME="$(echo ${RATE} | sed 's/Rate=//g')${UNIT} $(echo ${QUALITY} | sed 's/Quality=//g')"

    PRIVATE=$(ip a | grep 'inet ' | awk '{print $2;}' | tail -n 1)

    echo "${SEP1}NET ${CONNAME} ${PRIVATE}${SEP2}"
}

dwm_networkmanager
