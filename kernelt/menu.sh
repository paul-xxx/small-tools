#!/bin/bash
cd kernelt

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
  echo " Kernel Tools $version - by BPaul (xda-developers.com, sony-developers.ru)"
  echo "====================================================================="
  echo
  echo "  1 - kernel.elf Tools"
  echo "  2 - kernel.sin Xperia 2011 and X10 unpacker"
  echo "  3 - RSAI Tool"
  echo
  echo "  B - Back"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      1) kelf/menu.sh; continue;;
      2) ksin/ksin.sh; continue;;
      3) rsai/rsai.sh; continue;;
      b) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

