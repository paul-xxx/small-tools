#!/bin/bash
cd logs
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
  echo " Logs Tools $version - by BPaul (xda-developers.com, sony-developers.ru)"
  echo "====================================================================="
  echo
  echo "  1 - Watch logcat in Terminal"
  echo "  2 - Create logcat.log file"
  echo "  3 - Watch dmesg in Terminal"
  echo "  4 - Create dmesg.log file"
  echo
  echo "  B - Back"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      1) . logcat.sh; continue;;
      2) . logcat-log.sh; continue;;
      3) . dmesg.sh; continue;;
      4) . dmesg-log.sh; continue;;
      b) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

