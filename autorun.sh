#!/bin/bash
##Make backup of Waterfox data
cp /home/freeman/.waterfox/7k6rnsxj.default/places.sqlite ~/.config/backup/waterfox/places.sqlite
cp /home/freeman/.waterfox/7k6rnsxj.default/key3.db ~/.config/backup/waterfox/key3.db
cp /home/freeman/.waterfox/7k6rnsxj.default/logins.json ~/.config/backup/waterfox/logins.json
#amixer sset 'Master' 20% > /dev/null
echo Waiting 10 seconds for disable AutoRun
echo Press CTRL+C to stop
sleep 10
echo Starting
nohup /opt/waterfox/waterfox > /dev/null &
nohup hexchat > /dev/null &
nohup pidgin > /dev/null &
nohup wine "/home/freeman/.wine/drive_c/Program Files (x86)/Zello/Zello.exe" > /dev/null &
nohup firefox-esr --profile /home/freeman/.mozilla/firefox/1234.default --no-remote imacros://run/?m=obfs/run.iim > /dev/null &
mocp -l http://79.120.39.202:9055/
sleep 2
exit
