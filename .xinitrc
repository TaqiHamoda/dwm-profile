# Wallpaper
feh --bg-scale ~/.dwm-profile/wallpapers/wallpaper-029.jpg &

# st Transparency
xcompmgr &

# Status bar
~/.dwm-profile/dwm_bar.sh &

# Start dwm
exec dbus-launch --exit-with-session dwm
