#Slee
#!/bin/bash
while true; do
cd "$(dirname "$0")"
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

# 2017 questandachievement masamudro2001@gmail.com Systemguard ideas
# thanks to https://github.com/herrbischoff/awesome-osx-command-line
# https://apple.stackexchange.com/questions/41045/how-can-i-disable-cpu-throttling-and-cpu-disabling
#and thanks for the other articles to such as lifewire and etc
#!/bin/bash
# utilitymenu.sh - A sample shell script to display menus on screen

echo " ______   __  __   ______   ______   ______  __   __   ______   _____    ______   __  __    ";
echo "/\  __ \ /\ \/\ \ /\  ___\ /\  ___\ /\__  _\/\ \"-.\ \ /\  __ \ /\  __-. /\  ___\ /\ \_\ \   ";
echo "\ \ \/\_\\ \ \_\ \\ \  __\ \ \___  \\/_/\ \/\ \ \-.  \\ \  __ \\ \ \/\ \\ \ \____\ \  __ \  ";
echo " \ \___\_\\ \_____\\ \_____\\/\_____\  \ \_\ \ \_\\\"\_\\ \_\ \_\\ \____- \ \_____\\ \_\ \_\ ";
echo "  \/___/_/ \/_____/ \/_____/ \/_____/   \/_/  \/_/ \/_/ \/_/\/_/ \/____/  \/_____/ \/_/\/_/ ";
echo "                                                                                            ";
echo requesting root access
sleep 1
sudo echo access gained
sudo echo creating bin folder
sleepstability=$(( ( RANDOM % 5 )  + 0 ))
sleep $sleepstability
sudo echo initializing variables
sleepstability=$(( ( RANDOM % 5 )  + 0 ))
sleep $sleepstability
sudo echo preparing setup
sleepstability=$(( ( RANDOM % 5 )  + 0 ))
sleep $sleepstability
sudo echo handingover to the install handler
sleep 3







sudo mkdir /usr/local/lbpbin


Sleep 0
echo make sure csrutil is disabled via booting recovery
Sleep 0
echo find on google disable csrutil or disable SIP
Sleep 0
Echo without disabling that this will only optimize partially
Sleep 0
echo your Mac will reboot automatically after installation process finished

echo ctrl + c to cancel
echo " ___      ___   _______  ______    _______  _______  _______  ______    _______ ";
echo "|   |    |   | |  _    ||    _ |  |       ||       ||       ||    _ |  |       |";
echo "|   |    |   | | |_|   ||   | ||  |    ___||    _  ||    ___||   | ||  |    ___|";
echo "|   |    |   | |       ||   |_||_ |   |___ |   |_| ||   |___ |   |_||_ |   |___ ";
echo "|   |___ |   | |  _   | |    __  ||    ___||    ___||    ___||    __  ||    ___|";
echo "|       ||   | | |_|   ||   |  | ||   |___ |   |    |   |___ |   |  | ||   |    ";
echo "|_______||___| |_______||___|  |_||_______||___|    |_______||___|  |_||___|    ";
sleep 3




#installation started


LOGIN=$USER

#echo Type your password
sleep 0
loggedInUser=$sudo_USER
LOGIN=$sudo_USER


#Credits
echo -------------------------------------
echo libreperf script
echo by questandachievement and community
echo system will be rebooted automatically
echo -------------------------------------


echo Thanks to all of you guys thanks for the community yay
echo References
echo Copyright 2011  0x46616c6b for ramdisk
echo http://patorjk.com/software/taag/#p=display&c=echo&f=Doh&t=1
echo deprecated 2010 Alec Muffett Alec.Muffett@gmail.com Dynamic pager
echo http://is.gd/9qZIX or http://bit.ly/axANub
echo https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x
echo https://superuser.com/questions/827984/open-files-limit-does-not-work-as-before-in-osx-yosemite
echo davidschalter.com
echo https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3 disabling features
echo https://ioshackerwiki.com/sysctls/ moar kernel strings yay
Echo http://www.manpagez.com/man/8/sysctl/
echo https://github.com/lavoiesl/osx-cpu-temp
echo and many little snippets
echo sorry
echo delaying for certain amount of time
Sleep 0
#Sleep 30

