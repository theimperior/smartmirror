#!/bin/bash
rrdtool fetch /var/lib/munin/flippi2/flippi2-temperature_outside-temperature-g.rrd LAST -s -300 -e -300 | tail -n1 | awk '{print $2}'
