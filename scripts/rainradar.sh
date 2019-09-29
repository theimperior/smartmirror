#!/bin/sh
# the script should be executed ad the beginning of every day (e.g. at 00:05)
# it will take a screenshot of +1day, +2days and +3days weather
# sat=$(date -dnext-saturday +%Y-%m-%d)
# sun=$(date -dnext-sunday +%Y-%m-%d)

d=$(date -d"-2hours" +%Y_%m_%d)
h=$(date -d"-2hours" +%H)
m_tmp=$(date +%M)
r=$(($m_tmp % 5))
m=$(($m_tmp - $r - 10))


wget -O ../rainRadar/rr1.png "https://img3.kachelmannwetter.com/images/data/cache/px250/px250_${d}_265_${h}${m}.png"
