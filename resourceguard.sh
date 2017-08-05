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
while true; do
irregulardelay=$(( ( RANDOM % 4 )  + 0 ))
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS) * 4096 / 1048576))
INACTIVE=$(($INACTIVE_BLOCKS * 4096 / 1048576))
TOTAL=$((($FREE+$INACTIVE)))

echo Free:       $FREE MB
echo Inactive:   $INACTIVE MB
echo Total free: $TOTAL MB
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
if [ "$TOTAL" -lt "1024" ]
  then
    irregulardelay=1
    echo your memory is running out $TOTAL MB
    if [ "${cpuusage%%.*}" -lt "10" ]
      then
        sudo sync
      else
        echo but the scarce of resources makes me not to do the job
    fi
  else
    echo your memory still in good shape $TOTAL MB
fi
ramclslv1=$(( ( RANDOM % 512 )  + 500 ))
ramclslv2=$(( ( RANDOM % 350 )  + 333 ))
ramclscrit=$(( ( RANDOM % 32 )  + 0 ))
ramclscfail=$(( ( RANDOM % 16 )  + 0 ))

echo ramlimit $ramclslv1 $ramclslv2 $ramclscrit $ramclscfail
echo FREERAM $TOTAL MB

lineselect=$(( ( RANDOM % 20 )  + 10 ))
TOPPROCESS=$(top -l 1 -o MEM -stats command | sed 1,"$lineselect"d | sed -n 3p)
echo Process Scanned $TOPPROCESS
TOPPROCESS="$(echo "${TOPPROCESS}" | tr -d '[:space:]')"

echo example "$TOPPROCESS" = "WindowServer"
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" ]]
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
          if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" ]]
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


if [ "$TOTAL" -lt "$ramclscrit" ]
  then
    sudo sync
    echo LAST RESORT mode
    irregulardelay=0
    sudo killall loginwindow
    #sudo purge
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
echo $irregulardelay Seconds of refresh

sleep $irregulardelay
clear
done
