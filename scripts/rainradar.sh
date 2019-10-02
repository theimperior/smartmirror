#!/bin/sh

d=$(date -d"-2hours-4minutes" +%Y_%m_%d)
d2=$(date -d"-2hours-4minutes" +%Y%m%d)
h=$(date -d"-2hours-4minutes" +%H)
m_tmp=$(date -d"-4minutes" +%M)
#time=$(date -d"-2hours-4minutes" +%H%M)
r=$(($m_tmp % 5))
m=$(($m_tmp - $r))
printf -v m "%.2d" $m
wget --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" -O /dev/null https://kachelmannwetter.com/de/regenradar/ulm/${d2}-${h}${m}z.html
sleep 0.5
wget --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" -O ../rainRadar/rr1.png "https://img3.kachelmannwetter.com/images/data/cache/px250/px250_${d}_265_${h}${m}.png"
