#!/bin/bash
amixer sset 'Master' 20% > /dev/null
##Make backup of Waterfox data
cp /home/freeman/.waterfox/7k6rnsxj.default/places.sqlite ~/.config/backup/waterfox/places.sqlite
cp /home/freeman/.waterfox/7k6rnsxj.default/key3.db ~/.config/backup/waterfox/key3.db
cp /home/freeman/.waterfox/7k6rnsxj.default/logins.json ~/.config/backup/waterfox/logins.json
echo Waiting 10 seconds for disable AutoRun
echo Press CTRL+C to stop
sleep 10
##echo Starting Firefox
##nohup firefox-esr > /dev/null &
##nohup /home/freeman/.config/scripts/fastfox.sh > /dev/null &
echo Starting Waterfox
nohup /opt/waterfox/waterfox > /dev/null &
sleep 2
echo Starting Hexchat
nohup hexchat > /dev/null &
sleep 2
echo Starting Pidgin
nohup pidgin > /dev/null &
sleep 2
##echo Starting Skype
##nohup firejail /usr/bin/chromium --profile-directory=Default --app-id=hidkfhhmdefbeccdmgmppmdhfggcagdm > /dev/null &
##sleep 2
##echo Starting OziExplorer
##nohup wine /home/freeman/.wine/drive_c/OziExplorer/OziExp.exe > /dev/null &
##sleep 2
echo Starting Zello
nohup wine "/home/freeman/.wine/drive_c/Program Files (x86)/Zello/Zello.exe" > /dev/null &
sleep 2
echo Starting OBFS System
nohup firefox-esr --profile /home/freeman/.mozilla/firefox/1234.default --no-remote imacros://run/?m=obfs/run.iim > /dev/null &
sleep 2
echo Starting Online Rock Radio
mocp -l http://79.120.39.202:9055/
sleep 2
exit
