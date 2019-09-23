#!/bin/bash
# the script should be executed ad the beginning of every day (e.g. at 00:05)
# it will take a screenshot of +1day, +2days and +3days weather
# sat=$(date -dnext-saturday +%Y-%m-%d)
# sun=$(date -dnext-sunday +%Y-%m-%d)

day1 = $(date -d"+1day" +%Y-%m-%d)
day2 = $(date -d"+2day" +%Y-%m-%d)
day3 = $(date -d"+3day" +%Y-%m-%d)


DISPLAY=:1
export DISPLAY=:1
export XAUTHORITY=/home/basti/.Xauthority

Xvfb $DISPLAY -screen 0 1800x1200x24 &

x11_pid=$!

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day1}|weatherLayer" &> /dev/null &
# wait for page to load
sleep 2
xdotool search -name ".*Mozilla Firefox" windowsize 1800 1200
xdotool search -name ".*Mozilla Firefox" mousemove 0 0
import -window root -crop 638x398+415+559 /var/www/smartmirror/mountainWeather/weatherday1.jpg

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day2}|weatherLayer"
sleep 2
import -window root -crop 638x398+415+559 /var/www/smartmirror/mountainWeather/weatherday2.jpg

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day3}|weatherLayer"
sleep 2
import -window root -crop 638x398+415+559 /var/www/smartmirror/mountainWeather/weatherday3.jpg

kill $x11_pid

