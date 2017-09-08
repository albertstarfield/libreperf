#!/bin/bash
while true; do
if [ ! -d "/Volumes/libreperfruntime/" ]; then
sudo sh /usr/local/bin/libreperf.sh
  else
    echo volume exist
  fi
sleep 5
done
