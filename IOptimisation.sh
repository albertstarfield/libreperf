#!/bin/bash

#IOseekram migration inspired from "IOBIT Lightning booster" and Cache2ram created by 0x46616c6b and Windows Prefetch
#codesnippets cd /Users/; for i in *; do sudo -u "$i" defaults write com.apple.CrashReporter DialogType developer; done
#reporting
#fallbackstageboottimeaccoff
#zramactivation
#swappingstage
echo zramcache applying
#while true; do sudo nvram SystemAudioVolume="%01"; sleep 2; done &
while true; do sudo /sbin/dynamic_pager -F /Volumes/zramblock0/zram; sleep 5; done &

https://www.zyxware.com/articles/2659/find-and-delete-files-greater-than-a-given-size-from-the-linux-command-line
#find /Volumes/systemcacheblock0/ -size +64M -name "*.*" -exec rm -rf {} \;
#find /Volumes/systemcacheblock0/ -size +512k -name "*.*" -exec echo {} \;
#cleanup
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches_hdd/Caches_hdd; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support\ HDD/Application\ Support\ HDD; done

#migrated to initlibreperfmodule
if [ ! -d "/Volumes/systemcacheblock0" ]; then
  cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches; done
  cd /Users/; for i in *; do sudo ln -s /Users/"$i"/Library/Caches_hdd /Users/"$i"/Library/Caches; done
else
  echo normal linking mode
fi
if [ ! -d "/Volumes/prefetchblock0" ]; then
  cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support; done
  cd /Users/; for i in *; do sudo ln -s /Users/"$i"/Library/Application\ Support\ HDD /Users/"$i"/Library/Application\ Support; done
else
  echo normal linking mode
fi
#ApplicationSideload

#ApplicationPrefetch

size=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramavailable )
size=$(( $size / 2 ))
echo $size > /Volumes/libreperfruntime/sys/mem/ramavailable
sizefill=$(( $size - ( $size * 1 / 4 ) ))
sizefillbytes=$(( $sizefill * 1048576 ))
chunkmaxsizeprefetch=$(( $sizefill / 8 ))
disksizekbprefetch=$(( $size * 1000 ))
echo $size > /Volumes/libreperfruntime/sys/mem/ramdisksizeprefetch
echo $sizefill > /Volumes/libreperfruntime/sys/mem/ramdiskallocprefetch
echo $sizefillbytes > /Volumes/libreperfruntime/sys/mem/ramdiskallocbytesprefetch
echo $disksizekbprefetch > /Volumes/libreperfruntime/sys/mem/ramdiskkbsizeprefetch
cd /Users/; for i in *; do sudo mkdir /Users/"$i"/Library/Application\ Support\ HDD; done
echo mkdir step
#cd /Users/; for i in *; do sudo rsync --bwlimit=512 -aPz /Users/"$i"/Library/Caches/ /Users/"$i"/Library/Caches_hdd; sudo chmod -R 755 /Users/"$i"/Library/Caches_hdd/Caches; done &
cd /Users/; for i in *; do sudo mv /Users/"$i"/Library/Application\ Support/ /Users/"$i"/Library/Application\ Support\ HDD/; sudo chmod -R 755 /Users/"$i"/Library/Application\ Support\ HDD; done
echo cloning step
#sudo rm -rf /Volumes/prefetchblock0

#creating ramdisk for prefetchcache RAM
if [ ! -d "/Volumes/prefetchblock0/" ]; then
size=$( cat /Volumes/libreperfruntime/sys/mem/ramdisksizeprefetch )
sizefillbytes=$( cat /Volumes/libreperfruntime/sys/mem/ramdiskallocprefetch )
diskutil erasevolume HFS+ 'prefetchblock0' `hdiutil attach -nomount ram://$[$size*2048]`
echo Filling ram with 0 process 1
echo allocating creating VM may take a while
#mkfile -n -v 1m /Volumes/systemcacheblock0/purgemod
#dd if=/dev/urandom of=/Volumes/systemcacheblock0/fill bs=64M count=16
echo push
#openssl rand -out /Volumes/systemcacheblock0/0 -base64 $(( $sizefillbytes * 3/4 ))
echo waiting reactions
sleep 1
echo deallocating ram
#creating swap folder
sudo rm -rf /usr/local/lbpbin/swapfilecacheblock1/
sudo mkdir /usr/local/lbpbin/swapfilecacheblock1
cd /Users/; for i in *; do sudo mkdir /usr/local/lbpbin/swapfilecacheblock1/"$i"; done

