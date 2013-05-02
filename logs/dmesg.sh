#!/bin/bash
echo "Dmesg viewer..."
adb shell dmesg
echo "Done! Press ENTER for exit..."
read && exit
