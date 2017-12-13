#!/bin/bash
song="$(mocp -Q='%artist %t')"
echo $song | xclip -filter -selection clipboard
##/opt/waterfox/waterfox https://zf.fm/mp3/search?keywords=$song
notify-send "$song"
exit