#!/bin/bash
isyncsum=0
cycle=0
cyclesample=0
while true; do
cycle=$(( $cycle + 1 ))
cyclesample=$(( $cyclesample + 1 ))
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
isync=$(( ${cpuusage%%.*} * 6 ))
if [ $isync -lt 230 ]
  then
    isync=$(( $isync * 2 ))
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
        pmset relative wake $isync
        sleep $isync
        isyncsum=0
        cycle=0
      else
        echo overheating may occoured if such schedule is running
      fi
  else
    echo not enough energy sample to do some wake coalescing operation
fi
sleep 1
done
