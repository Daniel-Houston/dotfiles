#!/bin/sh 
# i3lock; sleep 1; xset dpms force off;
xautolock -time 5 -locker 'i3lock -c 000011' -notify 20 -notifier 'xset dpms force off'
