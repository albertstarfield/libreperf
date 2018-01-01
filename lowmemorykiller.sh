#!/bin/bash
echo Initializing
sleep 180
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
ramlim=$(( $TOTAL / 4 ))
ramlimcrit=$(( $TOTAL - ( $TOTAL / 5 ) ))
cycleramlim=0
while true; do
  #powersavinglinepatch
  rescman=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 32 )  + 16 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi
echo powersavingpatch
echo Resourceguard_legacy
cycleramlim=$(( $cycleramlim + 1 ))
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
      rammaxalloccpu=1024
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
if [[ $cycleramlim -gt 64 && $TOTAL -gt 1024 ]];then
      echo Doing some memory usage calibration
      TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
      ramlim=$(( $TOTAL / 2 ))
      ramlimcrit=$(( $TOTAL - ( $TOTAL / 4 ) ))
      cycleramlim=0
   else
      echo memory management does not need calibration yet
fi
if [ $TOTAL -lt 1000 ]
   then
      rammaxalloccpu=$ramlim
      rammaxalloccrit=$ramlimcrit
      ramminalloccpu=$ramlim
      ramminalloccrit=$ramlimcrit
   else
      echo awaiting for another adjustment
fi
if [ $TOTAL -gt 1667 ]
  then
      rammaxalloccpu=512
      rammaxalloccrit=128
      ramminalloccpu=358
      ramminalloccrit=99
  else
      echo awaiting for another adjustment
fi

if [[ $TOTAL -lt 1500 && "${cpuusage%%.*}" -gt "30" ]]; then
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
FREE=$((($FREE_BLOCKS+$SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
TOTAL=$((($FREE+$INACTIVE)))
echo $FREE > /Volumes/libreperfruntime/sys/mem/free
echo $INACTIVE > /Volumes/libreperfruntime/sys/mem/inactive
echo $TOTAL > /Volumes/libreperfruntime/sys/mem/total
if [[ $TOTAL -lt 1000 && $cpuusage -gt 60 && $cpuusage -lt 80 ]]; then
    irregulardelay=1
    irregulardelayprocdec=1
  else
    irregulardelay=3
fi
#lightLMK
#patch for unsyncronized module killing
echo loginwindow > /Volumes/libreperfruntime/sys/mem/lightLMK/Pname
echo loginwindow > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname
echo unidentified > /Volumes/libreperfruntime/sys/mem/lightLMK/PID
echo unidentified > /Volumes/libreperfruntime/sys/mem/heavyLMK/PID

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lightLMKline )
TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/lightLMK/Pname
TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSMEMUSAGE > /Volumes/libreperfruntime/sys/mem/lightLMK/Pmemusage
TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/lightLMK/PID
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $TOPPROCESS )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pcpuusage
echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
	else
	   echo using normal pipeline
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
  echo example "$TOPPROCESS" = "WindowServer"
  if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
    then
      TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/lightLMK/PID )
      TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/lightLMK/Pcpuusage )
      if [ "$TOTAL" -lt "$ramclslv1" ]
        then
          irregulardelay=$irregulardelay
          if [ "$TOPPROCESSCPUUSAGE" -lt "$cpulimidle2" ]
            then
              echo INNOCENT PROCESS
            else
              echo $TOPPROCESS > /Volumes/libreperfruntime/sys/killconfirm
              echo Sacrificing bg apps $TOPPROCESS
              echo Memory freed
          fi
          if [ "$TOTAL" -lt "$ramclslv2" ]
          then
            lineselect=$(( ( RANDOM % 15 )  + 10 ))
            echo $lineselect > /Volumes/libreperfruntime/sys/bridge/heavyLMKline
            TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname )

            echo Process Scanned $TOPPROCESS
            if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
              then
                TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/heavyLMK/PID )
                echo $TOPPROCESS > /Volumes/libreperfruntime/sys/killconfirm
                osascript -e 'display notification "Memory have reached the limit sacrificed $TOPPROCESS" with title "libreperf"'
                irregulardelay=$irregulardelay
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
