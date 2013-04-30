#!/bin/bash
cd small
cd ../Data/ZIP
echo Found *.zip
echo "Sending update.zip to SD..."
adb push update.zip /sdcard/update.zip
echo "Done! Press ENTER for exit..."
read && exit
