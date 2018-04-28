#!/bin/bash
sleep 60
while true; do
if [ ! -d "/libreperfruntime/sys" ] || [ ! -d "/libreperfruntime/binsync" ] || [ ! -d "/libreperfruntime/bin" ] || [ ! -d "/libreperfruntime/subbin" ] || [ ! -d "/libreperfruntime/plugins" ] || [ ! -d "/zramblock0" ]; then
echo ramdisk kernel integrity failed 0x1
#sudo dtrace -w -n "BEGIN{ panic();}"
sudo sync &
#sudo purge
#sudo reboot -q

PROCESS=diskimages-helper
number=$(ps aux | grep $PROCESS | wc -l)
if [ $number -gt 0 ]
    then
        echo Warm Boot Detected
        killall -KILL $PROCESS
    else
        echo Cold boot detected
fi
sudo killall -KILL sh
sudo sh /usr/local/bin/libreperf.sh
#sensorpolling backup

sleep 1080
  else
    echo ramdisk kernel integrity verified 0x0
  fi
sleep 5
done
