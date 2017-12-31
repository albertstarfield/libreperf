# libreperf 0.11b "OSX Darwin kernel" based OS performance improvement project
------------
# what is Libreperf?
An project of attempting to remove macOS (10.12+ 10.13+) Sierra and above or (Possibly jailbroken terminal enabled iOS untested) performance limit on older Apple Devices "with this badly written program" and using various command and modification from multiple source or website and replacing some system management and adding some management to the system and adding responsiveness while handling heavy tasks I/O and other things
# i do not recommend system that only have 4 gb of RAM (Minimal = 8 GB or Required recomended = 16 GB)
------------
# what does "Libreperf" mean?
libre = free

perf = performance

libreperf = free from performance throttling Bottleneck
------------
# The Refrence List

thanks for Copyright 2011  0x46616c6b for ramdisk 
deprecated 2010 Alec Muffett Alec.Muffett@gmail.com for Dynamic pager
http://is.gd/9qZIX or http://bit.ly/axANub
https://apple.stackexchange.com/questions/14001/how-to-turn-off-all-animations-on-os-x
https://superuser.com/questions/827984/open-files-limit-does-not-work-as-before-in-osx-yosemite
davidschalter.com
https://perishablepress.com/list-files-folders-recursively-terminal/
https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3 disabling features
https://ioshackerwiki.com/sysctls/ moar kernel strings yay
http://www.manpagez.com/man/8/sysctl/


# what does it do?
here is the list

1. dynamic unix parameter by using launchctl and sysctl -w
2. installing custom plist
3. Disabling Apple background services
4. Finetuning the UI behaviour 
5. Tuning the power management on the fly ( battery may be worse )
6. Early periodic Indexing
7. kernel_task throtlling disabled ( untested )
8. Preloading User Installed Apps
9. Preloading Some Data
10. Replacing default macOS memory paging system with Compressor and Low memory killer 
11. /usr/local/lbpbin/initd.sh script start at boot
12. custom CPU resource management ( suspend unsuspend )
13. custom I/O management (Kinda having some broken algorithm issues)(issues somewhat fixed)
14. Custom Thermal management addition of new feature ( Auto Overdrive mode & passive cooling mode )
15. Automatic ramdisk scratch disks mount (allocated and optimized) (Have several Issues)
16. Hybrid management system (apple macOS and libreperf)dynamic switching (saves energy)
17. Some minor storage tweaks

# How to install?

THIS PROCESS IS IRREVERSIBLE SO IF YOU WANT TO PRESERVE THE VANILLA MACOS DO NOT USE THIS
IN THIS EARLY STAGE THE RESTORE PROCESS WILL INVOLVING REINSTALLING YOUR MACOS
AND BACKUP ALL YOUR DATA SO INCASE IF SOMETHING BAD YOU CAN RESTORE YOUR DATA
AND I DO NOT RESPONSIBLE FOR ANY DAMAGES THAT BEEN DONE BY RUNNING THIS SCRIPT

okay enough for those scary caps lock messages.. lets just get into the installation xD

A. Disabling SIP
----------
0. Check whether you have SIP enabled or disabled already
1. reboot your mac
2. boot your mac into recovery mode by holding command+R
3. fire up the Recovery Terminal and type in "csrutil disable"
4. and restart or sudo reboot

B. Installing the script
----------
B1. Using Release Channel
0. Download latest (Highly Recomended) dmg file from the release section
1. open up the dmg file and navigate to that directory
2. launch the "InstallWizard" by double clicking and input the password when asked
3. Done! ( No reboot required although the full effect going to take place after reboot )

B2. Using the Master Repositories
0. Download or clone the file into your computer
1. extract into a folder that dont have spaces
2. open up terminal
3. cd into the extracted folder
4. then type in the terminal sh install.sh
5. it will request a password go ahead fill your password
6. let it do the thing and wait until the mac goes blank
7. your mac boots up in kind of verbose mode but it will work normally as it should
8. That's it! you successfully Tweak some internal stuff

Yes the boot performance is kind of slower than before becouse the preload directory but it worth the performance improvement

# And one more thing
this program is really just my experimental attempt (i mean seriously you can read the source code and literally laugh because of how bad the structure is) on optimizing macOS because in my opinion macOS does not fully optimized for heavy multi task use so just frankenstein those all , also using libreperf in standard use of mac is just overkill and killing battery real fast 


meow~
