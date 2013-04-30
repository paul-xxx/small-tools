#!/bin/bash
echo "kernel.elf Maker..."
echo
echo "Packing new kernel.elf..."
python mkelf.py -o kernel.elf zImage@0x40208000 ramdisk.cpio.gz@0x41500000,ramdisk RPM.bin@0x20000,rpm
echo
echo "Moving kernel..."
mv kernel.elf ../Data/Kernel/Done/kernel.elf
echo
echo "Done! Press ENTER for exit..."
read && exit
