while true; do
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 10 ))
  echo updatespeed $irregulardelay
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
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
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  sleep $irregulardelay
  if [ "$TOTAL" -lt "1024" ]
    then
      echo your memory is running out $TOTAL MB
      if [ "${cpuusage%%.*}" -lt "10" ]
        then
          echo syncing
          sudo sync
        else
          echo not syncing
          #echo but the scarce of resources makes me not to do the job
      fi
    else
      #echo your memory still in good shape $TOTAL MB
      echo not bad
  fi
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  if [ "${cpuusage%%.*}" -gt "90" ]
    then
      rammaxalloccpu=720
      rammaxalloccrit=256
    else
      rammaxalloccpu=512
      rammaxalloccrit=128
  fi
  ramclslv1=$(( ( RANDOM % $rammaxalloccpu )  + 128 ))
  ramclslv2=$(( ( RANDOM % $rammaxalloccrit )  + 64 ))

sleep $irregulardelay
  echo rammaxallocparam $ramclslv1 $ramclslv2 $ramclscrit $ramclscfail
  echo FREERAM $TOTAL MB

  lineselect=$(( ( RANDOM % 20 )  + 10 ))
  rankmemusage=$(( $lineselect - 10 ))

  TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
  TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | sed 1,"$lineselect"d | sed -n 3p)
  echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
  TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"

  echo example "$TOPPROCESS" = "WindowServer"
  if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
    then
      TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
      if [ "$TOTAL" -lt "$ramclslv1" ]
        then
          irregulardelay=0
          sudo /Volumes/libreperfruntime/bin/kill -9 $TOPPROCESS
          echo Memory freed
          if [ "$TOTAL" -lt "$ramclslv2" ]
          then
            lineselect=$(( ( RANDOM % 15 )  + 10 ))
            TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
            TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
            echo Process Scanned $TOPPROCESS
            if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
              then
                TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
                sudo /Volumes/libreperfruntime/bin/kill -9 $TOPPROCESS
                osascript -e 'display notification "Memory have reached the limit sacrificed $TOPPROCESS" with title "libreperf"'
                irregulardelay=0
              fi
            else
              echo LMK finished
            fi
          else
            echo LMK IS NOT ACTIVATED YET
          fi
        else
          echo wrong processes
  fi
sleep 10
done
