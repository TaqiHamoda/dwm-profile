# Resolution
xrandr --output HDMI-1 --mode 2560x1600 --rate 60

# Wallpaper
feh --bg-scale ~/.dwm_profile/wallpapers/wallpaper-001.jpg &

# st Transparency
xcompmgr &

# Status bar
~/.dwm_profile/bar.sh &

# Start dwm
wmname compiz
# --exit-with-session causes the GUI to lock. You need to compile dbus with x11 for it to work
#exec dbus-launch --exit-with-session dwm
exec dbus-launch dwm
