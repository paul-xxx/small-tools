#!/bin/bash

echo "Fixing permissions..."
chmod 755 cwm/cwm.sh
chmod 755 fkernel/fkernel.sh
chmod 755 initlogo/convert.sh
chmod 755 kernelt/menu.sh
chmod 755 kernelt/rsai/rsai.sh
chmod 755 kernelt/ksin/ksin.sh
chmod 755 kernelt/kelf/*.sh
chmod 755 logs/*.sh
chmod 755 root/root.sh
chmod 755 small/*.sh
echo

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
  echo " Small Tools $version - by BPaul (xda-developers.com, sony-developers.ru)"
  echo "====================================================================="
  echo
  echo "  1 - Logs Tools"
  echo "  2 - Kernel Tools"
  echo "  3 - Flash kernel with fastboot"
  echo "  4 - Root your phone"
  echo "  5 - Reboot phone"
  echo "  6 - Sideload ZIP"
  echo "  7 - Copy update.zip to /sdcard"
  echo "  8 - Install CWM on rooted phone"
  echo "  9 - Convert logo.png on inilogo.rle"
  echo
  echo "  Q - Exit"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      1) logs/menu.sh; continue;;
      2) kernelt/menu.sh; continue;;
      3) fkernel/fkernel.sh; continue;;
      4) root/root.sh; continue;;
      5) small/reboot.sh; continue;;
      6) small/sideload.sh; continue;;
      7) small/update2SD.sh; continue;;
      8) cwm/cwm.sh; continue;;
      9) initlogo/convert.sh; continue;;
      q) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

