# dwm-profile

This is my dwm profile. Still a work in progress but getting there

![DWM Environment](https://github.com/TaqieldinHamoda/dwm-profile/blob/main/Preview.png "A Preview of my DWM Environment")

## Dot Files:
- `.bashrc` belongs to `~/`
- `.xinitrc` belongs to `~/`
- `.nanorc` belongs to `~/`
- `settings.ini` belongs to `~/.config/gtk-3.0/`
- `slock.service` belongs to `/etc/systemd/system/`

## Slock:
For slock to work you need to run:
```
sudo groupadd nogroup
```

## Dark Mode:
To enable dark mode on all GTK applications, run the following command:

```
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

## Xbacklight keybindings
By default, only `root` can change the brightness using `xbacklight`. To allow regular users to change the brightness, you must add the user to the `video` group and create a udev rule as follows:

```
# Add user to video group
sudo usermod -a -G video username
```

```
# Edit /etc/udev/rules.d/backlight.rules
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```

## Packages Required:
This is a list of the packages required for this implementation to work on my current build.
My build is an Asus Zenbook UM431D running Arch Linux

- `xorg-server`
- `xorg-xinit`
- `xorg-xsetroot`
- `xorg-xrandr`
- `base-devel`
- `net-tools`
- `wireless_tools`
- `pulseaudio`
- `alsa-utils`
- `pulseaudio-alsa`
- `feh`
- `acpilight`
- `xcompmgr`
- `scrot`
- `nano-syntax-highlighting`
- `noto-fonts`
- `ttf-jetbrains-mono-nerd`
- `ttf-material-icons-git`
- `wmname` (needed to make Java programs work on dwm)
- `mkinitcpio-firmware` (drivers that are not typically shipped with `linux-firmware`)
- `sof-firmware` (sound drivers)
- `colorz` (optional but helps with color scheme)
- `xorg-xev` (optional but helps with figuring X11 Keycodes)
