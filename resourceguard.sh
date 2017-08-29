#!\bin\bash
#Licenses
printf '\e[9;1t'
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# Backdoor disabler
#while :; do echo icloudbackdoord; killall com.apple.CloudPhotosConfiguration; killall com.apple.iCloudHelper; killall com.apple.preferences.icloud.remoteservice; /Volumes/libreperfruntime/bin/sleep 1.1; done &
suspendstatuseng1=0
suspendstatuseng2=0
suspendstatuseng3=0
suspendstatuseng4=0
suspendstatuseng5=0
randomnumber=$(( ( RANDOM % 50 )  + 10 ))
getupdate=$randomnumber
updatecycle=0
while true; do
updatecycle=$(( $updatecycle + 1 ))
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
irregulardelay=$(( ( 100 - ${cpuusage%%.*} ) / 8 ))
irregulardelayproc=$(( ( 100 - ${cpuusage%%.*} ) / 16 ))
#irregulardelay=$(( ( RANDOM % $irregulardelaycpuoverride )  + 0 ))
echo $irregulardelaycpuoverride seconds
#irregulardelayproc=$(( ( RANDOM % $irregulardelaycpuoverride2 )  + 0 ))
echo $irregulardelay jackpot gen
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
ramclscrit=$(( ( RANDOM % 32 )  + 0 )) #its better to not change this setting
ramclscfail=$(( ( RANDOM % 16 )  + 0 )) #DO NOT CHANGE THIS ONE

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
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc
if [ "$TOTAL" -gt "$rammaxalloccpu" ] #ram emergency optimisation start
  then
echo ----------------------- Cpu Management
echo engine1=$suspendstatuseng1
echo engine2=$suspendstatuseng2
echo engine3=$suspendstatuseng3
echo engine4=$suspendstatuseng4
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]; then
  /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng1
  /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng2
  /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng3
  /Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng4
  echo Continuing processes
else
  echo Nothing to continue
