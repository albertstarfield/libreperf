#!/bin/bash
delay=$(( ( RANDOM % 600 )  + 412 ))
sleep $delay
while true; do
  #powersavinglinepatch
  rescman=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/rescman )
  if [ $rescman = apple ]
    then
      echo apple management resource mode
      coalescingsleep=$(( ( RANDOM % 256 )  + 100 ))
      sleep $coalescingsleep
    else
      echo libreperf management mode
  fi

cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
irregulardelay=$(( ( ${cpuusage%%.*} ) / 4 ))

FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
echo Free:       $FREE MB
echo Inactive:   $INACTIVE MB
echo Total free: $TOTAL MB
if [[ ${cpuusage%%.*} -gt 15 && ${cpuusage%%.*} -lt 77 && $FREE -gt 128 ]]; then
echo ------------------- Disk optimisation
#sudo iotop -t 1 -C 1 1
IOPROC=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/IOPROC )
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 4p | awk '{print substr($0, index($1,$7))}')
sleep 1
IOTOPPROCESSPID=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/IOTOPPROCESSPID )
sleep 1
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
#IOTOPPROCESS=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/TOPPROCESS )
sleep 1
TOPPROCESSCPUUSAGE=$( /Volume/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/TOPPROCESSCPUUSAGE )
sleep 1
echo PROCESS BEING MONITORED $TOPPROCESS $IOTOPPROCESSPID CPUUSAGE $TOPPROCESSCPUUSAGE
sudo renice -n 20 $TOPPROCESSPID
#/Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
echo IO VARIABLE $IOPROC 4999
IOPROCMOD=$IOPROC
IOGUARD=$(( ( RANDOM % 10000 )  + 1000 ))
echo $IOGUARD IO LIMIT
cpulimidle=$(( ( RANDOM % 15 )  + 4 ))
cpulimidle2=$(( ( RANDOM % 50 )  + 20 ))
echo $cpulimidle2 CPU DETECTION
sleep $irregulardelay
if [ $IOPROC -gt "5000" ]
  then
    sudo sysctl -w kern.maxfiles=100000
    sudo sysctl -w kern.maxfilesperproc=50 #9990000
    sudo sysctl -w kern.sysv.shmmax=2560
    sudo launchctl limit maxfiles 75 10000
  else
    sudo sysctl -w kern.maxfiles=19990000
    sudo sysctl -w kern.maxfilesperproc=9990000 #9990000
    sudo sysctl -w kern.sysv.shmmax=1610612736
    sudo launchctl limit maxfiles 1000000 1000000
fi
sleep 0.$irregulardelay
#ps -o %cpu -c -p 1143
/Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]; then
  if [[ "$IOPROCMOD" -gt "$IOGUARD" && "${cpuusage%%.*}" -gt "$cpulimidle" && "$TOPPROCESSCPUUSAGE" -lt "$cpulimidle2" ]]; then
     if [ $IOTOPPROCESSPID = 0 ]
		   then
	             invalid
		   else
         echo stopping $IOTOPPROCESSPID IOPS
         osascript -e 'display notification "your computer might be slower culprit $TOPPROCESS" with title "libreperf"'
         /Volumes/libreperfruntime/bin/kill -STOP $IOTOPPROCESSPID
         suspendedprocesseng5=$IOTOPPROCESSPID
         echo Suspending $IOTOPPROCESSPID
         suspendstatuseng5=1
	      fi
      else
        echo continuing $IOTOPPROCESSPID IOPS
        /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
        echo Unsuspending $suspendedprocesseng5
        suspendstatuseng5=0
      fi
    else
    echo Guarding system memory
fi
sleep 2

FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
clamshellinfo=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo )
if [[ $clamshellinfo = ACSN && $TOTAL -lt "2500" ]]; then
    sudo killall periodic
    sudo killall rsync
    sudo killall ls
  else
    echo awaiting the moment
fi
  else
    echo High demand resources mode enabled
    sleep 10
fi
sleep 5
echo --------------------
done
