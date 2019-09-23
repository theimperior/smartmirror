#!/bin/bash
sat=$(date -dnext-saturday +%Y-%m-%d)
sun=$(date -dnext-sunday +%Y-%m-%d)

DISPLAY=:1
export DISPLAY=:1
export XAUTHORITY=/home/basti/.Xauthority

Xvfb $DISPLAY -screen 0 1800x1200x24 &

x11_pid=$!

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${sat}|weatherLayer" &> /dev/null &
# wait for page to load
sleep 2
xdotool search -name ".*Mozilla Firefox" windowsize 1800 1200
xdotool search -name ".*Mozilla Firefox" mousemove 0 0
import -window root -crop 638x398+415+559 ~/weatherSat.jpg

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${sun}|weatherLayer"
sleep 2
import -window root -crop 638x398+415+559 ~/weatherSun.jpg

kill $x11_pid

