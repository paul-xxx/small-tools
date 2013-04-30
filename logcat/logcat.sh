#!/bin/bash
echo "Logcat viewer..."
adb logcat
echo "Done! Press ENTER for exit..."
read && exit
