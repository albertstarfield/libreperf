#!/bin/bash
#for dedicated thread Storage space optimization
cleanupdepth=11
cleanupdepth1=100
cleanupdepth0=100
while true; do cd /Users/; for i in *; do sudo cp -r /Volumes/prefetchblock0/"$i"/Dock/ /Users/"$i"/Library/Application\ Support\ HDD/Dock/ ; done; sleep 60; done &
sleep 9
while true; do cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Application\ Support\ HDD/Dock/ /Volumes/prefetchblock0/"$i"/Dock/; done; sleep 60; done &
sleep 5
while true; do cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Application\ Support\ HDD/desktoppicture.db /Volumes/prefetchblock0/"$i"/Dock/; done; sleep 40; done &

#load initial size
disksizekb=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramdiskkbsizecache)
disksizekbprefetch=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramdiskkbsizeprefetch)

sizefill=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramdiskallocprefetch)

chunkmaxsizeprefetch=$(( $sizefill / 8 ))
sizefill=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/ramdiskalloccache)

chunkmaxsize=$(( $sizefill / 16 ))
while true; do
#Desktop configurationfix
#cd /Users/; for i in *; do sudo cp -r /Volumes/prefetchblock0/"$i"/Dock/ /Users/"$i"/Library/Application\ Support\ HDD/Dock/ ; done

#cd /Users/; for i in *; do sudo cp -r /Users/"$i"/Library/Application\ Support\ HDD/Dock/ /Volumes/prefetchblock0/"$i"/Dock; done
sleep 2


cachefree=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/cachefree)
trigger=512000
trigger=$(( $disksizekb / 4 ))
if [ "$cachefree" -lt "$trigger" ]; then
# thanks to https://stackoverflow.com/questions/2960022/shell-script-to-count-files-then-remove-oldest-files
cd /Volumes/systemcacheblock0/; for i in *; do cd /Volumes/systemcacheblock0/"$i"/; echo Volumes/systemcacheblock0/"$i"; cleanup=$(ls -A1t /Volumes/systemcacheblock0/"$i"/ | tail -n +$cleanupdepth | xargs rm -rf); for a in *; do cd /Volumes/systemcacheblock0/"$i"/"$a"/; echo Volumes/systemcacheblock0/"$i"/"$a"/; cleanup=$(ls -A1t /Volumes/systemcacheblock0/"$i"/ | tail -n +$cleanupdepth | xargs rm -rf); done; done
find /Volumes/systemcacheblock0/ -size +"$chunkmaxsize"M -name "*.*" -exec rm -rf {} \;
cd /Volumes/systemcacheblock0/; for i in *; do sudo rm -rf /Volumes/systemcacheblock0/"$i"/Caches_HDD; done
sleep 1
if [ $cleanupdepth -gt 1 ]; then
  cleanupdepth=$(( $cleanupdepth - 1 ))
    else
      echo depth_underflow
fi
else
  if [ $cleanupdepth -lt 64 ]; then
    cleanupdepth=$(( $cleanupdepth + 1 ))
      else
        echo depth_overflow
  fi
  echo Space free
fi

echo $cleanupdepth > /Volumes/libreperfruntime/sys/mem/cachecleanupdepth