#updatecomponent





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
sudo chown root:wheel /Library/LaunchDaemons/krnfilebuffer.plist
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

sudo cp -r krnpurgectrlcrit.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnpurgectrlcrit.plist
sudo launchctl load -w /Library/LaunchDaemons/krnpurgectrlcrit.plist

sudo cp -r krnpurgectrlurgent.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnpurgectrlurgent.plist
sudo launchctl load -w /Library/LaunchDaemons/krnpurgectrlurgent.plist

sudo cp -r maxdrive.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/maxdrive.plist
sudo launchctl load -w /Library/LaunchDaemons/maxdrive.plist

sudo cp -r krnpurgectrlwarn.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnpurgectrlwarn.plist
sudo launchctl load -w /Library/LaunchDaemons/krnpurgectrlwarn.plist

sudo cp -r krnshmmax.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnshmmax.plist
sudo launchctl load -w /Library/LaunchDaemons/krnshmmax.plist

sudo cp -r krnsysprocdelay.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnsysprocdelay.plist
sudo launchctl load -w /Library/LaunchDaemons/krnsysprocdelay.plist

sudo cp -r krnvfssync.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/krnvfssync.plist
sudo launchctl load -w /Library/LaunchDaemons/krnvfssync.plist
# Like it was a install process
sudo launchctl unload -w /Library/LaunchDaemons/launchinitconf.plist

sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
sudo cp -r mount_ntfs /sbin
sudo cp -r uptget.sh /usr/local/lbpbin
sudo cp -r refresh.sh /usr/local/lbpbin
sudo cp -r watchdog.sh /usr/local/lbpbin
sudo cp -r aptupdate.sh /usr/local/lbpbin
sudo cp -r libreperf.sh /usr/local/lbpbin
#binary installation
sudo cp -r lowmemorykiller.sh /usr/local/lbpbin
sudo cp -r sensorpolling.sh /usr/local/lbpbin
sudo cp -r OOMkill.sh /usr/local/lbpbin
sudo cp -r onscreenpowerset.sh /usr/local/lbpbin
sudo cp -r renicecpu.sh /usr/local/lbpbin
sudo cp -r IOptimisation.sh /usr/local/lbpbin
sudo cp -r 86idlesync.sh /usr/local/lbpbin
sudo cp -r sleepmana.sh /usr/local/lbpbin
sudo cp -r killengine.sh /usr/local/lbpbin
sudo cp -r cycletmpcheck /bin/
sudo cp -r smc /bin/
sudo cp -r coolingcontroller.sh /usr/local/lbpbin
sudo cp -r resourceguard.sh /usr/local/lbpbin
sudo cp -r launchinitconf.plist /Library/LaunchDaemons/
sudo cp -r uiperfpatch.sh /usr/local/lbpbin
sudo cp -r cpulimit /usr/local/lbpbin
sudo cp -r restart /bin/
sudo chmod 777 /bin/restart
sudo mkdir /usr/local/lbpbin/plugins



sudo chown root:wheel /Library/LaunchDaemons/launchinitconf.plist

sudo sync
sleep 2
sudo launchctl load -w /Library/LaunchDaemons/launchinitconf.plist

#UXOptimization
echo phase
sudo defaults write com.apple.CrashReporter DialogType nano
sudo defaults write /Library/Preferences/com.apple.windowserver Compositor -dict deferredUpdates 0
echo phase

echo we are done
echo thank you for installing libreperf
echo updates will be delivered automatically to your system fresh from github
sleep 0
echo applying settings
echo your Macintosh may go blank but your application will be restored
#sudo sync
#sudo purge
#sudo reboot -q

#installation ended
#sudo killall loginwindow
exit
Sleep 180
done
