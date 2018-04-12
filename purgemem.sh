#!/bin/bash
#Trim Memory algorithm questandachievement7 monitoring cpu memory IO
ramdiskid=memfill
deelsleep=$(( ( RANDOM % 360 )  + 180 ))

while true; do
#mountstart
echo checking status
cpuusage=$( /libreperfruntime/bin/cat /libreperfruntime/sys/cpu/cpuusage )
FREE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/free )
INACTIVE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/inactive )
TOTAL=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
IOPROC=$( /libreperfruntime/bin/cat /libreperfruntime/sys/IOstats/IOPROC )
size=$(( $TOTAL ))
sizefill=$(( $size - ( $size * 1 / 4 ) ))
sizefillbytes=$(( $sizefill * 1048576 ))
echo filling ram with 0
echo input $TOTAL $cpuusage $IOPROC
echo trigger 2048 30 5000
if [[ $TOTAL -lt 2048 && $cpuusage -gt 30 && $cpuusage -lt 400 && $IOPROC -lt 5000 ]]; then
  echo allocating creating VM
  if [ ! -d "/Volumes/$ramdiskid/" ]; then
  diskutil erasevolume HFS+ "$ramdiskid" `hdiutil attach -nomount ram://$[$size*2048]`
    else
      echo volume exist
    fi
  echo Filling ram with 0 process 1
  echo allocating creating VM may take a while
  mkfile -n -v 1m /Volumes/memfill/purgemod
  dd if=/dev/urandom of=/Volumes/memfill/fill bs=64M count=16
  echo push
  openssl rand -out /Volumes/memfill/0 -base64 $(( $sizefillbytes * 3/4 ))
  echo waiting reactions
  sleep 5
  rm -rf /Volumes/$ramdiskid/purgemod
  rm -rf /Volumes/$ramdiskid/0
  rm -rf /Volumes/$ramdiskid/fill
  echo deallocating ram
  TOTAL2=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
  deltamem=$(( $TOTAL2 - $TOTAL ))
  echo $deltamem Free delta ram
  umount -f /Volumes/memfill
  sleep $deelsleep
else
  echo conditions seems normal at this point
fi
sleep 7
done
