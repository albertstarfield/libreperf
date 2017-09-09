#!/bin/bash
sleep 10
while true; do
if [ ! -d "/Volumes/libreperfruntime/" ]; then
sudo sh /usr/local/bin/libreperf.sh
  else
    echo volume exist
  fi
sleep 1
done
