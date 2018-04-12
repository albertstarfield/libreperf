#!/bin/bash
#Trim Memory algorithm questandachievement7 monitoring cpu memory IO
ramdiskid=memfill
deelsleep=$(( ( RANDOM % 360 )  + 180 ))
echo clear
while true; do
#mountstart
echo checking status
sudo rm -rf /Volumes/memfill
cpuusage=$( /libreperfruntime/bin/cat /libreperfruntime/sys/cpu/cpuusage )
FREE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/free )
INACTIVE=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/inactive )
TOTAL=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
IOPROC=$( /libreperfruntime/bin/cat /libreperfruntime/sys/IOstats/IOPROC )
size=$(( $TOTAL ))

sizefill=$(( $size - ( $size * 1 / 4 ) ))
if [ $sizefill -gt 3999 ]; then
   size=1024
    else
      echo continue
fi
sizefillbytes=$(( $sizefill * 1048576 ))
sizefillbytes=$(( $sizefillbytes * 3 / 4 ))

echo filling ram with 0
echo input $TOTAL $cpuusage $IOPROC
echo trigger 2048 30 5000
if [[ $TOTAL -lt 9999 && $cpuusage -lt 400  ]]; then
  echo allocating creating VM
  if [ ! -d "/Volumes/$ramdiskid/" ]; then
  diskutil erasevolume HFS+ "$ramdiskid" `hdiutil attach -nomount ram://$[$size*2048]`
    else
      echo volume exist
    fi
  echo Filling ram with 0 process 1
  echo allocating creating VM may take a while
  mkfile -n -v 1m /Volumes/memfill/purgemod
  dd if=/dev/urandom of=/Volumes/memfill/fill bs=64M count=8
  echo push
  openssl rand -out /Volumes/memfill/0 -base64 $(( $sizefillbytes * 3/4 )) &
  echo waiting reactions
  sleep 5
  rm -rf /Volumes/$ramdiskid/purgemod
  rm -rf /Volumes/$ramdiskid/0
  rm -rf /Volumes/$ramdiskid/fill
  echo deallocating ram
  sudo dmesg &
  sudo sync
  sudo purge
  sudo killall -KILL Dock
  sudo killall -KILL Finder
  sudo killall -KILL loginwindow
  sudo killall -KILL diskimages-helper
  TOTAL2=$( /libreperfruntime/bin/cat /libreperfruntime/sys/mem/total )
  deltamem=$(( $TOTAL2 - $TOTAL ))
  echo $deltamem Free delta ram
  umount -f /Volumes/memfill
else
  echo conditions seems normal at this point
  exit
fi
sleep 7
exit
done
