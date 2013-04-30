#!/bin/bash

echo "Fixing permissions..."
chmod 755 logcat/*
chmod 755 kelf/*
chmod 755 ksin/*
chmod 755 root/*
chmod 755 rsai/*
chmod 755 fkernel/*
chmod 755 small/*
chmod 755 cwm/*
chmod 755 cwm/*
echo

version=1.0

if [ "$?" == "1" ]
then
  exit 0
fi

while :
do
  clear
  echo 
  echo "====================================================================="
  echo " ROM Tools $version - by BPaul (xda-developers.com, sony-developers.ru)"
  echo "====================================================================="
  echo
  echo "  a - Logcat Tools"
  echo "  b - kernel.elf Tools"
  echo "  c - kernel.sin Xperia 2011 and X10 unpacker"
  echo "  d - Flash kernel with fastboot"
  echo "  e - RSAI Tool"
  echo "  f - Root your phone"
  echo "  g - Reboot phone"
  echo "  h - Sideload ZIP"
  echo "  i - Copy update.zip to /sdcard"
  echo "  j - Install CWM on rooted phone"
  echo "  k - Convert logo.png on inilogo.rle"
  echo
  echo "  x - Exit"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      a) logcat/menu.sh; continue;;
      b) kelf/menu.sh; continue;;
      c) ksin/ksin.sh; continue;;
      d) fkernel/fkernel.sh; continue;;
      e) rsai/rsai.sh; continue;;
      f) root/root.sh; continue;;
      g) small/reboot.sh; continue;;
      h) small/sideload.sh; continue;;
      i) small/update2SD.sh; continue;;
      j) cwm/cwm.sh; continue;;
      k) initlogo/convert.sh; continue;;
      x) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

