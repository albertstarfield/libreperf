#Slee
#!/bin/bash
while true; do
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
Clear
Sleep 0
echo make sure csrutil is disabled via booting recovery
Sleep 0
echo find on google disable csrutil or disable SIP
Sleep 0
Echo without disabling that this will only optimize partially
Sleep 0
Echo your Mac will reboot automatically after installation process finished
echo Exception on the newer version
echo Installing no longer need reboot
Sleep 0
echo setup will start in 9 seconds
sleep 1
echo setup will start in 8 seconds
sleep 1
echo setup will start in 7 seconds
sleep 1
echo setup will start in 6 seconds
sleep 1
echo setup will start in 5 seconds
sleep 1
echo setup will start in 4 seconds
sleep 1
echo setup will start in 3 seconds
sleep 1
echo setup will start in 2 seconds
sleep 1
echo setup will start in 1 seconds
sleep 1
#menuend



#installation started


LOGIN=$USER
Clear
#echo Type your password
sleep 0
loggedInUser=$sudo_USER
LOGIN=$sudo_USER
sudo clear
sudo clear
sudo clear
sudo clear
sudo clear

#Credits
echo -------------------------------------
echo libreperf script
echo by questandachievement and community
echo system will be rebooted automatically
echo -------------------------------------


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
echo https://github.com/lavoiesl/osx-cpu-temp
echo and many little snippets
echo sorry
echo delaying for certain amount of time
Sleep 2
#Sleep 30
Clear
#updatecomponent




Clear
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
echo installing some GNU stuff into your proprietary OS
echo Compability issues with the built in features


ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install gnu-sed
brew install git


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
clear
sudo cp -r uptget.sh /usr/local/bin
sudo cp -r aptupdate.sh /usr/local/bin
sudo cp -r libreperf.sh /usr/local/bin
#binary installation
sudo cp -r cycletmpcheck /bin/
sudo cp -r smc /bin/
sudo cp -r resourceguard.sh /usr/local/bin
sudo cp -r launchinitconf.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/launchinitconf.plist
sudo launchctl unload -w /Library/LaunchDaemons/launchinitconf.plist
sudo sync
sleep 2
sudo launchctl load -w /Library/LaunchDaemons/launchinitconf.plist

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
#defaults write com.apple.dock single-app -bool true
defaults write com.apple.dock mineffect -string scale
defaults write NSGlobalDomain NSAppSleepDisabled -bool no
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.CrashReporter DialogType none
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
echo phase
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
echo phase
defaults write com.apple.dock showhidden -bool true

echo applying settings
echo your Macintosh may go blank but your application will be restored
Clear
echo we are done
echo setup will reconfigure your system in 9 seconds
sleep 1
echo setup will reconfigure your system in 8 seconds
sleep 1
echo setup will reconfigure your system in 7 seconds
sleep 1
echo setup will reconfigure your system in 6 seconds
sleep 1
echo setup will reconfigure your system in 5 seconds
sleep 1
echo setup will reconfigure your system in 4 seconds
sleep 1
echo setup will reconfigure your system in 3 seconds
sleep 1
echo setup will reconfigure your system in 2 seconds
sleep 1
echo setup will reconfigure your system in 1 seconds
sleep 1
#installation ended
#sudo killall loginwindow
exit
Sleep 180
done
