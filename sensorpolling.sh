
#!/bin/bash
mkdir /Volumes/libreperfruntime/sys
mkdir /Volumes/libreperfruntime/sys/mem
mkdir /Volumes/libreperfruntime/sys/mem/lightLMK
mkdir /Volumes/libreperfruntime/sys/mem/heavyLMK
mkdir /Volumes/libreperfruntime/sys/cpu
mkdir /Volumes/libreperfruntime/sys/cpu/enginesuspender1
mkdir /Volumes/libreperfruntime/sys/cpu/enginesuspender2
mkdir /Volumes/libreperfruntime/sys/cpu/enginesuspender3
mkdir /Volumes/libreperfruntime/sys/cpu/enginesuspender4
mkdir /Volumes/libreperfruntime/sys/temp
mkdir /Volumes/libreperfruntime/sys/IOstats
mkdir /Volumes/libreperfruntime/sys/energy
mkdir /Volumes/libreperfruntime/sys/hwmorph
mkdir /Volumes/libreperfruntime/sys/bridge
cycleuptime=0
alias grep='/Volumes/libreperfruntime/subbin/grep'
alias sed='/Volumes/libreperfruntime/subbin/sed'
alias awk='/Volumes/libreperfruntime/subbin/awk'
alias top='/Volumes/libreperfruntime/subbin/top'
alias tr='/Volumes/libreperfruntime/subbin/tr'
alias iotop='/Volumes/libreperfruntime/subbin/iotop'
initflag=0
#tempfilemigrationramdisk
sudo cp -r /usr/local/lbpbin/ramavailable /Volumes/libreperfruntime/sys/mem/
sudo cp -r /usr/local/lbpbin/ramavailablealloc /Volumes/libreperfruntime/sys/mem/
sudo cp -r /usr/local/lbpbin/ramavailableallocbytes /Volumes/libreperfruntime/sys/mem/
sudo cp -r /usr/local/lbpbin/ramdisksize /Volumes/libreperfruntime/sys/mem/
sudo cp -r /usr/local/lbpbin/ramdiskalloc /Volumes/libreperfruntime/sys/mem/
sudo cp -r /usr/local/lbpbin/ramdiskallocbytes /Volumes/libreperfruntime/sys/mem/
#migrationend
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
cpuusage=$( echo ${cpuusage%%.*} )
idlog=$(( ( RANDOM % 1000 )  + 1 ))
sudo mkdir /var/log/libreperfkernelmanagement
sudo mkdir /var/log/libreperfkernelmanagement/$idlog
echo libreperf > /Volumes/libreperfruntime/sys/rescman


while true; do
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
cpuusage=$( echo ${cpuusage%%.*} )
echo hybrid management system
echo stats system
cputrig=$(( ( RANDOM % 50 )  + 27 ))

cycleuptime=$(( $cycleuptime + 1 ))
echo $cycleuptime
echo $cycleuptime > /Volumes/libreperfruntime/sys/uptimecycle


irregulardelay=$(( ( ${cpuusage%%.*} ) / 7 ))
irregulardelayprocdec=9

if [ $irregulardelay -lt 1 ]; then
  irregulardelay=1
else
  echo delay not foobar
