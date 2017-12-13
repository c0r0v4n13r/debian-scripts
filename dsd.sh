sudo modprobe snd-aloop
padsp -- dsd -e -fr -i '/dev/dsp' -o /dev/dsp -w ~/ment-$(date +%Y-%m-%d_%H-%M-%S).wav