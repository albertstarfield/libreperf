#!/bin/bash
while true; do
#   |   "AppleClamshellState" = No
#   |   "AppleClamshellState" = Yes
clamshellinfo=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo )
echo $clamshellinfo
echo SLEEP CACHING MANAGER
sleep 1
FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
if [ $clamshellinfo = ACSY ]
  then
    echo lid closed
    if [ "$TOTAL" -gt "1024" ];
      then
        osascript -e 'display notification "Prefetching files" with title "libreperf"'
        sudo open -a /Applications/*.app &
        rsync -rva /
        sudo periodic daily weekly monthly &
        ls -R / | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
        ls -R /Volumes/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
        clamshellinfo=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo )
        wakelock=$(( ( RANDOM % 100 )  + 60 ))
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
