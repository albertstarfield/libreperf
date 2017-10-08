
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
while true; do
cycleuptime=$(( $cycleuptime + 1 ))
echo $cycleuptime > /Volumes/libreperfruntime/sys/uptimecycle
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
cpuusage=$( echo ${cpuusage%%.*} )
irregulardelay=$(( ( ${cpuusage%%.*} ) / 10 ))
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
#lightLMK
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
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/mem/lightLMK/Pcpuusage
echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage
#heavyLMK
lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/heavyLMKline )
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pname
TOPPROCESSMEMUSAGE=$(top -l 1 -o MEM -stats mem | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSMEMUSAGE > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pmemusage
TOPPROCESS=$(top -l 1 -o MEM -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/mem/heavyLMK/PID
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $TOPPROCESS )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/mem/heavyLMK/Pcpuusage
echo Process Scanned $TOPPROCESS $TOPPROCESSMEMUSAGE rank $rankmemusage


sleep 0.$irregulardelayprocdec
#CPUUSAGE
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
cpuusage=$( echo ${cpuusage%%.*} )
#/Volumes/libreperfruntime/bin/cat
#checking processcpuusage
lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine1 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender1/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine2 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender2/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine3 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender3/PID
sleep 0.$irregulardelayprocdec

lineselect=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/bridge/lineselectengine4 )
TOPPROCESSNAME=$(top -l 1 -o CPU -stats command | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESSNAME="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"
TOPPROCESSCPUUSAGE=$(top -l 1 -o CPU -stats cpu | sed 1,"$lineselect"d | sed -n 3p)
TOPPROCESS=$(top -l 1 -o CPU -stats pid | sed 1,"$lineselect"d | sed -n 3p)
echo $TOPPROCESSNAME > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/Pname
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/Pcpuusage
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/cpu/enginesuspender4/PID
sleep 0.$irregulardelayprocdec

echo $cpuusage > /Volumes/libreperfruntime/sys/cpu/cpuusage
sleep 0.$irregulardelayprocdec
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
TOPPROCESS=$( echo "${TOPPROCESS}" | sed 1,1d | sed -n 1p |sed 's/[^a-zA-Z]*//g' )
sleep 0.$irregulardelayprocdec
#checkingcpuusageof the PROCESS
TOPPROCESSCPUUSAGE=$( /Volumes/libreperfruntime/bin/ps -o %cpu -c -p $IOTOPPROCESSPID )
TOPPROCESSCPUUSAGE=$( echo "${TOPPROCESSCPUUSAGE}" | sed 1,1d | sed -n 1p | sed 's/[^0-9]*//g' )
echo $IOPROC > /Volumes/libreperfruntime/sys/IOstats/IOPROC
echo $IOTOPPROCESSPID > /Volumes/libreperfruntime/sys/IOstats/IOTOPPROCESSPID
echo $TOPPROCESS > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESS
echo $TOPPROCESSCPUUSAGE > /Volumes/libreperfruntime/sys/IOstats/TOPPROCESSCPUUSAGE
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
echo $temp > /Volumes/libreperfruntime/sys/temp/cputherm
sleep 0.$irregulardelayprocdec

echo $irregulardelay
sleep $irregulardelay
done
