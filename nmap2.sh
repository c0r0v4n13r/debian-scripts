#!/bin/bash

clear
echo ""
while true
do
clear
echo "*******************************************"
echo "***************NMAP Scanner****************"
echo "*******************************************"
echo Target: $host
echo "*******************************************"
echo 1. Fast Scan [nmap -v -A -Pn --max-parallelism 10000]
echo 2. Detailed Scan [nmap -vv -A -Pn -n -p 1-65535 --max-parallelism 10000]
echo 0. Enter hostname
echo "*******************************************"
echo "*******************************************"
echo ""

read n
case $n in

1)clear
nmap -v -A -Pn --max-parallelism 10000 $host
read;;

2)clear
nmap -vv -A -Pn -n -p 1-65535 --max-parallelism 10000 $host
read;;

0)
read -p "Enter hostname or IP address, or ip band: " host;;

m)sudo sysctl net.ipv4.ip_local_port_range="15000 61000"
sudo sysctl net.ipv4.tcp_fin_timeout=30
sleep 1;;

*)clear
echo "Invalid option"
echo ""
read -p "Press any key to return to script";;

esac
sleep 1
done
