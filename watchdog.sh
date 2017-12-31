#!/bin/bash
sleep 1080
while true; do
if [ ! -d "/Volumes/libreperfruntime/binsync" ] || [ ! -d "/Volumes/libreperfruntime/bin" ] || [ ! -d "/Volumes/libreperfruntime/subbin" ] || [ ! -d "/Volumes/systemcacheblock0" ] || [ ! -d "/Volumes/fastcache" ]; then
echo ramdisk kernel integrity failed 0x1
sudo sync &
#sudo purge
#sudo killall -KILL sh
sudo sh /usr/local/bin/libreperf.sh
sleep 1080
  else
    echo ramdisk kernel integrity verified 0x0
  fi
sleep 5
done
