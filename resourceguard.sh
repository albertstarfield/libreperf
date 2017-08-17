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
#while :; do echo icloudbackdoord; killall com.apple.CloudPhotosConfiguration; killall com.apple.iCloudHelper; killall com.apple.preferences.icloud.remoteservice; sleep 1.1; done &
suspendstatus=1
while true; do
irregulardelay=$(( ( RANDOM % 19 )  + 0 ))
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
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" ]]
  then
    TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "$TOTAL" -lt "$ramclslv1" ]
      then
        irregulardelay=0
        sudo kill -9 $TOPPROCESS
        echo Memory freed
        if [ "$TOTAL" -lt "$ramclslv2" ]
        then
          lineselect=$(( ( RANDOM % 15 )  + 10 ))
          TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
          TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
          echo Process Scanned $TOPPROCESS
          if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" ]]
            then
              TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
              sudo kill -9 $TOPPROCESS
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
echo ----------------------- Cpu Management
cpulimstreshold=$(( ( RANDOM % 80 )  + 29 ))
lineselect=$(( ( RANDOM % 20 )  + 10 ))
rankcpuusage=$(( $lineselect - 10 ))
echo $cpulimstreshold percent limit
TOPPROCESS=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo Process Intimidated $TOPPROCESS $TOPPROCESSCPUUSAGE rank $lineselect
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" ]]
  then
    TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
    if [ "${cpuusage%%.*}" -gt "$cpulimstreshold" ]
      then
        irregulardelay=0
        if [ $suspendstatus = "1" ]
          then
            kill -CONT $TOPPROCESS
            echo Unsuspending $TOPPROCESS
            suspendstatus=0
          else
            kill -STOP $TOPPROCESS
            echo Suspending $TOPPROCESS
            suspendstatus=1
        fi
      else
        echo your cpu still in managable started
    fi
    else
      echo bleep
fi
echo -----------------------






if [ "$TOTAL" -lt "$ramclscrit" ]
  then
    sudo sync
    echo LAST RESORT mode
    irregulardelay=0
    sudo killall loginwindow
    sudo purge
  else
    echo no emergency kill needed
fi

if [ "$TOTAL" -lt "$ramclscfail" ]
  then
    sudo sync
    echo LAST RESORT mode
    irregulardelay=0
    sudo reboot
    #sudo purge
  else
    echo no emergency kill needed
fi
echo -----------------------------
echo $irregulardelay Seconds of refresh
echo -----------------------------
if [ "$TOTAL" -gt "$rammaxalloccpu" ]
  then
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
      echo $deepsleep deepsleep minutes
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
  else
    echo Power management disabled optimizing system resources
    echo $TOTAL $rammaxalloccpu $cpuusage
fi
echo -----------------------------

if [ "${cpuusage%%.*}" -gt "40" ]
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

#overheating section
  #sudo pmset -a lidwake 1
  #sudo pmset -a lidwake 0
  #top -stats pid,command,cpu,idlew,power -o power -d
#power management
#lineselect=$(( ( RANDOM % 15 )  + 10 ))
#TOPPROCESS=$(top -l 1 -o power -stats pid | sed 1,10d | sed -n 3p)
#BATTLEFT=$(sudo pmset -g batt | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}') | IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 33 | sed 's/[^0-9]*//g')
#echo $BATTLEFT mins left


sleep $irregulardelay
clear
done
