#Slee
#!/bin/bash
startupdelay=$(( ( RANDOM % 4 )  + 0 ))
echo $startupdelay seconds
#sleep $startupdelay
#initd
sudo sh /usr/local/lbpbin/initd.sh &
osascript -e 'display notification "Booting initd subsystem" with title "libreperf"'
caffeinate -t $startupdelay &
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

# 2017 questandachievement masamudro2001@gmail.com Systemguard ideas
# Copyright (C) 2011  0x46616c6b for ramdisk
# (c) 2010 Alec Muffett Alec.Muffett@gmail.com Dynamic pager
# http://code.google.com/p/dynamicpagerwrapper/
# reference/inspiration http://is.gd/9qZIX or http://bit.ly/axANub
# https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x


# thanks to https://github.com/herrbischoff/awesome-osx-command-line
# https://apple.stackexchange.com/questions/41045/how-can-i-disable-cpu-throttling-and-cpu-disabling
#and thanks for the other articles to such as lifewire and etc

LOGIN=$USER
#clear
#echo Type your password
sleep 0
loggedInUser=$sudo_USER
LOGIN=$sudo_USER
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')

FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
TOTAL=$((($FREE+$INACTIVE)))
echo Free:       $FREE MB
echo Inactive:   $INACTIVE MB
echo Total free: $TOTAL MB
cpuusage=$( ps -A -o %cpu | awk '{s+=$1} END {print s ""}' )
if [ "$TOTAL" -gt "2048" ];
  then
    sudo sync
    #sudo open -a /Applications/*.app --background #background application loading
  else
    echo Resource Usage is too high i wont cache the app
fi

sleep 2
while true; do #clear; killall mdworker0; killall mds0; killall symptomsd; sleep 1.1; done &
while true; do sudo nvram SystemAudioVolume="01%"; sleep 2; done &
osascript -e 'display notification "Welcome Please wait while we preparing our flight" with title "libreperf"'
#while :; do #clear; sudo sh /usr/local/lbpbin/resourceguard.sh; sleep 27; done

/LaunchDaemons/krnfilebuffer.plist
sudo launchctl load -w /Library/LaunchDaemons/krnfilebuffer.plist

sudo cp -r krnfilebufferproc.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnfilebufferproc.plist
sudo launchctl load -w /Library/LaunchDaemons/krnfilebufferproc.plist

sudo cp -r krnflushdd.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnflushdd.plist
sudo launchctl load -w /Library/LaunchDaemons/krnflushdd.plist

sudo cp -r krnlowprithrottle.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnlowprithrottle.plist
sudo launchctl load -w /Library/LaunchDaemons/krnlowprithrottle.plist

sudo cp -r krnproclim.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnproclim.plist
sudo launchctl load -w /Library/LaunchDaemons/krnproclim.plist

sudo cp -r krnsyncctrlcrit.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnsyncctrlcrit.plist
sudo launchctl load -w /Library/LaunchDaemons/krnsyncctrlcrit.plist

sudo cp -r krnsyncctrlurgent.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnsyncctrlurgent.plist
sudo launchctl load -w /Library/LaunchDaemons/krnsyncctrlurgent.plist

sudo cp -r maxdrive.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/maxdrive.plist
sudo launchctl load -w /Library/LaunchDaemons/maxdrive.plist

sudo cp -r krnsyncctrlwarn.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnsyncctrlwarn.plist
sudo launchctl load -w /Library/LaunchDaemons/krnsyncctrlwarn.plist

sudo cp -r krnshmmax.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnshmmax.plist
sudo launchctl load -w /Library/LaunchDaemons/krnshmmax.plist

sudo cp -r krnsysprocdelay.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnsysprocdelay.plist
sudo launchctl load -w /Library/LaunchDaemons/krnsysprocdelay.plist

sudo cp -r krnvfssync.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnvfssync.plist
sudo launchctl load -w /Library/LaunchDaemons/krnvfssync.plist

