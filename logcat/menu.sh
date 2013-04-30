#!/bin/bash
cd logcat

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
  echo "  1 - Watch logcat in Terminal"
  echo "  2 - Create logcat.log file"
  echo
  echo "  b - Back"
  echo
  echo -n "Enter option: "
  read opt
  
  if [ "$?" != "1" ]
  then
    case $opt in
      1) . logcat.sh; continue;;
      2) . logcat-log.sh; continue;;
      b) exit 1;;
      *) echo "Invalid option"; continue;;
    esac
  fi
done

