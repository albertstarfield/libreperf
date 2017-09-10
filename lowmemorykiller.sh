while true; do
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  #irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 10 ))
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
  if [ "${cpuusage%%.*}" -gt "50" ]
    then
      irregulardelay=1
      rammaxalloccpu=1024
      rammaxalloccrit=358
      ramminalloccpu=512
      ramminalloccrit=128
    else
      rammaxalloccpu=512
      rammaxalloccrit=128
      ramminalloccpu=358
      ramminalloccrit=99
  fi
  if [ "$TOTAL" -lt "$rammaxalloccpu" ]
    then
      irregulardelay=1
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
      irregulardelay=3
  fi

  ramclslv1=$(( ( RANDOM % $rammaxalloccpu )  + 128 ))
  ramclslv2=$(( ( RANDOM % $rammaxalloccrit )  + 64 ))

  echo rammaxallocparam $ramclslv1 $ramclslv2 $ramclscrit $ramclscfail
  echo FREERAM $TOTAL MB

  lineselect=$(( ( RANDOM % 20 )  + 10 ))
  rankmemusage=$(( $lineselect - 10 ))
  cpulimidle2=$(( ( RANDOM % 270 )  + 100 ))
  TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
  TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | sed 1,"$lineselect"d | sed -n 3p)
  echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
  TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
  echo example "$TOPPROCESS" = "WindowServer"
  if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
    then
      TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
      TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $TOPPROCESS )
      TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
      if [ "$TOTAL" -lt "$ramclslv1" ]
        then
          irregulardelay=0
          if [ "$TOPPROCESSCPUUSAGE" -lt "$cpulimidle2" ]
            then
              echo INNOCENT PROCESS
            else
              sudo /Volumes/libreperfruntime/bin/kill -9 $TOPPROCESS
              echo Sacrificing bg apps $TOPPROCESS
              echo Memory freed
          fi
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
  if [ "$TOTAL" -lt "2048" ];
    then
      echo Prefetching
    else
      sudo killall ls
      sudo killall rsync
      sudo killall periodic
  fi
sleep $irregulardelay
done
