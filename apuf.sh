#!/bin/bash

clear
echo ""
while true
do
clear
echo "*******************************************"
echo "************APU Governor Mode**************"
echo "*******************************************"
echo "** 1. Set APU ondemand (default)         **"
echo "** 2. Set APU performance                **"
echo "** 3. Set APU conservative               **"
echo "** 4. Set APU powersave                  **"
echo "** 0. Current state                      **"
echo "*******************************************"
echo "**************Select option****************"
echo "*******************************************"
echo "** 5. Stop Services                      **"
echo "*******************************************"
echo "** l. Laptop Mode Tools                  **"
echo "*******************************************"
echo ""

read n
case $n in

1)clear
echo "Ondemand mode"
cpufreq-set -g ondemand -c0
cpufreq-set -g ondemand -c1
cpufreq-info -f -m -c0
cpufreq-info -f -m -c1
echo balanced > /sys/class/drm/card0/device/power_dpm_state
echo auto > /sys/class/drm/card0/device/power_dpm_force_performance_level
cat /sys/class/drm/card0/device/power_dpm_state
cat /sys/class/drm/card0/device/power_dpm_force_performance_level
sleep 2;;

2)clear
echo "Performance mode"
cpufreq-set -g performance -c0
cpufreq-set -g performance -c1
cpufreq-info -f -m -c0
cpufreq-info -f -m -c1
echo performance > /sys/class/drm/card0/device/power_dpm_state
echo high > /sys/class/drm/card0/device/power_dpm_force_performance_level
cat /sys/class/drm/card0/device/power_dpm_state
cat /sys/class/drm/card0/device/power_dpm_force_performance_level
sleep 2;;

3)clear
echo "Conservative mode"
cpufreq-set -g conservative -c0
cpufreq-set -g conservative -c1
cpufreq-info -f -m -c0
cpufreq-info -f -m -c1
echo battery > /sys/class/drm/card0/device/power_dpm_state
echo low > /sys/class/drm/card0/device/power_dpm_force_performance_level
cat /sys/class/drm/card0/device/power_dpm_state
cat /sys/class/drm/card0/device/power_dpm_force_performance_level
echo 10 > /sys/class/backlight/radeon_bl0/brightness
sleep 2;;

4)clear
echo "Powersave mode (850mhz)"
#cpufreq-set -g userspace -c0
#cpufreq-set -g userspace -c1
#cpufreq-set -f 850 MHz -c0
#cpufreq-set -f 850 MHz -c1
cpufreq-set -g powersave -c0
cpufreq-set -g powersave -c1
cpufreq-info -f -m -c0
cpufreq-info -f -m -c1
# echo 0 > /sys/class/thermal/cooling_device0/cur_state
# echo 0 > /sys/class/thermal/cooling_device1/cur_state
echo low > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo battery > /sys/class/drm/card0/device/power_dpm_state
cat /sys/class/drm/card0/device/power_dpm_state
cat /sys/class/drm/card0/device/power_dpm_force_performance_level
echo 10 > /sys/class/backlight/radeon_bl0/brightness
sleep 2;;

5)clear
echo "Stopping Tor"
service tor stop
echo "Stopping I2P"
service i2p stop
echo "Stopping BTSync"
service btsync stop
echo "Stopping MetaSploit"
service metasploit stop
echo "Disabling Proxy"
# gsettings set org.gnome.system.proxy mode 'none'
sleep 2;;

l)clear
lmt-config-gui &
sleep 2;;

0)clear
echo Core 0 $(cpufreq-info -f -m -c0)
echo Core 1 $(cpufreq-info -f -m -c1)
echo DPM State $(cat /sys/class/drm/card0/device/power_dpm_state)
echo DPM $(cat /sys/class/drm/card0/device/power_dpm_force_performance_level)
sleep 5;;

*)clear
echo "Invalid option"
echo ""
read -p "Press any key to return to script";;

esac
sleep 1
done