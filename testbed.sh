#!/bin/bash
#new ramdisk creation engine
ramfs_size_mb=$TOTAL
mount_point=/tmp/rdisk
echo help
ramfs_size_sectors=$((${ramfs_size_mb}*1024*1024/512))
ramdisk_dev=`hdiutil attach -nomount ram://${ramfs_size_sectors}`
echo $ramfs_size_mb
newfs_hfs -v 'ram disk' ${ramdisk_dev}
sudo mkdir ${mount_point}
sudo mount -o noatime -t hfs ${ramdisk_dev} ${mount_point}
echo $mount_point
echo $ramdisk_dev
#http://osxdaily.com/2007/03/23/create-a-ram-disk-in-mac-os-x/
#https://superuser.com/questions/456803/create-ram-disk-mount-to-specific-folder-in-osx
#echo "remove with:"
#echo "umount ${mount_point}"
#echo "diskutil eject ${ramdisk_dev}"




#meong='hdiutil attach -nomount ram://262144'