cd /Users/; for i in *; do sudo mkdir /Volumes/prefetchblock0/"$i"; done
cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Application\ Support\ HDD/ /Volumes/prefetchblock0/"$i"; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support; done
echo echo clearing stage
cd /Users/; for i in *; do sudo ln -s /Volumes/prefetchblock0/"$i"/ /Users/"$i"/Library/Application\ Support; done
echo linking stage
sudo chflags hidden /Volumes/prefetchblock0
#creating ramdisk operation ended
#migration begins
  else
    echo volume exist operation cancelled
  fi
#creating ramdisk operation ended





size=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramavailable )
#size=$(( $size / 2 ))
echo $size > /Volumes/libreperfruntime/sys/mem/ramavailable
sizefill=$(( $size - ( $size * 1 / 4 ) ))
sizefillbytes=$(( $sizefill * 1048576 ))
chunkmaxsize=$(( $sizefill / 16 ))
disksizekb=$(( $size * 1000 ))
echo $size > /Volumes/libreperfruntime/sys/mem/ramdisksizecache
echo $sizefill > /Volumes/libreperfruntime/sys/mem/ramdiskalloccache
echo $sizefillbytes > /Volumes/libreperfruntime/sys/mem/ramdiskallocbytescache
echo $disksizekb > /Volumes/libreperfruntime/sys/mem/ramdiskkbsizecache
#reporting section
cd /Users/; for i in *; do sudo mkdir /Users/"$i"/Library/Caches_hdd; done
echo mkdir step
#cd /Users/; for i in *; do sudo rsync --bwlimit=512 -aPz /Users/"$i"/Library/Caches/ /Users/"$i"/Library/Caches_hdd; sudo chmod -R 755 /Users/"$i"/Library/Caches_hdd/Caches; done &
cd /Users/; for i in *; do sudo mv /Users/"$i"/Library/Caches/ /Users/"$i"/Library/Caches_hdd; sudo chmod -R 755 /Users/"$i"/Library/Caches_hdd/Caches; done
echo cloning step
#sudo rm -rf /Volumes/systemcacheblock0

#creating ramdisk for cache RAM
if [ ! -d "/Volumes/systemcacheblock0/" ]; then
size=$( cat /Volumes/libreperfruntime/sys/mem/ramdisksizecache )
sizefillbytes=$( cat /Volumes/libreperfruntime/sys/mem/ramdiskallocbytescache )
diskutil erasevolume HFS+ 'systemcacheblock0' `hdiutil attach -nomount ram://$[$size*2048]`
echo Filling ram with 0 process 1
echo allocating creating VM may take a while
#mkfile -n -v 1m /Volumes/systemcacheblock0/purgemod
#dd if=/dev/urandom of=/Volumes/systemcacheblock0/fill bs=64M count=16
echo push
#openssl rand -out /Volumes/systemcacheblock0/0 -base64 $(( $sizefillbytes * 3/4 ))
echo waiting reactions
sleep 1
rm -rf /Volumes/systemcacheblock0/purgemod
rm -rf /Volumes/systemcacheblock0/0
rm -rf /Volumes/systemcacheblock0/fill
echo deallocating ram
#creating swap folder
sudo rm -rf /usr/local/lbpbin/swapfilecacheblock0/
sudo mkdir /usr/local/lbpbin/swapfilecacheblock0
cd /Users/; for i in *; do sudo mkdir /usr/local/lbpbin/swapfilecacheblock0/"$i"; done

cd /Users/; for i in *; do sudo mkdir /Volumes/systemcacheblock0/"$i"; done
cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Caches_hdd/ /Volumes/systemcacheblock0/"$i"/; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches; done
echo echo clearing stage
cd /Users/; for i in *; do sudo ln -s /Volumes/systemcacheblock0/"$i" /Users/"$i"/Library/Caches; done
echo linking stage
sudo chflags hidden /Volumes/systemcacheblock0
#creating ramdisk operation ended
#migration begins
  else
    echo volume exist operation cancelled
  fi
