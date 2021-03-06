#!/bin/bash
echo "Ramdisk unpacker..."
echo
if [ -e ramdisk/init ]
then
	cd ramdisk
	rmdir sbin
	rm *
fi
mkdir ramdisk
7z e ramdisk.cpio.gz
rm ramdisk.cpio.gz
mv ramdisk.cpio ramdisk/rd.cpio
cd ramdisk
7z e rd.cpio
rm rd.cpio
cd ../
echo "Done! Press ENTER for exit..."
read && exit
