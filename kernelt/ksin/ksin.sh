#!/bin/bash
cd ksin
echo "kernel.sin Unpacker..."
cd ../../Data/Kernel/KSin
cat kernel.sin ../../../kernelt/ksin/kernel.sin
cd ../../../kernelt/ksin
./unpack-kernelsin.pl kernel.sin
echo "Done! Press ENTER for exit..."
read && exit
