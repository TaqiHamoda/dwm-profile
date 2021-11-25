#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# Taqi Hamoda
# GNU GPLv3

#### Dependencies: xorg-xsetroot ####

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
SEP1=""
SEP2=" - "


#### Functions for getting info ####

# Getting Sound Info. Depends on alsa-utils
dwm_alsa () {
    STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$STATUS" = "off" ]; then
                printf "MUTE"
        else
                # removed this line because it may get confusing
                if [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
                        printf "VOL %s%%" "$VOL"
                elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
                        printf "VOL %s%%" "$VOL"
                else
                        printf "VOL %s%%" "$VOL"
                fi
        fi
    printf "%s\n" "$SEP2"
}


# Function for getting battery info
dwm_battery () {
    CHARGE=$(cat /sys/class/power_supply/BATT/capacity)
    STATUS=$(cat /sys/class/power_supply/BATT/status)

    printf "%s" "$SEP1"
    printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    printf "%s\n" "$SEP2"
}


# Function for getting date
# Date is formatted like like this: Saturday 23 October, 13:00:33
dwm_date () {
    printf "%s" "$SEP1"
    printf "%s" "$(date "+%A %B %d, %T")"
#    printf "%s\n" "$SEP2"
}


# Function for getting network info
# Dependencies: iwconfig
dwm_networkmanager () {
#    RATE="$(iwconfig | grep Rate | awk '{print $2;}')"
#    UNIT="$(iwconfig | grep Rate | awk '{print $3;}')"
    QUALITY="$(iwconfig | grep Quality | awk '{print $2;}' | sed 's/Quality=//g')"
#    CONNAME="$(echo ${RATE} | sed 's/Rate=//g')${UNIT} $(echo ${QUALITY})"

    NAME=$(iwconfig | grep ESSID: | awk '{print $4;}' | sed 's/ESSID://g' | sed 's/"//g')
    PRIVATE=$(ip a | grep 'inet ' | awk '{print $2;}' | tail -n 1)

#    printf  "${SEP1} ${CONNAME} ${PRIVATE} ${NAME}${SEP2}"
    printf  "${SEP1} ${QUALITY} ${PRIVATE} ${NAME}${SEP2}"
}


# Global variables for parallelized processes
# Parallelized by writing variables to shared memory file '/dev/shm'
echo "$(dwm_networkmanager)" > /dev/shm/__DWM_NETWORKMANAGER__

parallelize() {
    while true
    do
        echo "$(dwm_networkmanager)" > /dev/shm/__DWM_NETWORKMANAGER__
        sleep 5
    done
}
parallelize &

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the upperbar string
    upperbar=""
    upperbar="$upperbar$(</dev/shm/__DWM_NETWORKMANAGER__)"
    upperbar="$upperbar$(dwm_alsa)"
    upperbar="$upperbar$(dwm_battery)"
    upperbar="$upperbar$(dwm_date)"

    # Append results of each func one by one to the lowerbar string
    lowerbar=""

    xsetroot -name "$upperbar"

    # Uncomment the line below to enable the lowerbar
    #xsetroot -name "$upperbar;$lowerbar"
    sleep 1
done