sudo cp -r libreperf.sh /usr/local/lbpbin
sudo cp -r launchinitconf.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/launchinitconf.plist
#sudo launchctl load -w /Library/LaunchDaemons/launchinitconf.plist

#Credits
echo -------------------------------------
echo $0 script
echo by questandachievement7 and community
echo system will be rebooted automatically
echo -------------------------------------
Sleep 0
#clear
echo Thanks to all of you guys thanks for the community yay
echo References
echo deprecated Copyright 2011  0x46616c6b for ramdisk
echo deprecated 2010 Alec Muffett Alec.Muffett@gmail.com Dynamic pager
echo http://is.gd/9qZIX or http://bit.ly/axANub
echo https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x
echo https://superuser.com/questions/827984/open-files-limit-does-not-work-as-before-in-osx-yosemite
echo davidschalter.com
echo https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3 disabling features
echo https://ioshackerwiki.com/sysctls/ moar kernel strings yay
Echo http://www.manpagez.com/man/8/sysctl/
echo and many little snippets
echo sorry
echo delaying for certain amount of time
#Sleep 30
#clear
#updatecomponent



while true; do
  osascript -e 'display notification "Booting coolingcontroller subsystem" with title "libreperf"'
clear
#clear
#Xmessage Optimizing OSX using system guard Method may not work if csrutil still enabled &
#Xmessage dont panic if your computer just go blank it is normal &
echo remastering parameters settings

csrutil disable

sw_vers
Uptime

#Systemmanagementtweaks
#vm_compressor should be set to 1 but its no longer supported and been deprecated by apple in OS X 10.12 even though its deprecated already it gives us IO performance boost

#hidden IO boost
#multiple pilots install
#https://superuser.com/questions/827984/open-files-limit-does-not-work-as-before-in-osx-yosemite
echo installing some driver
osascript -e 'display notification "Booting livepatching subsystem" with title "libreperf"'
sudo cp -r maxdrive.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/maxdrive.plist
sudo launchctl load -w /Library/LaunchDaemons/maxdrive.plist

sudo cp -r krnbuffer.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnbuffer.plist
sudo launchctl load -w /Library/LaunchDaemons/krnbuffer.plist

sudo cp -r krnappdelay.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnappdelay.plist
sudo launchctl load -w /Library/LaunchDaemons/krnappdelay.plist

sudo cp -r krnfilebuffer.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library
Sleep 0

sudo launchctl limit maxfiles 1000000 1000000
ulimit -n 100000
sudo echo 'limit maxfiles 1000000 1000000 maxproc 5000 5000' | sudo tee -a /etc/launchd.conf
sudo echo 'ulimit -n 100000' | sudo tee -a /etc/profile
launchctl limit maxfiles
sudo launchctl limit maxfiles unlimited unlimited
sudo sysctl -w kern.maxfiles=19990000
sudo sysctl -w kern.maxfilesperproc=9990000 #9990000
sudo sysctl -w kern.sysv.shmmax=1610612736
sudo sysctl -w kern.maxvnodes=3000000
sudo sysctl -w kern.maxproc=1000000
sudo sysctl -w kern.maxprocperuid=901928
sudo sysctl -w kern.ipc.maxsockbuf=8388608
sudo sysctl -w kern.ipc.somaxconn=1024
sudo sysctl -w kern.ipc.nmbclusters=65536
sudo sysctl -w kern.ipc.sbmb_cnt_peak=1170
sudo sysctl -w kern.ipc.njcl=21840
sudo sysctl -w kern.timer.longterm.qlen=0
sudo sysctl -w kern.timer.longterm.threshold=0
sudo sysctl -w net.inet.ip.maxfragpackets=2048
sudo sysctl -w net.inet.tcp.tcbhashsize=8192
sudo sysctl -w net.inet.tcp.fastopen_backlog=200
sudo sysctl -w net.inet6.ip6.maxfragpackets=2048
sudo sysctl -w net.inet6.ip6.maxfrags=4096
# https://ioshackerwiki.com/sysctls/
# yes I know it is for IOS but why not xD
sudo sysctl -w debug.lowpri_throttle_enabled=0
sudo sysctl -w debug.lowpri_throttle_max_iosize=9999999
sudo sysctl -w kern.flush_cache_on_write=1
sudo sysctl -w vfs.generic.sync_timeout=99
sudo sysctl -w kern.memorystatus_sync_on_critical=19
sudo sysctl -w kern.memorystatus_sync_on_urgent=15
sudo sysctl -w kern.memorystatus_sync_on_warning=10
sudo sysctl -w kern.memorystatus_apps_idle_delay_time=1
sudo sysctl -w kern.memorystatus_sysprocs_idle_delay_time=1
sudo sysctl -w kern.maxnbuf=1024000 #16384
sudo launchctl limit maxfiles 1000000 1000000

