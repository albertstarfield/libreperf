#!/bin/bash
while true; do
  #powersavinglinepatch
  rescman=$( /libreperfruntime/bin/cat /libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 128 )  + 32 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
irregulardelay=$(( ( ${cpuusage%%.*} ) / 2 ))
echo updatespeed $irregulardelay
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
sleep $irregulardelay
  echo -----------------------------
  batterylevel=$( ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}' | sed 's/[^0-9]*//g' )
      #Finishing iops
      #TOPPROCESS=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}')
      #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}') | IOPROC="$(echo "${IOPROC}" | tr -d '[:space:]' | sed 's/[^0-9]*//g')"
      #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}' | sed 's/[^0-9]*//g') | IOPROC="$(echo $IOPROC | tr -d '[:space:]')" | echo $IOPROC
      #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}' | sed 's/[^0-9]*//g') | echo $IOPROC
      IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
      IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
      echo ---------------CPU and HDD power management
      cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
      cpulimidle=$(( ( RANDOM % 25 )  + 5 ))
      if [[ "${cpuusage%%.*}" -gt "$cpulimidle" && "$IOPROC" -gt "1" ]]; then
        echo Suspending Power management system IO is busy
        echo $IOPROC Disk Operation
        echo $cpuusage percent of cpu time cycle used
        deepsleep=$(( ${cpuusage%%.*} - $cpulimidle ))
        echo $deepsleep minutes
        sudo pmset -a sleep $deepsleep
        sudo pmset -a acwake 1
        sudo pmset -a disksleep 255
        sudo pmset -a autopoweroffdelay 0
        sudo pmset -a autopoweroff 0
        sudo pmset -a lidwake 0
      else
        echo Power management is ON
        cd /Users/; for i in *; do sudo -u "$i" osascript -e 'display notification "Optimizing power usage" with title "SystemAI"'; done
        sudo pmset -a sleep 1
        sudo pmset -a acwake 0
        sudo pmset -a disksleep 1
        sudo pmset -a autopoweroffdelay 30
        sudo pmset -a autopoweroff 1
        sudo pmset -a lidwake 1
      fi
sleep $irregulardelay
      if [ "${cpuusage%%.*}" -gt "15" ]
        then
          displaysleep=$(( ${cpuusage%%.*} - 40 ))
          echo $displaysleep minutes display idle
          sudo pmset -a displaysleep $displaysleep
          sudo killall ls
          sudo killall rsync
        else
          sudo pmset -a displaysleep 1
          echo hi
      fi
sleep $irregulardelay
  echo -----------------------------
done
