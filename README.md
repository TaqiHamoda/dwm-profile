# dwm-profile

This is my dwm profile. Still a work in progress but getting there

## Dot Files:
<ul>
<li> .xinitrc belongs to ~/
<li> settings.ini belongs to ~/.config/gtk-3.0/
<li> slock.service belongs to /etc/systemd/system/
</ul>

## Slock:
For slock to work you need to run: sudo groupadd nogroup

## TODO:
<ul>
<li> Remove user defined key bindings from dwm.c and put them in config.h
<li> Fix screen brightness keybindings
</ul>

## Packages Required:
This is a list of the packages required for this implementation to work on my current build.
My build is an Asus Zenbook UM431D running Arch Linux

<ul>
<li> xorg-server
<li> xorg-xinit
<li> base-devel
<li> xorg-xsetroot
<li> net-tools
<li> wireless_tools
<li> pulseaudio
<li> alsa-utils
<li> pulseaudio-alsa
<li> feh
<li> acpilight
<li> xcompmgr
<li> ttf-ubuntu-font-family
<li> scrot
<li> colorz (optional but helps with color scheme)
<li> xorg-xev (optional but helps with figuring X11 Keycodes)
</ul>