#creating ramdisk operation ended

#cache2ramend
#bugs
while true; do sudo sudo killall -KILL ReportCrash; sleep 2; done &
while true; do sudo sudo killall -KILL cloudd; sleep 5; done &

#delay boot prevent bugs and freezes
delay=$(( ( RANDOM % 600 )  + 412 ))
sleep 1.$delay
cd "$(dirname "$0")"
sleep 18
sh /Volumes/libreperfruntime/storagemanager.sh
while true; do



cd "$(dirname "$0")"
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
if [ "$TOTAL" -gt "1024" ]; then
rsync -rva /Applications/
sudo periodic daily weekly monthly &
ls -R /Applications/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
ls -R /Users/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
 else
 echo No optimization needed
fi

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

cpuusage=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/cpu/cpuusage )
roundrobinalloc=$(( ( RANDOM % 16 )  + 4 ))
cpualloc=$(( $cpuusage / $roundrobinalloc ))

irregulardelay=$(( ( ${cpuusage%%.*} ) / 4 ))

FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
echo Free:       $FREE MB
echo Inactive:   $INACTIVE MB
echo Total free: $TOTAL MB
if [[ ${cpuusage%%.*} -gt 15 && ${cpuusage%%.*} -lt 77 && $FREE -gt 128 ]]; then
echo ------------------- Disk optimisation
#sudo iotop -t 1 -C 1 1
IOPROC=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/IOPROC )
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 4p | awk '{print substr($0, index($1,$7))}')
sleep 1
IOTOPPROCESSPID=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/IOTOPPROCESSPID )
sleep 1
#IOTOPPROCESS=$(sudo iotop -t 1 -C 1 1 | sed 1,1d | sed -n 1p | awk '{print substr($0, index($1,$7))}')
#IOTOPPROCESS=$( echo "${IOPROC}" | tr -d '[:space:]' | tail -c 18 | sed 's/[^0-9]*//g')
TOPPROCESS=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/TOPPROCESS )
sleep 1
TOPPROCESSCPUUSAGE=$( /Volume/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/IOstats/TOPPROCESSCPUUSAGE )
sleep 1
echo PROCESS BEING MONITORED $TOPPROCESS $IOTOPPROCESSPID CPUUSAGE $TOPPROCESSCPUUSAGE
sudo renice -n 20 $TOPPROCESSPID
#/Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
echo IO VARIABLE $IOPROC 4999
IOPROCMOD=$IOPROC
IOGUARD=$(( ( RANDOM % 10000 )  + 1000 ))
echo $IOGUARD IO LIMIT
cpulimidle=$(( ( RANDOM % 15 )  + 4 ))
cpulimidle2=$(( ( RANDOM % 50 )  + 20 ))
echo $cpulimidle2 CPU DETECTION
sleep $irregulardelay
if [ $IOPROC -gt "5000" ]
  then
    sudo sysctl -w kern.maxfiles=100000
    sudo sysctl -w kern.maxfilesperproc=50 #9990000
    sudo sysctl -w kern.sysv.shmmax=2560
    sudo launchctl limit maxfiles 75 10000
  else
    sudo sysctl -w kern.maxfiles=19990000
    sudo sysctl -w kern.maxfilesperproc=9990000 #9990000
    sudo sysctl -w kern.sysv.shmmax=1610612736
    sudo launchctl limit maxfiles 1000000 1000000
