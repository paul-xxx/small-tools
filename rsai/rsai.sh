#!/bin/bash
cd rsai
# Repacker System Android Images (RSAI Tool) v.0.3
# Author - Findlee
# E-Mail - thefindlee@gmail.com
# Profile on 4pda.ru - http://4pda.ru/forum/index.php?showuser=1498763

chmod 777 -R tools

while :
do

clear
setterm -bold 
tput setaf 1 
echo "============================================================"
echo "Repacker System Android Images (RSAI Tool) v.0.3 by Findlee"
echo "============================================================"
tput sgr0

echo "
1)Unpack Boot.img
2)Unpack Recovery.img
3)Repack Boot.img
4)Repack Recovery.img
5)CleanUp
6)Exit
"
read -p "Select: " opt
echo ""
case $opt in
1)tput setaf 1
setterm -bold 
if [[ -e boot.img ]] 
then echo "Boot.img found"
echo "Deleting Old Files"
rm -Rf new_boot.img boot.img-* configs
echo "Unpacking boot.img"
./tools/unpackbootimg -i boot.img
mkdir -p configs
mv boot.img-base boot.img-cmdline boot.img-pagesize configs
echo "Unpacking ramdisk"
mkdir boot.img-ramdisk
mv boot.img-ramdisk.gz boot.img-ramdisk
cd boot.img-ramdisk
gzip -dc boot.img-ramdisk.gz | cpio -i
rm -f boot.img-ramdisk.gz boot.img
cd ..
if [[ -e boot.img-ramdisk/sbin/ramdisk.cpio ]] && [[ -e boot.img-ramdisk/sbin/ramdisk-recovery.cpio ]]
then
echo "Found 2 Ramdisk's"
cd boot.img-ramdisk/sbin/
mkdir ramdisk
mv ramdisk.cpio ramdisk
cd ramdisk
cpio -i < ramdisk.cpio
rm ramdisk.cpio
cd ..
mkdir ramdisk-recovery
mv ramdisk-recovery.cpio ramdisk-recovery
cd ramdisk-recovery
cpio -i < ramdisk-recovery.cpio
rm ramdisk-recovery.cpio
cd ../../../
fi 
tput setaf 1
echo "Boot.img Extracted"
echo "Press any key"
read press
else echo "Boot.img not found"
echo "Press any key"
read press
fi
;;

2)tput setaf 1
setterm -bold 
if [[ -e recovery.img ]]
then echo "Recovery found"
echo "Deleting Old Files"
rm -Rf recovery.img-* new_recovery.img configs
echo "Unpacking recovery.img"
./tools/unpackbootimg -i recovery.img
mkdir -p configs
mv recovery.img-base recovery.img-cmdline recovery.img-pagesize configs
echo "Unpacking recovery-ramdisk"
mkdir recovery.img-ramdisk
mv recovery.img-ramdisk.gz recovery.img-ramdisk
cd recovery.img-ramdisk
gzip -dc recovery.img-ramdisk.gz | cpio -i
rm recovery.img-ramdisk.gz
cd ..
tput setaf 1
echo "Recovery.img Extracted"
echo "Press any key"
read press
else echo "Recovery not found"
echo "Press any key"
read press
fi
;;

3)tput setaf 1
setterm -bold
base=`cat configs/boot.img-base`
cmdline=`cat configs/boot.img-cmdline`
pagesize=`cat configs/boot.img-pagesize`
if [[ -d boot.img-ramdisk ]] && [[ -e boot.img-zImage ]]
then echo "Unpacked boot.img found"
echo "Packing ramdisk"
	if [[ -d boot.img-ramdisk/sbin/ramdisk ]] && [[ -d boot.img-ramdisk/sbin/ramdisk-recovery ]]
	then
	echo "Found 2 Unpacked of Ramdisk's"
	./tools/mkbootfs boot.img-ramdisk/sbin/ramdisk > boot.img-ramdisk/sbin/ramdisk.cpio
	./tools/mkbootfs boot.img-ramdisk/sbin/ramdisk-recovery > boot.img-ramdisk/sbin/ramdisk-recovery.cpio
	rm -R boot.img-ramdisk/sbin/ramdisk boot.img-ramdisk/sbin/ramdisk-recovery
	fi
./tools/mkbootfs boot.img-ramdisk | gzip > boot.img-ramdisk.gz
echo "Creating New boot.img"
./tools/mkbootimg --kernel boot.img-zImage --ramdisk boot.img-ramdisk.gz --cmdline "$cmdline" --base "$base" --pagesize "$pagesize" -o new_boot.img
tput setaf 1
echo "Created new_boot.img"
echo "Press any key"
read press
else echo "Unpacked boot.img not found"
echo "Press any key"
read press
fi
;;

4)tput setaf 1
setterm -bold
if [[ -d recovery.img-ramdisk ]] && [[ -e recovery.img-zImage ]]
then echo "Unpacked recovery.img found"
base=`cat configs/recovery.img-base`
cmdline=`cat configs/recovery.img-cmdline`
pagesize=`cat configs/recovery.img-pagesize`
echo "Packing recovery-ramdisk"
./tools/mkbootfs recovery.img-ramdisk | gzip > recovery.img-ramdisk.gz
echo "Creating New recovery.img"
./tools/mkbootimg --kernel recovery.img-zImage --ramdisk recovery.img-ramdisk.gz --cmdline "$cmdline" --base "$base" --pagesize "$pagesize" -o new_recovery.img
tput setaf 1
echo "Created new_recovery.img"
echo "Press any key"
read press
else echo "Unpacked recovery.img not found"
echo "Press any key"
read press
fi
;;

5)rm -Rf boot* recovery* new* configs
;;

6)exit
;;
esac
done
