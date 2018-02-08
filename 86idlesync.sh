#!/bin/bash
isyncsum=0
cycle=0
cyclesample=0
aheadschedule=0
#pmset sleepnow
pmset relative wake 30
sudo -S pmset repeat wake TWRFSU 23:58:00
#wakelock pentapoint on days
sudo -S pmset repeat wake TWRFSU 04:42:00
sudo -S pmset repeat wake TWRFSU 05:57:00
sudo -S pmset repeat wake TWRFSU 12:07:00
sudo -S pmset repeat wake TWRFSU 15:24:00
sudo -S pmset repeat wake TWRFSU 18:17:00
sudo -S pmset repeat wake TWRFSU 19:32:00

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


cycle=$(( $cycle + 1 ))
cyclesample=$(( $cyclesample + 1 ))
batterylevel=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/energy/batt )
cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
isync=$(( ${cpuusage%%.*} * 7 + ( ( 100 - $batterylevel ) * 2 ) ))
pmset relative wake $isync
if [ $isync -lt 60 ]
  then
    isync=$(( $isync * 3 ))
    echo synctimeframe too small
  else
    echo nanimo
fi

isyncsum=$(( $isyncsum + $isync ))
isync=$(( $isyncsum / $cycle ))
echo planned coalescing $isync seconds
echo Sampling perfect power balance usage $isyncsum $cycle

if [ $isyncsum -gt 1000000 ]
  then
    isyncsum=0
    cycle=0
  else
    echo sample reset not required
fi

sampleminimum=$(( ( RANDOM % 40 )  + 30 ))
if [ $cyclesample -gt $sampleminimum ]
  then
    cyclesample=0
    echo wake coalescing $isync seconds
    if [ ${cpuusage%%.*} -lt "100" ]
      then
        echo setting aheadschedule
        echo isyncsched $isync S $asched1 S $asched2 S $asched3 S $asched4 S $asched5 S
        pmset relative wake $isync
        sleep 30
        isyncsum=0
        cycle=0
      else
        echo overheating may occoured if such schedule is running
      fi
  else
    echo not enough energy sample to do some wake coalescing operation
fi

sleep 5
done
