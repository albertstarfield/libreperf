#!/bin/bash
while true; do
#   |   "AppleClamshellState" = No
#   |   "AppleClamshellState" = Yes
clamshellinfo=$(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | sed -n 1p)
clamshellinfo=$( echo "${clamshellinfo}" | sed 's/[^A-Z]*//g' )
echo $clamshellinfo
echo SLEEP CACHING MANAGER

sleep 1
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS) * 4096 / 1048576))
INACTIVE=$(($INACTIVE_BLOCKS * 4096 / 1048576))
TOTAL=$((($FREE+$INACTIVE)))
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
        clamshellinfo=$(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | sed -n 1p)
        clamshellinfo=$( echo "${clamshellinfo}" | sed 's/[^A-Z]*//g' )
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
