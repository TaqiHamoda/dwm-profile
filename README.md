# dwm-profile

This is my dwm profile. Still a work in progress but getting there

![DWM Environment](https://github.com/TaqieldinHamoda/dwm-profile/blob/main/Preview.png "A Preview of my DWM Environment")

## Dot Files
- `.bashrc` belongs to `~/`
- `.xinitrc` belongs to `~/`
- `.nanorc` belongs to `~/`
- `settings.ini` belongs to `~/.config/gtk-3.0/`

## Dark Mode
To enable dark mode on all GTK applications, run the following command:

```
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

## Xbacklight keybindings
By default, only `root` can change the brightness using `xbacklight`. To allow regular users to change the brightness, you must first add the user to the `video` group

```
sudo usermod -a -G video username
```

and create a udev rule in `/etc/udev/rules.d/backlight.rules` that allows members of the `video` group to modify the systems brightness.

```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```

## Undervolting
**Note:** This guide applies only to laptops supported by [`throttled`](https://github.com/erpalma/throttled). If unsupported, follow the official [Arch Linux Guide](https://wiki.archlinux.org/title/Undervolting_CPU).

Undervolting laptops reduces power usage, extends battery life, lowers temperatures, and prolongs hardware lifespan. To start, install the `throttled` library and run its service. **DO NOT ENABLE THE SERVICE DURING TUNING. ALWAYS MONITOR TEMPERATURES.**

Tune the system in `5 mV` increments/decrements. Use the `stress` library to test all CPU cores. After each adjustment, run the test for a few minutes. If you notice glitches, lags or crashes, restart your PC to disable undervolting. Reduce the adjustment value until stability is achieved.

Repeat the above for the GPU using `glmark2`. Once optimal GPU settings are found, run both stress tests, adjusting only the GPU values until stable. Afterwards, run both tests for several hours to ensure long-term stability. Keep your PC cool (use an ice pack) and monitor its temperature. Once stable, save your `throttled` config and enable the service.

Here’s my current `throttled` config. **Important**: Do not use my values! Start undervolting from scratch, carefully and slowly. Even with the same system, slight undervolting can cause crashes.

```
# All voltage values are expressed in mV and *MUST* be negative (i.e. undervolt)!
# The values for CPU core and CPU cache should be *EXACTLY* the same.
[UNDERVOLT]
# CPU core voltage offset (mV)
CORE: -100
# Integrated GPU voltage offset (mV)
GPU: -100
# CPU cache voltage offset (mV)
CACHE: -100
# System Agent (RAM) voltage offset (mV)
UNCORE: 0
# Analog I/O voltage offset (mV)
ANALOGIO: 0
```

## Packages Required

This is a list of the packages required for this implementation to work on my current build.
My build is an Asus Zenbook UM431D running Arch Linux

- `xorg-server`
- `xorg-xinit`
- `xorg-xsetroot`
- `xorg-xrandr`
- `xss-lock`
- `base-devel`
- `net-tools`
- `wireless_tools`
- `pulseaudio`
- `alsa-utils`
- `usbutils`
- `pulseaudio-alsa`
- `feh`
- `acpilight`
- `xcompmgr`
- `scrot`
- `mons` (For easy switching between displays)
- `nano-syntax-highlighting`
- `nemo`
- `noto-fonts`
- `ttf-jetbrains-mono-nerd`
- `ttf-material-icons-git`
- `pacman-contrib`
- `mkinitcpio-firmware` (drivers that are not typically shipped with `linux-firmware`)
- `sof-firmware` (sound drivers)
- `colorz` (optional but helps with color scheme)
- `xorg-xev` (optional but helps with figuring X11 Keycodes)

### Enabling `multilib`
The `multilib` Arch repository contains useful packages such as the video graphics drivers for OpenGL `lib32-mesa` or the `wine` package. To enable multilib repository, uncomment the `[multilib]` section in `/etc/pacman.conf`: 

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

### Setting `paccache` timer
Typically, `pacman` doesn't clean its cache folder and lets it grow indefinitely until the disk is filled. As such, the `paccache` script is needed to constantly prune the cache bulidup. Begin by enabling and starting the `paccache.timer` so that the cache is cleaned weekly.

By default, `paccache` keeps the three most recent version of an installed package. To only keep the most recent version, use the `paccache -rk1` command. To remove the cache of all uninstalled packages, use `paccache -ruk0`.
