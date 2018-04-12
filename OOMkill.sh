#!/bin/bash
sudo sh /libreperfruntime/lowmemorykiller.sh &
while true; do
  #powersavinglinepatch
  rescman=$( /libreperfruntime/bin/cat /libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 64 )  + 32 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
  cpuusage=$( /libreperfruntime/bin/cat /libreperfruntime/sys/cpu/cpuusage )
  irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 4 ))
  FREE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/free )
  INACTIVE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/inactive )
  TOTAL=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
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
      echo no emergency /libreperfruntime/bin/kill needed
  fi

  if [ "$TOTAL" -lt "$ramclscfail" ]
    then
      sudo sync
      echo LAST RESORT mode
      irregulardelay=0
      sudo reboot -q
      #sudo purge
    else
      echo no emergency /libreperfruntime/bin/kill needed
  fi
echo --------------------
sleep 3
done
