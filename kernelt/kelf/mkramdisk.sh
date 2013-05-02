#!/bin/bash
echo "Ramdisk Maker..."
echo
echo "Checking ramdisk..."
cd ramdisk
if [ -e init ]
then
	echo "Packing new ramdisk..."
	find . | cpio -o -H newc | gzip > ../ramdisk.cpio.gz
	echo
else
	echo "Ramdisk not found! Aborting..."
fi
cd ../
echo
echo "Done! Press ENTER for exit..."
read && exit
