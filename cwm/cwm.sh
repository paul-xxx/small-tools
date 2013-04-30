#!/bin/bash
cd cwm
echo "CWM Recovery Installer for 2012 Xperia"
echo "Script created by BPaul@XDA"

echo "Restarting ADB..."
adb "kill-server"
adb "start-server"

echo "Detecting phone..."
adb "wait-for-device"

echo "Sending files to phone..."
cd files
adb shell "mkdir /data/local/tmp/cwm"
adb push chargemon /data/local/tmp/cwm
adb push charger /data/local/tmp/cwm
adb push recovery.tar /data/local/tmp/cwm
adb push sh /data/local/tmp/cwm
adb push step3.sh /data/local/tmp/cwm

echo "Installing CWM..."
adb shell "chmod 755 /data/local/tmp/cwm/sh"
adb shell "chmod 755 /data/local/tmp/cwm/step3.sh"
adb shell "su -c /data/local/tmp/cwm/step3.sh"
adb shell "rm -r /data/local/tmp/cwm"

echo "Killing ADB server.."
adb kill-server

echo "Done! Press ENTER for exit..."
read && exit
