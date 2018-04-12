#Slee
#!/bin/bash
while true; do
#Licenses
printf '\e[9;1t'
#sleep 1080
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
echo clear
Sleep 0
echo Checking for update
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
echo clear
#echo Type your password
sleep 0
loggedInUser=$sudo_USER
LOGIN=$sudo_USER
sudo echo clear
sudo echo clear
sudo echo clear
sudo echo clear
sudo echo clear

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
echo and many little snippets
echo sorry
echo delaying for certain amount of time
Sleep 0
#Sleep 30
echo clear
#updatecomponent
#git retrieval
echo installing update
sudo rm -rf /libreperfruntime/upt/libreperfupt
sudo mkdir /libreperfruntime/upt/libreperfupt
sudo git clone https://github.com/questandachievement/libreperf /libreperfruntime/upt/libreperfupt/
cd /libreperfruntime/upt/libreperfupt
sudo sh aptupdate.sh
exit
#installation ended
#sudo killall loginwindow
exit
Sleep 180
done