#it seems that 0x8 0x10 0x20 does freeze the os instantly so dont use it
# using 2 is the most balanced settings
# using 1 probably OOM killer will be kicked on to save the day
sudo nvram boot-args="-s -v -f kext-dev-mode=1 vm_compressor=2 idlehalt=1 srv=1 cpuidle=1 serverperfmode=1" #cool looking boot up sequences
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist #Disable paging disk because OS X sucks at iops operation
sudo rm -rf /private/var/vm/swapfile*
sudo systemsetup -setwaitforstartupafterpowerfailure 30
sudo sysctl debug.lowpri_throttle_enabled=0
sudo systemsetup -setrestartfreeze on
sudo nvram SystemAudioVolume="01%"
sudo Periodic all
# https://lifehacker.com/the-best-hidden-settings-you-can-unlock-with-os-xs-ter-1476627111
sudo spctl —master-disable
sudo spctl --master-disable

#disable MacOSIOThrottling
#davidschalter.com
#why do you implement this apple on older laptop
sudo rsync -av /System/Library/Extensions/IOPlatformPluginFamily.kext /Users/Shared
sudo rm -rf /System/Library/Extensions/IOPlatformPluginFamily.kext



#https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3
#Thanks

# Agents to disable

#UXOptimization
echo phase
sudo defaults write com.apple.CrashReporter DialogType nano
defaults write com.apple.CrashReporter DialogType developer
defaults write com.apple.universalaccess reduceTransparency -bool false
defaults write com.apple.dashboard mcx-disabled -boolean YES
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
defaults delete NSDisableAutomaticTermination
echo phase
defaults write -g NSDisableAutomaticTermination -bool no
defaults write com.google.Chrome NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.dock single-app -bool false
defaults write com.apple.dock mineffect -string scale
defaults write NSGlobalDomain NSAppSleepDisabled -bool no
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.CrashReporter DialogType none
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
echo phase
sudo defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write com.apple.dashboard devmode YES
defaults write com.apple.dt.Xcode UseSanitizedBuildSystemEnvironment -bool NO
sudo defaults write /Library/Preferences/com.apple.windowserver Compositor -dict deferredUpdates 0
sudo defaults write /Library/Preferences/com.apple.windowserver QuartzGLEnabled -boolean YES
echo phase
defaults write com.apple.dock showhidden -bool true
#ReduceIndexResources
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
sudo mdutil -a -i off
#sudo mdutil -E /


echo stage 1
Sleep 0
#RamFILECACHING
#check https://stackoverflow.com/questions/1821886/check-if-mac-process-is-running-using-bash-by-process-name
PROCESS=diskimages-helper
number=$(ps aux | grep $PROCESS | wc -l)
if [ $number -gt 0 ]
    then
        echo Warm Boot Detected
        killall -KILL $PROCESS
    else
        echo Cold boot detected
