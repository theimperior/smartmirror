#!/bin/sh
# the script should be executed ad the beginning of every day (e.g. at 00:05)
# it will take a screenshot of +1day, +2days and +3days weather
# sat=$(date -dnext-saturday +%Y-%m-%d)
# sun=$(date -dnext-sunday +%Y-%m-%d)

day1=$(date -d"+1day" +%Y-%m-%d)
day2=$(date -d"+2day" +%Y-%m-%d)
day3=$(date -d"+3day" +%Y-%m-%d)


DISPLAY=:99
export DISPLAY=:99
export XAUTHORITY=/home/basti/.Xauthority
load_time=25

Xvfb $DISPLAY -screen 0 1800x1200x24 &
x11_pid=$!
sleep 1
firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day1}|weatherLayer" &> /dev/null &
ff_pid=$!

# wait for page to load
sleep $load_time
xdotool search -name ".*Mozilla Firefox" windowsize 1800 1200
xdotool search -name ".*Mozilla Firefox" mousemove 0 0
sleep 1
import -window root -crop 638x398+415+459 /var/www/smartmirror/mountainWeather/weatherday1.jpg
#import -window root /var/www/smartmirror/mountainWeather/weatherday1.jpg

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day2}|weatherLayer"
sleep $load_time
import -window root -crop 638x398+415+459 /var/www/smartmirror/mountainWeather/weatherday2.jpg
#import -window root /var/www/smartmirror/mountainWeather/weatherday2.jpg

firefox "https://www.alpenverein.de/DAV-Services/Bergwetter/#${day3}|weatherLayer"
sleep $load_time
import -window root -crop 638x398+415+459 /var/www/smartmirror/mountainWeather/weatherday3.jpg
#import -window root /var/www/smartmirror/mountainWeather/weatherday3.jpg

xdotool search -name ".*Mozilla Firefox" windowclose

#kill $ff_pid
sleep 3
kill $x11_pid

