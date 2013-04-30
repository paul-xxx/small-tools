#!/bin/bash
cd ksin
echo "kernel.sin Unpacker..."
cd ../Data/Kernel/KSin
mv kernel.sin ../../../ksin/kernel.sin
cd ../../../ksin
./unpack-kernelsin.pl kernel.sin
echo "Done! Press ENTER for exit..."
read && exit
