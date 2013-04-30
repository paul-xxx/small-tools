#!/bin/bash
cd small
cd ../Data/ZIP
echo Found *.zip
mv update.zip temporary.zip
sleep 1
echo "Searching your ROM..."
if [ -e *.zip ]
then
	mv *.zip update.zip
fi
echo "Sending files to phone..."
adb sideload update.zip
echo "Done! Press ENTER for exit..."
read && exit
