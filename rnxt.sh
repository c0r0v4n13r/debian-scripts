#!/bin/sh
# replace cmd1 for the command to execute

host=192.168.1.2
port=23

( echo open ${host}
sleep 1
echo "\nNEXT "
sleep 1
 ) | telnet
exit
