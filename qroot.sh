#!/bin/bash
#qroot qemu based root linux
#headless headless daemon
#if [ ! -f "/Volumes/libreperfruntime/plugins/zygote.sh" ]; then
#preload prexisting previous downloaded image!
sudo cp -r /usr/local/lbpbin/vmlinuz.img /Volumes/libreperfruntime/boot
#preload prexisting previous userdata!
#sudo cp -r /usr/local/lbpbin/userdata.qcow /Volumes/libreperfruntime/home whoops bad idea better off from the disk

if [ ! -f "/Volumes/libreperfruntime/boot/vmlinuz.img" ]; then
#gitclone bla bla repository libreperf linux