#prefetchcleaning
#ssdlowstorageoptimization
sleep 1
systemdiskfree=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/systemdiskfree)
trigger=512000
trigger=$(( $disksizekbprefetch / 2 ))
if [ "$systemdiskfree" -lt "$trigger" ]; then
# thanks to https://stackoverflow.com/questions/2960022/shell-script-to-count-files-then-remove-oldest-files
#cleanup cache on hdd
cd /Users/; for i in *; do cd /Users/"$i"/Library/Caches_hdd/; echo /Users/"$i"/Library/Caches_hdd/; cleanup=$(ls -A1t /Users/"$i"/Library/Caches_hdd/ | tail -n +$cleanupdepth0 | xargs rm -rf); for a in *; do cd /Users/"$i"/Library/Caches_hdd/"$a"/; echo /Users/"$i"/Library/Caches_hdd/"$a"/; cleanup=$(ls -A1t /Users/"$i"/Library/Caches_hdd/"$a"/ | tail -n +$cleanupdepth1 | xargs rm -rf); done; done
#maximum chunkmaxsize
cd /Users/; for i in *; do find /Users/"$i"/Library/Caches_hdd/ -size +"$chunkmaxsize"M -name "*.*" -exec rm -rf {} \; ; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Caches_hdd/Caches_hdd; done
#ApplicationData
cd /Users/; for i in *; do cd /Users/"$i"/Library/Application\ Support\ HDD/; echo /Users/"$i"/Library/Application\ Support\ HDD/; cleanup=$(ls -A1t /Users/"$i"/Library/Application\ Support\ HDD/ | tail -n +$cleanupdepth0 | xargs rm -rf); for a in *; do cd /Users/"$i"/Library/Application\ Support\ HDD/"$a"/; echo /Users/"$i"/Library/Application\ Support\ HDD/"$a"/; cleanup=$(ls -A1t /Users/"$i"/Library/Application\ Support\ HDD/"$a"/ | tail -n +$cleanupdepth1 | xargs rm -rf); done; done
#maximum chunkmaxsize
cd /Users/; for i in *; do find /Users/"$i"/Library/Application\ Support\ HDD/ -size +"$chunkmaxsizeprefetch"M -name "*.*" -exec rm -rf {} \; ; done
cd /Users/; for i in *; do sudo rm -rf /Users/"$i"/Library/Application\ Support\ HDD/Application\ Support\ HDD; done
sudo rm -rf /usr/local/lbpbin/ramstate
#disables fastboot zram0 state
#Purge trashcan contents
cd /Users/; for i in *; do rm -rf /Users/"$i"/.trash; done

if [ $cleanupdepth0 -gt 1 ]; then
  cleanupdepth1=$(( $cleanupdepth0 - 1 ))
    else
      echo depth_underflow
fi
else
  if [ $cleanupdepth0 -lt 100 ]; then
    cleanupdepth1=$(( $cleanupdepth0 + 1 ))
      else
        echo depth_overflow
  fi
  echo Space free
fi
sleep 1
#check memory cache free
prefetchfree=$(/Volumes/libreperfruntime/bin/cat /Volumes/libreperfruntime/sys/mem/prefetchfree)
trigger=512000
trigger=$(( $disksizekbprefetch / 4 ))
if [ "$prefetchfree" -lt "$trigger" ]; then
# thanks to https://stackoverflow.com/questions/2960022/shell-script-to-count-files-then-remove-oldest-files
cd /Volumes/prefetchblock0/; for i in *; do cd /Volumes/prefetchblock0/"$i"/; echo Volumes/prefetchblock0/"$i"; cleanup=$(ls -A1t /Volumes/prefetchblock0/"$i"/ | tail -n +$cleanupdepth1 | xargs rm -rf); for a in *; do cd /Volumes/prefetchblock0/"$i"/"$a"/; echo Volumes/prefetchblock0/"$i"/"$a"/; cleanup=$(ls -A1t /Volumes/prefetchblock0/"$i"/ | tail -n +$cleanupdepth1 | xargs rm -rf); done; done
find /Volumes/prefetchblock0/ -size +"$chunkmaxsizeprefetch"M -name "*.*" -exec rm -rf {} \;
cd /Volumes/prefetchblock0/; for i in *; do sudo rm -rf /Volumes/prefetchblock0/"$i"/Application\ Support\ HDD; done
if [ $cleanupdepth1 -gt 1 ]; then
  cleanupdepth1=$(( $cleanupdepth1 - 1 ))
    else
      echo depth_underflow
fi
else
  if [ $cleanupdepth1 -lt 100 ]; then
    cleanupdepth1=$(( $cleanupdepth1 + 1 ))
      else
        echo depth_overflow
  fi
  echo Space free
fi
sleep 5
done
