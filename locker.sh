#!/bin/bash

who -a
read id

clear
while true
do
n=1
n="$(who -d | grep -c $id)"
case $n in

1)clear
echo "$n"
dm-tool lock
sleep 5
exit;;

0)
echo "$n"
sleep 5
clear;;

*)
echo "$n"
sleep 5
clear;;

esac
sleep 5
done
