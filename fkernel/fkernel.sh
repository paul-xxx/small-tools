#!/bin/bash
cd fkernel
echo "Kernel Flasher..."
echo
echo "Cleanup..."
if [ -e kernel.elf ]
then
	rm kernel.elf
fi
if [ -e kernel.sin ]
then
	rm kernel.sin
fi
cd ../Data/Kernel
echo "Prepairing kernel..."
if [ -e *.elf ]
then
	cat *.elf > ../../fkernel/kernel.elf
fi
if [ -e *.sin ]
then
	cat *.sin > ../../fkernel/kernel.sin
fi
if [ -e *.img ]
then
	cat *.img > ../../fkernel/boot.img
fi
cd ../../fkernel
echo "Chechking kernel..."
if [ -e kernel.elf ]
then
	echo "Flashing kernel.elf..."
	fastboot -i 0x0fce flash boot kernel.elf
	echo "Kernel flashed!"
	rm kernel.elf
	echo "Done! Press ENTER for exit..."
	read && exit
fi
if [ -e kernel.sin ]
then
	echo "Flashing kernel.sin..."
	fastboot -i 0x0fce flash boot kernel.sin
	echo "Kernel flashed!"
	rm kernel.sin
	echo "Done! Press ENTER for exit..."
	read && exit
fi
if [ -e boot.img ]
then
	echo "Flashing boot.img..."
	fastboot -i 0x0fce flash boot boot.img
	echo "Kernel flashed!"
	rm boot.img
	echo "Done! Press ENTER for exit..."
	read && exit
fi
echo "ERROR! Kernel not found. Add kernel in Data > Kernel folder."
echo "Press ENTER for exit..."
read && exit
