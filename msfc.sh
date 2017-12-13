#!/bin/bash
sudo uname>/dev/null
echo "Starting service"
sudo service metasploit start
sleep 10
echo "Starting console"
sudo msfconsole
echo "Stopping service"
sudo service metasploit stop