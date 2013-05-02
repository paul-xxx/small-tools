#!/bin/bash
cd kelf

version=1.1

if [ "$?" == "1" ]
then
  exit 0
fi

while :
do
  clear
  echo 
  echo "====================================================================="
  echo " Kernel.ELF Tools $version - by BPaul (xda-developers.com, sony-developers.ru)"
  echo "====================================================================="
  echo
  echo "  1 - Unpack kernel"
  echo "  2 - Unpack ramdisk"
  echo "  3 - Pack ramdisk"
  echo "  4 - Make kernel.elf"
  echo
  echo "  b - Back"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      1) . unpack.sh; continue;;
      2) . unramdisk.sh; continue;;
      3) . mkramdisk.sh; continue;;
      4) . mkkernel.sh; continue;;
      b) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

