while true; do

cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
irregulardelay=$(( ( ${cpuusage%%.*} ) / 3 ))
irregulardelayproc=$irregulardelay
echo ----------------------- Cpu Management
echo engine1=$suspendstatuseng1
echo engine2=$suspendstatuseng2
echo engine3=$suspendstatuseng3
echo engine4=$suspendstatuseng4
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]; then
  echo Continuing processes
else
  echo Nothing to continue
fi
echo engine 1
cpulimstreshold=$(( ( RANDOM % 3600 )  + 3005 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo Process Intimidated $TOPPROCESS $TOPPROCESSCPUUSAGE rank $lineselect
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]
  then
    TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "${cpuusage%%.*}" -gt "$cpulimstreshold" ]
      then
        if [ $suspendstatuseng1 = "1" ]
          then
            /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng1
            echo Unsuspending $suspendedprocesseng1
            suspendstatuseng1=0
	          sudo renice -n 0 $suspendedprocesseng1
          else
          echo $TOPPROCESS
  	    suspendedprocesseng1=$TOPPROCESS
            echo Suspending $TOPPROCESS
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
            suspendstatuseng1=1
            sudo renice -n 20 $TOPPROCESS
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc

echo engine 2
cpulimstreshold=$(( ( RANDOM % 3600 )  + 3400 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo Process Intimidated $TOPPROCESS $TOPPROCESSCPUUSAGE rank $lineselect
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
  then
    TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "${cpuusage%%.*}" -gt "$cpulimstreshold" ]
      then
        if [ $suspendstatuseng2 = "1" ]
          then
            /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng2
            echo Unsuspending $suspendedprocesseng2
            suspendstatuseng2=0
            sudo renice -n 0 $suspendedprocesseng2
          else
          echo $TOPPROCESS
  	    suspendedprocesseng2=$TOPPROCESS
            echo Suspending $TOPPROCESS
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
            suspendstatuseng2=1
            sudo renice -n 20 $TOPPROCESS
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc
echo -----------------Thermal Impact
echo engine 1
cpulimstreshold=$(( ( RANDOM % 9000 )  + 7000 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo Process Intimidated $TOPPROCESS pwr $TOPPROCESSPOWERUSAGE line $lineselect
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
  then
    TOPPROCESS=$(top -l 2 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "${cpuusage%%.*}" -gt "$cpulimstreshold" ]
      then
        if [ $suspendstatuseng3 = "1" ]
          then
            /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng3
            echo Unsuspending $suspendedprocess3
            sudo renice -n 0 $suspendedprocesseng3
            suspendstatuseng3=0
          else
          echo $TOPPROCESS
  	    suspendedprocesseng3=$TOPPROCESS
            echo Suspending $TOPPROCESS
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
            sudo renice -n 20 $TOPPROCESS
            suspendstatuseng3=1
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc

echo engine 2
cpulimstreshold=$(( ( RANDOM % 9500 )  + 7500 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
sleep 1
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo Process Intimidated $TOPPROCESS pwr $TOPPROCESSPOWERUSAGE line $lineselect
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" ]]
  then
    TOPPROCESS=$(top -l 2 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "${cpuusage%%.*}" -gt "$cpulimstreshold" ]
      then
        if [ $suspendstatuseng4 = "1" ]
          then
            /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng4
            echo Unsuspending $suspendedprocesseng4
            sudo renice -n 0 $suspendedprocesseng4
            suspendstatuseng4=0
          else
          echo $TOPPROCESS
  	    suspendedprocesseng4=$TOPPROCESS
            echo Suspending $TOPPROCESS
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
            sudo renice -n 20 $TOPPROCESS
            suspendstatuseng4=1
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi

sleep 4
done