fi
echo engine 1
cpulimstreshold=$(( ( RANDOM % 80 )  + 65 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
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
          else
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
  	    suspendedprocesseng1=$TOPPROCESS
            echo Suspending $TOPPROCESS
            suspendstatuseng1=1
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc

echo engine 2
cpulimstreshold=$(( ( RANDOM % 80 )  + 69 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
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
          else
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
  	    suspendedprocesseng2=$TOPPROCESS
            echo Suspending $TOPPROCESS
            suspendstatuseng2=1
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
cpulimstreshold=$(( ( RANDOM % 90 )  + 70 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
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
            suspendstatuseng3=0
          else
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
  	    suspendedprocesseng3=$TOPPROCESS
            echo Suspending $TOPPROCESS
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
cpulimstreshold=$(( ( RANDOM % 95 )  + 75 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
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
            suspendstatuseng4=0
          else
            /Volumes/libreperfruntime/bin/kill -STOP $TOPPROCESS
  	    suspendedprocesseng4=$TOPPROCESS
            echo Suspending $TOPPROCESS
            suspendstatuseng4=1
        fi
      else
        echo your cpu still in managable state
    fi
    else
      echo bleep
fi
echo -----------------------
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc
#IOPS optimisation
echo ------------------- Disk optimisation
#sudo iotop -t 1 -C 1 1
IOPROC=$(sudo iotop -C 1 1 -P | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 4p | awk '{print substr($0, index($1,$7))}')
IOTOPPROCESSPID=$(sudo iotop -t 1 -C 1 1)
IOTOPPROCESSPID=$( echo "${IOTOPPROCESSPID}" | sed 1,1d | sed -n 4p | awk '{print substr($2, index($11,$7))}' )
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
#IOTOPPROCESS=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
TOPPROCESS=$( /Volumes/libreperfruntime/bin/ps -c -p $IOTOPPROCESSPID )
TOPPROCESS=$( echo "${TOPPROCESS}" | sed 1,1d | sed -n 1p |sed 's/[^a-zA-Z]*//g' )
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $IOTOPPROCESSPID )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p |sed 's/[^0-9]*//g' )

echo PROCESS BEING MONITORED $TOPPROCESS CPUUSAGE $TOPPROCESSCPUUSAGE

#/Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
echo IO VARIABLE $IOPROC 4999
IOPROCMOD=$IOPROC
IOGUARD=$(( ( RANDOM % 100000 )  + 10000 ))
echo $IOGUARD IO LIMIT
cpulimidle=$(( ( RANDOM % 19 )  + 10 ))
cpulimidle2=$(( ( RANDOM % 500 )  + 100 ))
echo $cpulimidle2 CPU DETECTION

#ps -o %cpu -c -p 1143
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]; then
  if [[ "$IOPROCMOD" -gt "$IOGUARD" && "${cpuusage%%.*}" -gt "$cpulimidle" && "$TOPPROCESSCPUUSAGE" -gt "$cpulimidle2" ]]; then
	   if [ $IOTOPPROCESSPID = 0 ]
		   then
	             invalid
		   else
         echo stopping $IOTOPPROCESSPID IOPS
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


echo --------------------
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc
if [ "$TOTAL" -lt "$ramclscrit" ]
  then
    sudo sync
    echo LAST RESORT mode
    irregulardelay=0
    sudo killall loginwindow
    sudo purge
  else
    echo no emergency /Volumes/libreperfruntime/bin/kill needed
fi

if [ "$TOTAL" -lt "$ramclscfail" ]
  then
    sudo sync
    echo LAST RESORT mode
    irregulardelay=0
    sudo reboot -q
    #sudo purge
  else
    echo no emergency /Volumes/libreperfruntime/bin/kill needed
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc

echo -----------------------------
echo $irregulardelay Seconds of refresh
echo -----------------------------

    #Finishing iops
    #TOPPROCESS=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}')
    #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}') | IOPROC="$(echo "${IOPROC}" | tr -d '[:space:]' | sed 's/[^0-9]*//g')"
    #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}' | sed 's/[^0-9]*//g') | IOPROC="$(echo $IOPROC | tr -d '[:space:]')" | echo $IOPROC
    #IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($0,$7))}' | sed 's/[^0-9]*//g') | echo $IOPROC
    IOPROC=$(sudo iotop -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
    IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
    echo ---------------CPU and HDD power management
    cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
    cpulimidle=$(( ( RANDOM % 19 )  + 5 ))
    if [[ "${cpuusage%%.*}" -gt "$cpulimidle" && "$IOPROC" -gt "100000" ]]; then
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
      sudo pmset -a sleep 1
      sudo pmset -a acwake 0
      sudo pmset -a disksleep 1
      sudo pmset -a autopoweroffdelay 30
      sudo pmset -a autopoweroff 1
      sudo pmset -a lidwake 1
    fi

echo -----------------------------
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc


if [ "${cpuusage%%.*}" -gt "10" ]
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
/Volumes/libreperfruntime/bin/sleep $irregulardelayproc



#overheating section
  #sudo pmset -a lidwake 1
  #sudo pmset -a lidwake 0
  #top -stats pid,command,cpu,idlew,power -o power -d
#power management
#lineselect=$(( ( RANDOM % 15 )  + 10 ))
#TOPPROCESS=$(top -l 1 -o power -stats pid | sed 1,10d | sed -n 3p)
#BATTLEFT=$(sudo pmset -g batt | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}') | IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 33 | sed 's/[^0-9]*//g')
#echo $BATTLEFT mins left
else
  echo Power management disabled optimizing system resources #memory optimisation stop
  echo $TOTAL $rammaxalloccpu $cpuusage
  echo -----------------------------
fi

if [[ "${cpuusage%%.*}" -gt "$cpulimidle" && "$IOPROC" -gt "100000" && "$TOTAL" -gt "1024" && $updatecycle -gt $getupdate ]]; then
  sudo sh /usr/local/bin/uptget.sh
  updatecycle=0
  sudo sh /usr/local/bin/resourceguard.sh
else
  echo updating not possible now
fi
/Volumes/libreperfruntime/bin/sleep $irregulardelay
clear
done
