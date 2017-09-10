#!/bin/bash
while true; do
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 4 ))
  FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
  INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
  SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
  FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS) * 4096 / 1048576))
  INACTIVE=$(($INACTIVE_BLOCKS * 4096 / 1048576))
  TOTAL=$((($FREE+$INACTIVE)))
  echo ------------------- Ram management
  echo Free:       $FREE MB
  echo Inactive:   $INACTIVE MB
  echo Total free: $TOTAL MB
echo emergencycrash
#ramclscrit=$(( ( RANDOM % 32 )  + 0 )) #its better to not change this setting
#ramclscfail=$(( ( RANDOM % 16 )  + 0 )) #DO NOT CHANGE THIS ONE
ramclscrit=64
ramclscfail=32
sleep $irregulardelay
  if [ "$TOTAL" -lt "$ramclscrit" ]
    then
      sudo sync
      echo LAST RESORT mode
      irregulardelay=0
      sudo killall loginwindow
      sudo purge
    else
      echo no emergency /Volumes/libreperfruntime/bin/kill needed
  fi

  if [ "$TOTAL" -lt "$ramclscfail" ]
    then
      sudo sync
      echo LAST RESORT mode
      irregulardelay=0
      sudo reboot -q
      #sudo purge
    else
      echo no emergency /Volumes/libreperfruntime/bin/kill needed
  fi
echo --------------------
sleep 3
done
