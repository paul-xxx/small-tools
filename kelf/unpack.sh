#!/bin/bash
echo "kernel.elf Unpacker..."
cd ../Data/Kernel
if [ -e *.img ]
then
echo Found *.img
7z e *.img
mv 0 ../../kelf/zImage
mv 1 ../../kelf/ramdisk.cpio.gz
mv 2 ../../kelf/RPM.bin
fi
if [ -e *.elf ]
then
echo Found *.elf
7z e *.elf
mv 0 ../../kelf/zImage
mv 1 ../../kelf/ramdisk.cpio.gz
mv 2 ../../kelf/RPM.bin
fi
if [ -e *.sin ]
then
echo Found *.sin
7z e *.sin
mv 0 ../../kelf/zImage
mv 1 ../../kelf/ramdisk.cpio.gz
mv 2 ../../kelf/RPM.bin
fi
cd ../../kelf
echo
echo "Done! Press ENTER for exit..."
read && exit
