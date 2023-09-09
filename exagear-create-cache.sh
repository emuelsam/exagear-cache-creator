#!/bin/bash

export SELECTED_OS=""
export SELECTED_OS_NUM=""

clear
echo 'ExaGear cache creator by Grima04, based on instructions from Zhymabek Roman, modified by mtechlibya'

echo ''
echo 'Please select the Ubuntu version that you want to use for your cache:'
osOptions=("Ubuntu 16.04" "Ubuntu 20.04")
select OPT in "${osOptions[@]}"
do
	case $OPT in
		"Ubuntu 16.04")
			clear
			echo "Using $OPT to create the cache..."
			export SELECTED_OS="xenial"
			export SELECTED_OS_NUM="16.04"
			break
			;;
		"Ubuntu 20.04")
			clear
			echo "Using $OPT to create the cache..."
			export SELECTED_OS="focal"
			export SELECTED_OS_NUM="20.04"
			break
			;;
		*)      echo "Invalid option $REPLY";;
	esac
done

echo 'Starting to download the Ubuntu rootfs...'

sudo mkdir -p $SELECTED_OS
sudo debootstrap --arch=i386 --variant=minbase $SELECTED_OS $SELECTED_OS http://mirror.yandex.ru/ubuntu

sudo cp chroot.sh $SELECTED_OS
sudo touch vars.txt
if [ $SELECTED_OS == "focal" ]
then
	printf 'focal' > vars.txt
elif [ $SELECTED_OS == "xenial" ]
then
	printf 'xenial' > vars.txt
fi
sudo cp vars.txt $SELECTED_OS
sudo cd $SELECTED_OS
sudo mount proc -t proc ./proc
sudo mount sys -t sysfs ./sys
sudo mount --bind /dev ./dev
sudo mount --bind /dev/pts ./dev/pts
sudo chroot ./ /usr/bin/env -i HOME=/root TERM="$TERM" /bin/bash -l "chroot.sh"

sudo umount dev/pts dev proc sys

cd ..

sudo cp -r cache-fixes/. $SELECTED_OS
sudo cp -r libs/. $SELECTED_OS

sudo cd $SELECTED_OS
sudo zip --symlinks -r main.30.com.eltechs.ed.obb .
sudo cp main.30.com.eltechs.ed.obb ../obb-cache

cd ..
sudo rm -r $SELECTED_OS

clear

echo 'Done! You can now copy your .obb cache from obb-cache to your phone.'
