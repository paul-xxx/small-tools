#!/bin/bash
cd initlogo
cd ../Data/Logo
cat *.png > ../../initlogo/logo.png
cd ../../initlogo
convert -depth 8 logo.png rgb:logo.raw
./0565 -rle < logo.raw > initlogo.rle
echo "Done! Press ENTER for exit..."
read && exit
