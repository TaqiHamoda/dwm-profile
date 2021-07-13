#!/bin/sh

# A dwm_bar function to show VPN connections with OpenVPN or WireGuard (if any are active)
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, NetworkManager-openvpn (for OpenVPN connections)

dwm_vpn () {
    VPN=$(nmcli -a | grep 'VPN connection' | sed -e 's/\( VPN connection\)*$//g')
    
    if [ "$VPN" = "" ]; then
        VPN=$(nmcli connection | grep 'wireguard' | sed 's/\s.*$//')
    fi

    if [ "$VPN" != "" ]; then
        printf "%s" "$SEP1"
        printf "VPN %s" "$VPN"
        printf "%s\n" "$SEP2"
    fi
}


dwm_vpn
