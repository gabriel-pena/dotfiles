#!/bin/zsh

image_loading=/tmp/loading.png
image_wallpaper=$HOME/wallpaper.png
scres=($(xrandr | grep '*' | awk '{$1=$1};1' | sed 's/ .*//g' | awk '{split($0,a,"x"); print a[1]"\n"a[2]};'))
fts=72
x_pos=($(echo "($scres[1]) - ($scres[1]/2) -  $fts*4" | bc))
y_pos=($(echo "($scres[2]) - ($scres[2]/2)  - $fts/2" | bc))
rm -rf $image_loading >/dev/null 2>&1
grim -t jpeg -q 50 - | convert - -define png:compression-level=1 -scale 10% -blur 0x2.5 -resize 1000% -level 0%,100%,0.5 -font Courier -pointsize 72 -fill white -draw "text $x_pos,$y_pos 'Carregando...'"  $image_loading
killall swaybg >/dev/null 2>&1
swaybg -i $image_loading -m fill >/dev/null 2>&1 &
killall pulseaudio >/dev/null 2>&1
pulseaudio -D >/dev/null 2>&1
killall mopidy >/dev/null 2>&1
mopidy >/dev/null 2>&1 &
sleep 5
killall waybar >/dev/null 2>&1
waybar >/dev/null 2>&1 &
sleep 5
killall swaybg >/dev/null 2>&1
swaybg -i $image_wallpaper -m fill >/dev/null 2>&1 &

