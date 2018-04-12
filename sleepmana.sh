#!/bin/bash
while true; do
  #powersavinglinepatch
  rescman=$( /libreperfruntime/bin/cat /libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 128 )  + 64 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
#   |   "AppleClamshellState" = No
#   |   "AppleClamshellState" = Yes
clamshellinfo=$( /libreperfruntime/bin/cat /libreperfruntime/sys/hwmorph/clamshellinfo )
echo $clamshellinfo
echo SLEEP CACHING MANAGER
sleep 1
FREE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/free )
INACTIVE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/inactive )
TOTAL=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
if [ $clamshellinfo = ACSY ]
  then
    echo lid closed
    if [ "$TOTAL" -gt "1024" ];
      then
        osascript -e 'display notification "Prefetching files" with title "libreperf"'
        rsync -rva /Applications/
        sudo periodic daily weekly monthly &
        ls -R /Applications/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
        ls -R /Users/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
        clamshellinfo=$( /libreperfruntime/bin/cat /libreperfruntime/sys/hwmorph/clamshellinfo )
        batterylevel=$( /libreperfruntime/bin/cat /libreperfruntime/sys/energy/batt )
        wakelockmax=$(( $batterylevel * 3 ))
        wakelock=$(( ( RANDOM % $wakelockmax )  + $batterylevel ))
        sleep $wakelock
        if [ $clamshellinfo = ACSY ]
          then
            pmset sleepnow
          else
            echo done CACHING
        fi
      else
        echo wont cache memory is in full load
    fi
  else
    echo lid opened
fi
done
