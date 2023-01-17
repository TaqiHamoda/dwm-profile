# Wallpaper
feh --bg-scale ~/.dwm-profile/wallpapers/wallpaper-001.jpg &

# st Transparency
xcompmgr &

# Status bar
~/.dwm-profile/bar.sh &

# Start dwm
wmname compiz
exec dbus-launch --exit-with-session dwm