fi
sleep 0.$irregulardelay
#ps -o %cpu -c -p 1143
/Volumes/libreperfruntime/bin/kill -CONT $suspendedprocesseng5
if [[ $TOPPROCESS != "WindowServer" && $TOPPROCESS != "loginwindow" && $TOPPROCESS != "kernel_task" && $TOPPROCESS != "sh" && $TOPPROCESS != "bash" && $TOPPROCESS != "launchd" && $TOPPROCESS != "UserEventAgent" && $TOPPROCESS != "Terminal" && $TOPPROCESS != "node" && $TOPPROCESS != "spindump" && $TOPPROCESS != "kextd" && $TOPPROCESS != "launchd" && $TOPPROCESS != "coreduetd" && $TOPPROCESS != "SystemUIServer" && $TOPPROCESS != "sudo" && $TOPPROCESS != "Dock" && $TOPPROCESS != "coreaudiod" && $TOPPROCESS != "VBoxSVC" && $TOPPROCESS != "VBoxXPCOMIPCD" ]]; then
  if [[ "$IOPROCMOD" -gt "$IOGUARD" && "${cpuusage%%.*}" -gt "$cpulimidle" && "$TOPPROCESSCPUUSAGE" -lt "$cpulimidle2" ]]; then
     if [ $IOTOPPROCESSPID = 0 ]
		   then
	             invalid
		   else
         cd /Users/; for i in *; do sudo -u "$i" osascript -e 'display notification "Optimizing system disk access" with title "SystemAI"'; done
         echo stopping $IOTOPPROCESSPID IOPS
         osascript -e 'display notification "your computer might be slower culprit $TOPPROCESS" with title "libreperf"'
         /Volumes/libreperfruntime/bin/kill -CONT $IOTOPPROCESSPID
         /Volumes/libreperfruntime/bin/cpulimit -z -p $IOTOPPROCESSPID -l $cpualloc &
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
sleep 2

FREE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/free )
INACTIVE=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/inactive )
TOTAL=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/total )
clamshellinfo=$( /Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/hwmorph/clamshellinfo )
if [[ $clamshellinfo = ACSN && $TOTAL -lt "2500" ]]; then
    sudo killall periodic
    sudo killall rsync
    sudo killall ls
  else
    echo awaiting the moment
fi
  else
    echo High demand resources mode enabled
    sleep 10
fi
sleep 5


rsync -avz --delete "/Volumes/zramblock0/" "/usr/local/lbpbin/bloatapp"
echo --------------------
#fallbackstageifinlowmemory
if [ ! -d "/Volumes/systemcacheblock0" ]; then
  cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches; done
  cd /Users/; for i in *; do sudo ln -s /Users/"$i"/Library/Caches_hdd /Users/"$i"/Library/Caches; done
else
  echo normal linking mode
fi
if [ ! -d "/Volumes/prefetchblock0" ]; then
  cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support; done
  cd /Users/; for i in *; do sudo ln -s /Users/"$i"/Library/Application\ Support\ HDD /Users/"$i"/Library/Application\ Support; done
else
  echo normal linking mode
fi

#commandrecievierformemtodiskdisktomemoperation
if [ ! -f "/Volumes/libreperfruntime/sys/dumptodisk" ]; then
  echo No signal detected
else
  echo saving contents
  cd /Users/; for i in *; do cp -r /Volumes/systemcacheblock0/"$i"/ /Users/"$i"/Library/Caches_hdd; done
  cd /Users/; for i in *; do cp -r /Volumes/prefetchblock0/"$i"/ /Users/"$i"/Library/Application\ Support\ HDD; done
  echo purging memory from ram
  cd /Users/; for i in *; do rm -rf /Volumes/prefetchblock0/"$i"/; done
  cd /Users/; for i in *; do rm -rf /Volumes/systemcacheblock0/"$i"/; done
fi



if [ ! -f "/Volumes/libreperfruntime/sys/dumptoram" ]; then
  echo No signal detected
else
  echo purging disk contents to memory
  cd /Users/; for i in *; do cp -r /Users/"$i"/Library/Application\ Support\ HDD/ /Volumes/prefetchblock0/"$i"; done
  cd /Users/; for i in *; do cp -r /Users/"$i"/Library/Caches_hdd/ /Volumes/systemcacheblock0/"$i"/; done
fi

#swappingstage
https://www.zyxware.com/articles/2659/find-and-delete-files-greater-than-a-given-size-from-the-linux-command-line
#find /Volumes/systemcacheblock0/ -size +64M -name "*.*" -exec rm -rf {} \;
#find /Volumes/systemcacheblock0/ -size +512k -name "*.*" -exec echo {} \;
echo $cleanupdepth1 > /Volumes/libreperfruntime/sys/mem/cachecleanupdepth1

