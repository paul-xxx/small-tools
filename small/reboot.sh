#!/bin/bash
cd small
echo "Phone rebooter..."
adb reboot
echo "Done! Press ENTER for exit..."
read && exit
