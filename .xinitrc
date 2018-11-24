sxhkd &
start-pulseaudio-x11 &
setxkbmap br &
exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) bspwm
