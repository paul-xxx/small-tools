#!/bin/bash
cd ../Data/Logs
echo "Logcat.log creator..."
if [ -e logcat.log ]
then
	mv logcat.log Old-logcat.log

fi
sleep 1
adb logcat > logcat.log
echo "Done! Press ENTER for exit..."
read && exit