#ramdiskfixwhenunmounted
if [ ! -d "/Volumes/zramblock0/" ]; then
size=$( cat /Volumes/libreperfruntime/sys/mem/ramdisksize )
sizefillbytes=$( cat /Volumes/libreperfruntime/sys/mem/ramdiskallocbytes )
#size=2500
diskutil erasevolume HFS+ 'zramblock0' `hdiutil attach -nomount ram://$[$size*2048]`
echo Filling ram with 0 process 1
echo allocating creating VM may take a while
echo push
echo waiting reactions
sleep 1
rm -rf /Volumes/zramblock0/purgemod
rm -rf /Volumes/zramblock0/0
rm -rf /Volumes/zramblock0/fill
echo deallocating ram
rsync -avz --delete "/usr/local/lbpbin/bloatapp/" "/Volumes/zramblock0/"
  else
    echo zramblock0 exists
fi
#ramdiskfixcache
if [ ! -d "/Volumes/systemcacheblock0/" ]; then
size=$( cat /Volumes/libreperfruntime/sys/mem/ramdisksizecache )
sizefillbytes=$( cat /Volumes/libreperfruntime/sys/mem/ramdiskallocbytescache )
diskutil erasevolume HFS+ 'systemcacheblock0' `hdiutil attach -nomount ram://$[$size*2048]`
echo Filling ram with 0 process 1
echo allocating creating VM may take a while
#mkfile -n -v 1m /Volumes/systemcacheblock0/purgemod
#dd if=/dev/urandom of=/Volumes/systemcacheblock0/fill bs=64M count=16
echo push
#openssl rand -out /Volumes/systemcacheblock0/0 -base64 $(( $sizefillbytes * 3/4 ))
echo waiting reactions
sleep 1

echo deallocating ram
#content migration
sudo rm -rf /usr/local/lbpbin/swapfilecacheblock0/
sudo mkdir /usr/local/lbpbin/swapfilecacheblock0
cd /Users/; for i in *; do sudo mkdir /usr/local/lbpbin/swapfilecacheblock0/"$i"; done

cd /Users/; for i in *; do sudo mkdir /Volumes/systemcacheblock0/"$i"; done
cd /Users/; for i in *; do sudo rsync -avz /Users/"$i"/Library/Caches_hdd/ /Volumes/systemcacheblock0/"$i"/; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches; done
echo echo clearing stage
cd /Users/; for i in *; do sudo ln -s /Volumes/systemcacheblock0/"$i" /Users/"$i"/Library/Caches; done
echo linking stage
sudo chflags hidden /Volumes/systemcacheblock0
echo done restoring
#creating ramdisk operation ended
#migration begins
  else
    echo Cacheblock exists
  fi

#creating ramdisk for prefetchcache RAM
  if [ ! -d "/Volumes/prefetchblock0/" ]; then
  size=$( cat /Volumes/libreperfruntime/sys/mem/ramdisksizeprefetch )
  sizefillbytes=$( cat /Volumes/libreperfruntime/sys/mem/ramdiskallocprefetch )
  diskutil erasevolume HFS+ 'prefetchblock0' `hdiutil attach -nomount ram://$[$size*2048]`
  echo Filling ram with 0 process 1
  echo allocating creating VM may take a while
  #mkfile -n -v 1m /Volumes/systemcacheblock0/purgemod
  #dd if=/dev/urandom of=/Volumes/systemcacheblock0/fill bs=64M count=16
  echo push
  #openssl rand -out /Volumes/systemcacheblock0/0 -base64 $(( $sizefillbytes * 3/4 ))
  echo waiting reactions
  sleep 1
  echo deallocating ram
  #creating swap folder
  sudo rm -rf /usr/local/lbpbin/swapfilecacheblock1/
  sudo mkdir /usr/local/lbpbin/swapfilecacheblock1
  cd /Users/; for i in *; do sudo mkdir /usr/local/lbpbin/swapfilecacheblock1/"$i"; done

  cd /Users/; for i in *; do sudo mkdir /Volumes/prefetchblock0/"$i"; done
  cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Application\ Support\ HDD/ /Volumes/prefetchblock0/"$i"; done
  cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support; done
  echo echo clearing stage
  cd /Users/; for i in *; do sudo ln -s /Volumes/prefetchblock0/"$i" /Users/"$i"/Library/Application\ Support; done
  echo linking stage
  sudo chflags hidden /Volumes/prefetchblock0
  #creating ramdisk operation ended
  #migration begins
    else
      echo volume exist operation cancelled
    fi
  #creating ramdisk operation ended
done