fi
echo "$loggedInUser"
#diskutil erasevolume HFS+ "$ramdiskid" `hdiutil attach -nomount ram://$[size*2048]`
sleep 0
#mkdir "$ramdisk/Caches"
#cp -r "$origin" "$ramdisk"
#rm -rf "/Users/$LOGIN/Library/Caches" &
#echo deleting disk cache
#mkdir "$ramdisk/Caches"
#ln -s "$ramdisk/Caches" "/Users/$LOGIN/Library"
#reporting
FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
FREE=$((($FREE_BLOCKS+$SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
TOTAL=$((($FREE+$INACTIVE)))
size=$(( $TOTAL - (( $TOTAL / 2 )) ))
sizefill=$(( $size - ( $size * 1 / 4 ) ))
sizefillbytes=$(( $sizefill * 1048576 ))
echo $size > /Volumes/libreperfruntime/sys/mem/ramdisksize
echo $sizefill > /Volumes/libreperfruntime/sys/mem/ramdiskalloc
echo $sizefillbytes > /Volumes/libreperfruntime/sys/mem/ramdiskallocbytes
echo filling ram with 0
echo input $TOTAL $cpuusage $IOPROC
sudo rm -rf /Volumes/libreperfruntime
sudo rm -rf /Volumes/fastcache
mkdir /usr/local/lbpbin/ramstate
#Installingservice on ramdisk
osascript -e 'display notification "Preparing Unified Management System" with title "libreperf"'
if [ ! -d "/Volumes/libreperfruntime/" ]; then
diskutil erasevolume HFS+ 'libreperfruntime' `hdiutil attach -nomount ram://1310720`
  else
    echo volume exist
  fi
  if [ ! -d "/Volumes/fastcache/" ]; then
  diskutil erasevolume HFS+ 'fastcache' `hdiutil attach -nomount ram://$[$size*2048]`
  echo Filling ram with 0 process 1
  echo allocating creating VM may take a while
  mkfile -n -v 1m /Volumes/fastcache/purgemod
  dd if=/dev/urandom of=/Volumes/fastcache/fill bs=64M count=16
  echo push
  openssl rand -out /Volumes/fastcache/0 -base64 $(( $sizefillbytes * 3/4 ))
  echo waiting reactions
  sleep 5
  rm -rf /Volumes/fastcache/purgemod
  rm -rf /Volumes/fastcache/0
  rm -rf /Volumes/fastcache/fill
  echo deallocating ram
  rsync -avz --delete "/usr/local/lbpbin/ramstate/" "/Volumes/fastcache/"
    else
      echo volume exist
    fi
while true; do sudo chmod -R 0777 /Volumes/fastcache/; sleep 2; done &
sudo chflags hidden /Volumes/libreperfruntime
sudo killall Finder
cp -r /usr/local/lbpbin/coolingcontroller.sh /Volumes/libreperfruntime
sudo cp -r /usr/local/lbpbin/resourceguard.sh /Volumes/libreperfruntime
sudo mkdir /Volumes/libreperfruntime/bin
sudo mkdir /Volumes/libreperfruntime/subbin
sudo mkdir /Volumes/libreperfruntime/binsync
cp -r /bin/ /Volumes/libreperfruntime/bin/
cp -r /usr/bin/ /Volumes/libreperfruntime/subbin/
cp -r /usr/local/lbpbin/86idlesync.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/lowmemorykiller.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/OOMkill.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/onscreenpowerset.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/renicecpu.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/IOptimisation.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/sleepmana.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/sensorpolling.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/killengine.sh /Volumes/libreperfruntime/binsync
sudo cp -r /usr/local/lbpbin/uiperfpatch.sh /Volumes/libreperfruntime/binsync
sudo cp -r /Volumes/libreperfruntime/binsync/ /Volumes/libreperfruntime
osascript -e 'display notification "Initializing Power Management Wake coalescing" with title "libreperf"'
#powermanagement settings
sudo sh /Volumes/libreperfruntime/86idlesync.sh &
osascript -e 'display notification "Initializing ramdisk watchdog" with title "libreperf"'
sudo sh /usr/local/lbpbin/watchdog.sh &

sysctl vm.swapusage
sysctl -a vm.compressor_mode
#irregularpolling code
irregulardelay=$(( ( RANDOM % 900 )  + 0 ))
#clear
#Xmessage taking over root please put this script in the background &
echo Precaching
echo Resource Usage ${cpuusage%%.*}

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
#https://apple.stackexchange.com/questions/4286/is-there-a-mac-os-x-terminal-version-of-the-free-command-in-linux-systems
#https://perishablepress.com/list-files-folders-recursively-terminal/


echo $irregulardelay seconds
sudo sh /Volumes/libreperfruntime/resourceguard.sh
sudo sh /usr/local/lbpbin/uptget.sh
sudo sh /usr/local/lbpbin/libreperf.sh
Sleep $irregulardelay
done
done
done

#deprecated function
TODISABLE=('com.apple.security.keychainsyncingoveridsproxy' 'com.apple.personad' 'com.apple.passd' 'com.apple.screensharing.MessagesAgent' 'com.apple.CommCenter-osx' 'com.apple.Maps.mapspushd' 'com.apple.Maps.pushdaemon' 'com.apple.photoanalysisd' 'com.apple.telephonyutilities.callservicesd' 'com.apple.AirPlayUIAgent' 'com.apple.AirPortBaseStationAgent' 'com.apple.CalendarAgent' 'com.apple.DictationIM' 'com.apple.iCloudUserNotifications' 'com.apple.familycircled' 'com.apple.familycontrols.useragent' 'com.apple.familynotificationd' 'com.apple.gamed' 'com.apple.icloud.findmydeviced.findmydevice-user-agent' 'com.apple.icloud.fmfd' 'com.apple.imagent' 'com.apple.cloudfamilyrestrictionsd-mac' 'com.apple.cloudpaird' 'com.apple.cloudphotosd' 'com.apple.DictationIM' 'com.apple.assistant_service' 'com.apple.CallHistorySyncHelper' 'com.apple.CallHistoryPluginHelper' 'com.apple.AOSPushRelay' 'com.apple.IMLoggingAgent' 'com.apple.geodMachServiceBridge' 'com.apple.syncdefaultsd' 'com.apple.security.cloudkeychainproxy3' 'com.apple.security.idskeychainsyncingproxy' 'com.apple.security.keychain-circle-notification' 'com.apple.sharingd' 'com.apple.appleseed.seedusaged' 'com.apple.cloudd' 'com.apple.assistantd' 'com.apple.parentalcontrols.check' 'com.apple.parsecd' 'com.apple.identityservicesd')

for agent in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchAgents/${agent}.plist /System/Library/LaunchAgents/${agent}.plist.bak
    echo "[OK] Agent ${agent} disabled"
done

# Daemons to disable
TODISABLE=('com.apple.netbiosd' 'com.apple.preferences.timezone.admintool' 'com.apple.preferences.timezone.auto' 'com.apple.remotepairtool' 'com.apple.rpmuxd' 'com.apple.security.FDERecoveryAgent' 'com.apple.icloud.findmydeviced' 'com.apple.findmymacmessenger' 'com.apple.familycontrols' 'com.apple.findmymac' 'com.apple.SubmitDiagInfo' 'com.apple.screensharing' 'com.apple.appleseed.fbahelperd' 'com.apple.apsd' 'com.apple.AOSNotificationOSX' 'com.apple.FileSyncAgent.sshd' 'com.apple.ManagedClient.cloudconfigurationd' 'com.apple.ManagedClient.enroll' 'com.apple.ManagedClient' 'com.apple.ManagedClient.startup' 'com.apple.iCloudStats' 'com.apple.locationd' 'com.apple.mbicloudsetupd' 'com.apple.laterscheduler' 'com.apple.awacsd' 'com.apple.eapolcfg_auth' 'com.apple.familycontrols')

for daemon in "${TODISABLE[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchDaemons/${daemon}.plist /System/Library/LaunchDaemons/${daemon}.plist.bak
    echo "[OK] Daemon ${daemon} disabled"
done
