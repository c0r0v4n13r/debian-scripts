#!/bin/bash
profile=$(( RANDOM%999999999 ))
mkdir /tmp/.fx$profile
firefox-esr -profile /tmp/.fx$profile -no-remote -private
rm -rf /tmp/.fx$profile