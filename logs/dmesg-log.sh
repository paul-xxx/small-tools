#!/bin/bash
cd ../Data/Logs
echo "dmesg.log creator..."
if [ -e dmesg.log ]
then
	mv dmesg.log Old-dmesg.log

fi
sleep 1
adb shell dmesg > dmesg.log
echo "Done! Press ENTER for exit..."
read && exit
