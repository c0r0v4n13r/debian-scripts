#!/bin/bash

clear
while true
do
n="$(grep -c open /proc/acpi/button/lid/LID/state)"
##echo "$n"
case $n in

1)sleep 5;;

0)
cpufreq-set -g userspace -c0
cpufreq-set -g userspace -c1
cpufreq-set -f 850 MHz -c0
cpufreq-set -f 850 MHz -c1
echo low > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo battery > /sys/class/drm/card0/device/power_dpm_state
sleep 5;;

*)sleep 5;;

esac
sleep 5
done
