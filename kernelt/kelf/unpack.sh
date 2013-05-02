#!/bin/bash
cd ../../Data/Kernel
echo "kernel.elf Unpacker..."
if [ -e *.img ]
then
echo Found *.img
7z e *.img
mv 0 ../../kernelt/kelf/zImage
mv 1 ../../kernelt/kelf/ramdisk.cpio.gz
mv 2 ../../kernelt/kelf/RPM.bin
fi
if [ -e *.elf ]
then
echo Found *.elf
7z e *.elf
mv 0 ../../kernelt/kelf/zImage
mv 1 ../../kernelt/kelf/ramdisk.cpio.gz
mv 2 ../../kernelt/kelf/RPM.bin
fi
if [ -e *.sin ]
then
echo Found *.sin
7z e *.sin
mv 0 ../../kernelt/kelf/zImage
mv 1 ../../kernelt/kelf/ramdisk.cpio.gz
mv 2 ../../kernelt/kelf/RPM.bin
fi
cd ../../kernelt/kelf
echo
echo "Done! Press ENTER for exit..."
read && exit
