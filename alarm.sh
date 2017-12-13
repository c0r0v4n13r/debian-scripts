#!/bin/bash
atime=$(date -d "$RTIME 5 minutes" +"%H:%M:%S")
notify-send 'Будильник установлен' $atime
sleep 300
amixer sset 'Master' 100%
mocp -v=100
mocp -l /home/freeman/.config/scripts/signal_trevogi_-_yantar.mp3
notify-send 'Будильник сработал' $atime
sleep 1
