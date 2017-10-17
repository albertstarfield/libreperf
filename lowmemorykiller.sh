while true; do
 cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
  #irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 10 ))
  echo updatespeed $irregulardelay
 cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
  FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
  INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
  TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
  echo ------------------- Ram management
  echo Free:       $FREE MB
  echo Inactive:   $INACTIVE MB
  echo Total free: $TOTAL MB
  cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
  if [ "${cpuusage%%.*}" -gt "50" ]
    then
      sudo sysctl -w vfs.generic.sync_timeout=150
      sudo sysctl -w kern.memorystatus_sync_on_critical=5
      sudo sysctl -w kern.memorystatus_sync_on_urgent=4
      sudo sysctl -w kern.memorystatus_sync_on_warning=3
      sudo sysctl -w kern.memorystatus_apps_idle_delay_time=1
      sudo sysctl -w kern.memorystatus_sysprocs_idle_delay_time=1
      sudo sysctl -w kern.maxnbuf=1024000 #16384
      irregulardelay=1
      rammaxalloccpu=1699
      rammaxalloccrit=358
      ramminalloccpu=512
      ramminalloccrit=128
    else
      sudo sysctl -w vfs.generic.sync_timeout=27
      sudo sysctl -w kern.memorystatus_sync_on_critical=20
      sudo sysctl -w kern.memorystatus_sync_on_urgent=28
      sudo sysctl -w kern.memorystatus_sync_on_warning=30
      sudo sysctl -w kern.memorystatus_apps_idle_delay_time=1
      sudo sysctl -w kern.memorystatus_sysprocs_idle_delay_time=1
      sudo sysctl -w kern.maxnbuf=10240 #16384
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
      irregulardelay=5
  fi

  ramclslv1=$(( ( RANDOM % $rammaxalloccpu )  + 128 ))
  ramclslv2=$(( ( RANDOM % $rammaxalloccrit )  + 64 ))

  echo rammaxallocparam $ramclslv1 $ramclslv2 $ramclscrit $ramclscfail
  echo FREERAM $TOTAL MB

  lineselect=$(( ( RANDOM % 20 )  + 10 ))
  echo $lineselect > /Volumes/libreperfruntime/sys/bridge/lightLMKline
  rankmemusage=$(( $lineselect - 10 ))
  cpulimidle2=$(( ( RANDOM % 190 )  + 100 ))
  TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/lightLMK/Pname )
  TOPPROCESSMEMUSAGE=$( /Volumes/libreperfruntime/bin/cat Volumes/libreperfruntime/sys/mem/lightLMK/Pmemusage )
  echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
  TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
  echo example "$TOPPROCESS" = "WindowServer"
  if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
    then
      TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/lightLMK/PID )
      TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/lightLMK/Pcpuusage )
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
            echo $lineselect > /Volumes/libreperfruntime/sys/bridge/heavyLMKline
            TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname )
            TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
            echo Process Scanned $TOPPROCESS
            if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
              then
                TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/heavyLMK/PID )
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