fi
#memory block checking
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
FREE=$((($FREE_BLOCKS+$SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
TOTAL=$((($FREE+$INACTIVE)))
echo $FREE > /Volumes/libreperfruntime/sys/mem/free
echo $INACTIVE > /Volumes/libreperfruntime/sys/mem/inactive
echo $TOTAL > /Volumes/libreperfruntime/sys/mem/total
#refreshramdiskkernelcontent
sudo cp -r /Volumes/libreperfruntime/binsync/ /Volumes/libreperfruntime

#memoryblockspacecachecheck
#they're using kibibytes
cachefree=$(df -Pk /Volumes/systemcacheblock0 | sed 1d | grep -v used | awk '{ print $4 "\t" }')
prefetchfree=$(df -Pk /Volumes/prefetchblock0 | sed 1d | grep -v used | awk '{ print $4 "\t" }')

systemdiskfree=$(df -Pk / | sed 1d | grep -v used | awk '{ print $4 "\t" }')
echo $cachefree > /Volumes/libreperfruntime/sys/mem/cachefree
echo $prefetchfree > /Volumes/libreperfruntime/sys/mem/prefetchfree
#lightLMK

#patch for unsyncronized module killing
echo loginwindow > /Volumes/libreperfruntime/sys/mem/lightLMK/Pname
echo loginwindow > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname
echo unidentified > /Volumes/libreperfruntime/sys/mem/lightLMK/PID
echo unidentified > /Volumes/libreperfruntime/sys/mem/heavyLMK/PID

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lightLMKline )
TOPPROCESS=$(top -l 1 -o MEM -stats command | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/lightLMK/Pname
TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSMEMUSAGE > /Volumes/libreperfruntime/sys/mem/lightLMK/Pmemusage
TOPPROCESS=$(top -l 1 -o MEM -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/lightLMK/PID
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $TOPPROCESS )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/mem/lightLMK/Pcpuusage
echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
#heavyLMK
lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/heavyLMKline )
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname
TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSMEMUSAGE > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pmemusage
TOPPROCESS=$(top -l 1 -o MEM -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/heavyLMK/PID
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $TOPPROCESS )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pcpuusage
echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage


sleep 0.$irregulardelayprocdec
#CPUUSAGE
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
cpuusage=$( echo ${cpuusage%%.*} )
# to read sys data /Volumes/libreperfruntime/bin/cat
if [ $cpuusage -gt 10 ]
  then
#checking processcpuusage
lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine1 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine2 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine3 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine4 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | grep -v root | grep -v _coreaudiod | grep -v _windowserver | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/PID
sleep 0.$irregulardelayprocdec
  else
    echo halting scan process saving resources entering power save mode
fi

echo $cpuusage > /Volumes/libreperfruntime/sys/cpu/cpuusage
sleep 0.$irregulardelayprocdec

if [[ $cpuusage -lt "50" && $FREE -gt "382" ]]; then
#checkIOSTATS
IOPROC=$(sudo iotop -C 1 1 -P | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
sleep 0.$irregulardelayprocdec
#TOP PROCESS IO USAGE
IOTOPPROCESSPID=$(sudo iotop -t 1 -C 1 1)
IOTOPPROCESSPID=$( echo "${IOTOPPROCESSPID}" | sed 1,1d | sed -n 4p | awk '{print substr($2, index($11,$7))}' )
sleep 0.$irregulardelayprocdec
#search process name
TOPPROCESS=$( /Volumes/libreperfruntime/bin/ps -c -p $IOTOPPROCESSPID )
TOPPROCESS=$( echo "${TOPPROCESS}" | sed 1,1d | sed -n 1p | sed 's/[^a-zA-Z]*//g' )
sleep 0.$irregulardelayprocdec
#checkingcpuusageof the PROCESS
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $IOTOPPROCESSPID )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $IOPROC > /Volumes/libreperfruntime/sys/IOstats/IOPROC
echo $IOTOPPROCESSPID > /Volumes/libreperfruntime/sys/IOstats/IOTOPPROCESSPID
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESS
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESSCPUUSAGE
  else
    echo IO dtrace resource busy
    echo might be fixed by flushing cache and adding additional memory
    echo 0 > /Volumes/libreperfruntime/sys/IOstats/IOPROC
    echo 999999 > /Volumes/libreperfruntime/sys/IOstats/IOTOPPROCESSPID
    echo dtrace > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESS
    echo 0 > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESSCPUUSAGE
fi
sleep 0.$irregulardelayprocdec
#batteryleft
batterylevel=$( ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}' | sed 's/[^0-9]*//g' )
echo $batterylevel > /Volumes/libreperfruntime/sys/energy/batt
sleep 0.$irregulardelayprocdec
#clamshell status
clamshellinfo=$(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -1 | sed -n 1p)
clamshellinfo=$( echo "${clamshellinfo}" | sed 's/[^A-Z]*//g' )
echo $clamshellinfo > /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo
sleep 0.$irregulardelayprocdec
#temprature
temp=$( /Volumes/libreperfruntime/bin/cycletmpcheck )
temp=$( echo "${temp}" | tr -d '[:space:]' | sed 's/[^0-9]*//g' )
if [ $initflag -lt 1 ]
  then
    initflag=1
  else
    echo Initialized already
fi
echo $temp > /Volumes/libreperfruntime/sys/temp/cputherm
sleep 0.$irregulardelayprocdec
cp -f -a /Volumes/libreperfruntime/sys/ /var/log/libreperfkernelmanagement/$idlog
echo $irregulardelay
sleep $irregulardelay
if [[ $cpuusage -gt $cputrig && $initflag -lt 1 && $TOTAL -lt 2048 ]]; then
  echo Using Monstrous Resource Management libreperf
  echo libreperf > /Volumes/libreperfruntime/sys/rescman
else
  echo Using efficient APPLE subsystem management
  echo apple > /Volumes/libreperfruntime/sys/rescman
  coalescingsleep=$(( ( RANDOM % 278 )  + 36 ))
  sleep $coalescingsleep
  FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
  INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
  SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
  FREE=$((($FREE_BLOCKS+$SPECULATIVE_BLOCKS)*4096/1048576))
  INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
  TOTAL=$((($FREE+$INACTIVE)))
  initflag=0
fi

done
