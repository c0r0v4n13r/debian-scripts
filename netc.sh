#!/bin/bash

sudo uname>/dev/null
clear
echo ""
while true
do
clear
echo "*******************************************"
echo "**************Select option****************"
echo "*******************************************"
echo "** 1. Start Anonymizing Services         **"
echo "** 2.(Re)Start Tor (port 9049,9051)      **"
echo "** 3. Start I2P                          **"
echo "** I2P http://127.0.0.1:7657             **"
echo "** 4. Start ZeroNet                      **"
echo "** ZeroNet http://127.0.0.1:43110/       **"
echo "** 5. Start Wi-Fi AP                     **"
echo "** 6. Stop Wi-Fi AP                      **"
echo "** 7. Start miredo                       **"
echo "** 0. Stop Anonymizing Services          **"
echo "*******************************************"
echo "** r. Reset Network Manager              **"
echo "** m. Mobile Broadband Mode              **"
echo "** i. Mobile Broadband Traffic           **"
echo "** u. Up All Interfaces                  **"
echo "** t. Enable telnet access               **"
echo "*******************************************"
echo ""

read n
case $n in
1)clear
echo "Starting Tor"
sudo service tor start
nohup tor -f /home/freeman/.config/torrc > /dev/null &
echo "Starting I2P"
sudo service i2p start
echo "Starting ZeroNet"
nohup python '/home/freeman/.zeronet/zeronet.py' > /dev/null &
#echo "Setting Tor As Proxy"
#gsettings set org.gnome.system.proxy mode 'manual'
#gsettings set org.gnome.system.proxy.socks host 127.0.0.1
#gsettings set org.gnome.system.proxy.socks port 9049
sleep 2;;

2)clear
echo "Stopping Tor"
sudo service tor stop
sleep 3
killall -9 tor
sleep 2
echo "Starting Tor"
sudo service tor start
nohup tor -f /home/freeman/.config/torrc > /dev/null &
#echo "Setting Tor As Proxy"
#gsettings set org.gnome.system.proxy mode 'manual'
#gsettings set org.gnome.system.proxy.socks host 127.0.0.1
#gsettings set org.gnome.system.proxy.socks port 9049
sleep 2;;

3)clear
echo "Starting I2P"
sudo service i2p start
sleep 2;;

4)clear
echo "Starting ZeroNet"
nohup python '/home/freeman/.zeronet/zeronet.py' > /dev/null &
sleep 2;;

5)clear
sudo ifconfig -s
echo ""
echo "Select interface for sharing"
read IFSHARE
echo ""
echo "Stopping wpa_supplicant"
sudo service wpa_supplicant stop
sleep 5
echo "Configure IP address for WLAN"
sudo ifconfig wlo1 192.168.150.1
echo "Start DHCP/DNS server"
sudo service dnsmasq restart
echo "Enable routing"
sudo sysctl net.ipv4.ip_forward=1
echo "Enable NAT"
sudo iptables -t nat -A POSTROUTING -o $IFSHARE -j MASQUERADE
echo "Run access point daemon"
#sudo ifconfig wlo1 up
sleep 1
sudo xterm -e "hostapd /home/freeman/.config/hotspot/hostapd.conf" &
sleep 5;;

6)clear
sudo ifconfig wlo1 down
echo "Stop access point daemon"
sudo killall -9 hostapd
echo "Disable NAT"
sudo iptables -D POSTROUTING -t nat -o $IFSHARE -j MASQUERADE
echo "Disable routing"
sudo sysctl net.ipv4.ip_forward=0
echo "Disable DHCP/DNS server"
sudo service dnsmasq stop
sudo ifconfig wlo1 up
echo "Starting wpa_supplicant"
sudo service wpa_supplicant start
sleep 5;;

7)clear
echo "Starting Miredo"
service miredo restart
sleep 5
ping6 -c 4 ipv6.google.com
sleep 2;;

m)clear
echo "Stopping Tor"
sudo service tor stop
killall -9 tor
echo "Stopping I2P"
sudo service i2p stop
echo "Stopping ZeroNet"
killall -9 python
echo "Stopping BTSync"
sudo service btsync stop
echo "Stopping qBittorrent"
sudo killall -9 qbittorrent
echo "Stopping Skype"
sudo killall -9 skype
sudo killall -9 skypeforlinux
echo "Stopping Pidgin"
sudo killall -9 pidgin
echo "Stopping Icedove"
sudo killall -9 icedove
gsettings set org.gnome.system.proxy mode 'none'
sleep 2;;

r)clear
echo Stopping Network Services
sudo service network-manager stop
sudo service avahi-daemon stop
sudo service networking stop
sleep 1
echo Disabling network interfaces
sudo ifconfig wlo1 down
sudo ifconfig eno1 down
sudo ifconfig lo down
sleep 5
echo Enabling network interfaces
sudo ifconfig wlo1 up
sudo ifconfig eno1 up
sudo ifconfig lo up
sleep 1
echo Starting Network Services
sudo service networking start
sudo service avahi-daemon start
sudo service network-manager start
sleep 2;;

i)while :
do
clear
sudo ifconfig ppp0
sleep 5
done;;

u)while :
do
clear
sudo ifconfig wlo1 up
sudo ifconfig eno1 up
sudo ifconfig lo up
sudo ifconfig
done;;

t)clear
echo "Starting telnet server"
systemctl start openbsd-inetd
sleep 2;;

0)clear
echo "Stopping Tor"
sudo service tor stop
echo "Stopping I2P"
sudo service i2p stop
echo "Stopping ZeroNet"
killall -9 python
echo "Disabling Proxy"
gsettings set org.gnome.system.proxy mode 'none'
sleep 2;;

*)clear
echo "Invalid option"
echo ""
read -p "Press any key to return to script";;

esac
sleep 1
done
