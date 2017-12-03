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
irregulardelay=1
irregulardelayproc=1
randomnumber=$(( ( RANDOM % 12000 )  + 512 ))
lifetime=$(( ( RANDOM % 40 )  + 20 ))
getupdate=$randomnumber
updatecycle=0

#irregulardelayproc=$(( ( 100 - ${cpuusage%%.*} ) / 16 ))
#irregulardelay=$(( ( RANDOM % $irregulardelaycpuoverride )  + 0 ))

#processlaunch
cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
irregulardelay=5
sudo sh /Volumes/libreperfruntime/uiperfpatch.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/killengine.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/sensorpolling.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/lowmemorykiller.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/coolingcontroller.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/OOMkill.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/onscreenpowerset.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/renicecpu.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/IOptimisation.sh &
/Volumes/libreperfruntime/bin/sleep $irregulardelay
sudo sh /Volumes/libreperfruntime/sleepmana.sh &
echo booting




#overheating section
  #sudo pmset -a lidwake 1
  #sudo pmset -a lidwake 0
  #top -stats pid,command,cpu,idlew,power -o power -d
#power management
#lineselect=$(( ( RANDOM % 15 )  + 10 ))
#TOPPROCESS=$(top -l 1 -o power -stats pid | sed 1,10d | sed -n 3p)
#BATTLEFT=$(sudo pmset -g batt | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}') | IOPROC=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 33 | sed 's/[^0-9]*//g')
#echo $BATTLEFT mins left
compusagesum=0
sudo cp -r  /Volumes/fastcache/ /usr/local/lbpbin/ramstate
while true; do
updatecycle=$(( $updatecycle + 1 ))
cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
irregulardelay=$(( ( ${cpuusage%%.*} ) / 4 ))
compusage=$cpuusage
compusagesum=$(( $compusage + $compusagesum ))
compusage=$(( $compusagesum / $updatecycle ))
echo $compusage > /Volumes/libreperfruntime/sys/idleindicate
if [[ $updatecycle -gt $getupdate && $compusage -lt 20 ]]; then
  sudo sh /usr/local/lbpbin/uptget.sh
  updatecycle=0
  rsync -avz --delete "/Volumes/fastcache/" "/usr/local/lbpbin/ramstate"
  sudo sh /usr/local/lbpbin/resourceguard.sh
else
  echo updating not possible now
fi
if [ $updatecycle -gt $lifetime ]
  then
    echo hibernate
    rsync -avz --delete "/Volumes/fastcache/" "/usr/local/lbpbin/ramstate"
    sleep ${cpuusage%%.*}
  else
    echo alive
fi
batterylevel=$( ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}' | sed 's/[^0-9]*//g' )
if [ $batterylevel -lt 500 ]
  then
    pmset sleepnow
  else
    echo safe
fi
/Volumes/libreperfruntime/bin/sleep 2

done
