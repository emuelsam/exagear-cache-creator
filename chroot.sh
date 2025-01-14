#!/bin/bash

export SELECTED_OS="$(<vars.txt)"
echo $SELECTED_OS

export PATH
export WINE_VER
export WINE_VER_NUM
export WINE_OPT

clear

apt update
apt install -y nano wget gnupg software-properties-common
wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -

if [ $SELECTED_OS == "focal" ]
then
        add-apt-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ focal main"
        add-apt-repository "deb http://de.archive.ubuntu.com/ubuntu focal main universe"
        wget -O- -q http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04/Release.key | apt-key add - 
        echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04 ./" | tee /etc/apt/sources.list.d/wine-obs.list
elif [ $SELECTED_OS == "xenial" ]
then
        add-apt-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ xenial main"
        add-apt-repository "deb http://de.archive.ubuntu.com/ubuntu xenial main universe"
        wget -O- -q http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_16.04/Release.key | apt-key add - 
	echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_16.04 ./" | tee /etc/apt/sources.list.d/wine-obs.list
fi


echo 'Please select if you want to use Wine stable or Wine devel:'
wineOptions=("winehq-stable" "winehq-devel")
select OPT2 in "${wineOptions[@]}"
do
        case $OPT2 in
                "winehq-stable")
			clear
                        echo "Using $OPT2 to create the cache..."
                        export WINE_VER="winehq-stable"
                        break
                        ;;
                "winehq-devel")
			clear
                        echo "Using $OPT2 to create the cache..."
                        export WINE_VER="winehq-devel"
                        break
                        ;;
                *)      echo "Invalid option $REPLY";;
        esac
done

if [ $SELECTED_OS == "focal" ]
then
	if [ $WINE_VER == "winehq-stable" ]
		then
		echo 'Please select which Wine stable version you want to install:'
		export WINE_OPT=("3.0" "4.0" "5.0" "6.0" "8.0")
		select OPT3 in "${WINE_OPT[@]}"
		do
        		case $OPT3 in
                		"3.0")
                        		echo "Using Wine $OPT3 to create the cache..."
                        		export WINE_VER="winehq-stable=3.0.5~focal wine-stable=3.0.5~focal wine-stable-i386=3.0.5~focal"
                        		break
                        		;;
                		"4.0")
                        		echo "Using Wine $OPT3 to create the cache..."
                        		export WINE_VER="winehq-stable=4.0.4~focal wine-stable=4.0.4~focal wine-stable-i386=4.0.4~focal"
                        		break
                        		;;
				"5.0")
                                	echo "Using Wine $OPT3 to create the cache..."
                                	export WINE_VER="winehq-stable=5.0.4~focal-1 wine-stable=5.0.4~focal-1 wine-stable-i386=5.0.4~focal-1"
                                	break
                                	;;
				"6.0")
                                	echo "Using Wine $OPT3 to create the cache..."
                                	export WINE_VER="winehq-stable=6.0.0~focal-1 wine-stable=6.0.0~focal-1 wine-stable-i386=6.0.0~focal-1"
                                	break
                                	;;
				"8.0")
                                	echo "Using Wine $OPT3 to create the cache..."
                                	export WINE_VER="winehq-stable=8.0.0~focal-1 wine-stable=8.0.0~focal-1 wine-stable-i386=8.0.0~focal-1"
                                	break
                                	;;
                		*)      	echo "Invalid option $REPLY";;
        		esac
		done
	elif [ $WINE_VER == "winehq-devel" ]
		then
		echo 'Please select which Wine devel version you want to install:'
                export WINE_OPT=("3.10" "3.11" "3.12" "3.13" "3.14" "3.15" "3.16" "3.17" "3.18" "3.19" "3.20" "3.21" "4.0" "4.1" "4.2" "4.3" "4.4" "4.5" "4.6" "4.7" "4.8" "4.9" "4.10" "4.11" "4.12" "4.13" "4.14" "4.15" "4.16" "4.17" "4.18" "4.19" "4.20" "4.21" "5.0" "5.1" "5.2" "5.3" "5.4" "5.5" "5.6" "5.7" "5.8" "5.9" "5.10" "5.11" "5.12" "5.13" "5.14" "5.15" "5.16" "5.17" "5.18" "5.19" "5.20" "5.21" "5.22" "6.0" "6.1" "6.2" "6.3" "6.4" "6.5" "6.6" "8.0" "8.1" "8.2")
                select OPT3 in "${WINE_OPT[@]}"
                do
                        case $OPT3 in
                                "3.10")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.10.0~focal wine-devel=3.10.0~focal wine-devel-i386=3.10.0~focal"
                                        break
                                        ;;
                                "3.11")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.11.0~focal wine-devel=3.11.0~focal wine-devel-i386=3.11.0~focal"
                                        break
                                        ;;
                                "3.12")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.12.0~focal wine-devel=3.12.0~focal wine-devel-i386=3.12.0~focal"
                                        break
                                        ;;
				                "3.13")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.13.0~focal wine-devel=3.13.0~focal wine-devel-i386=3.13.0~focal"
                                        break
                                        ;;
                                "3.14")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.14.0~focal wine-devel=3.14.0~focal wine-devel-i386=3.14.0~focal"
                                        break
                                        ;;
                                "3.15")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.15.0~focal wine-devel=3.15.0~focal wine-devel-i386=3.15.0~focal"
                                        break
                                        ;;
				                "3.16")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.16.0~focal wine-devel=3.16.0~focal wine-devel-i386=3.16.0~focal"
                                        break
                                        ;;
                                "3.17")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.17.0~focal wine-devel=3.17.0~focal wine-devel-i386=3.17.0~focal"
                                        break
                                        ;;
                                "3.18")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.18.0~focal wine-devel=3.18.0~focal wine-devel-i386=3.18.0~focal"
                                        break
                                        ;;
                                "3.19")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.19.0~focal wine-devel=3.19.0~focal wine-devel-i386=3.19.0~focal"
                                        break
                                        ;;
                                "3.20")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.20.0~focal wine-devel=3.20.0~focal wine-devel-i386=3.20.0~focal"
                                        break
                                        ;;
                                "3.21")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=3.21.0~focal wine-devel=3.21.0~focal wine-devel-i386=3.21.0~focal"
                                        break
                                        ;;
				                "4.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.0~focal wine-devel=4.0~focal wine-devel-i386=4.0~focal"
                                        break
                                        ;;
                                "4.1")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.1~focal wine-devel=4.1~focal wine-devel-i386=4.1~focal"
                                        break
                                        ;;
                                "4.2")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.2~focal wine-devel=4.2~focal wine-devel-i386=4.2~focal"
                                        break
                                        ;;
                                "4.3")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.3~focal wine-devel=4.3~focal wine-devel-i386=4.3~focal"
                                        break
                                        ;;
                                "4.4")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.4~focal wine-devel=4.4~focal wine-devel-i386=4.4~focal"
                                        break
                                        ;;
                                "4.5")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.5~focal wine-devel=4.5~focal wine-devel-i386=4.5~focal"
                                        break
                                        ;;
				                "4.6")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.6~focal wine-devel=4.6~focal wine-devel-i386=4.6~focal"
                                        break
                                        ;;
                                "4.7")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.7~focal wine-devel=4.7~focal wine-devel-i386=4.7~focal"
                                        break
                                        ;;
                                "4.8")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.8~focal wine-devel=4.8~focal wine-devel-i386=4.8~focal"
                                        break
                                        ;;
                                "4.9")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.9~focal wine-devel=4.9~focal wine-devel-i386=4.9~focal"
                                        break
                                        ;;
                                "4.10")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.10~focal wine-devel=4.10~focal wine-devel-i386=4.10~focal"
                                        break
                                        ;;
                                "4.11")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.11~focal wine-devel=4.11~focal wine-devel-i386=4.11~focal"
                                        break
                                        ;;
				                "4.12")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.12~focal wine-devel=4.12~focal wine-devel-i386=4.12~focal"
                                        break
                                        ;;
                                "4.13")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.13~focal wine-devel=4.13~focal wine-devel-i386=4.13~focal"
                                        break
                                        ;;
                                "4.14")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.14~focal wine-devel=4.14~focal wine-devel-i386=4.14~focal"
                                        break
                                        ;;
                                "4.15")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.15~focal wine-devel=4.15~focal wine-devel-i386=4.15~focal"
                                        break
                                        ;;
                                "4.16")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.16~focal wine-devel=4.16~focal wine-devel-i386=4.16~focal"
                                        break
                                        ;;
                                "4.17")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.17~focal wine-devel=4.17~focal wine-devel-i386=4.17~focal"
                                        break
                                        ;;
				                "4.18")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.18~focal wine-devel=4.18~focal wine-devel-i386=4.18~focal"
                                        break
                                        ;;
                                "4.19")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.19~focal wine-devel=4.19~focal wine-devel-i386=4.19~focal"
                                        break
                                        ;;
                                "4.20")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.20~focal wine-devel=4.20~focal wine-devel-i386=4.20~focal"
                                        break
                                        ;;
                                "4.21")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=4.21~focal wine-devel=4.21~focal wine-devel-i386=4.21~focal"
                                        break
                                        ;;
                                "5.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.0.0~focal wine-devel=5.0.0~focal wine-devel-i386=5.0.0~focal"
                                        break
                                        ;;
                                "5.1")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.1~focal wine-devel=5.1~focal wine-devel-i386=5.1~focal"
                                        break
                                        ;;
                                "5.2")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.2~focal wine-devel=5.2~focal wine-devel-i386=5.2~focal"
                                        break
                                        ;;
                                "5.3")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.3~focal wine-devel=5.3~focal wine-devel-i386=5.3~focal"
                                        break
                                        ;;
                                "5.4")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.4~focal wine-devel=5.4~focal wine-devel-i386=5.4~focal"
                                        break
                                        ;;
                                "5.5")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.5~focal wine-devel=5.5~focal wine-devel-i386=5.5~focal"
                                        break
                                        ;;
                                "5.6")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.6~focal wine-devel=5.6~focal wine-devel-i386=5.6~focal"
                                        break
                                        ;;
                                "5.7")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.7~focal wine-devel=5.7~focal wine-devel-i386=5.7~focal"
                                        break
                                        ;;
                                "5.8")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.8~focal wine-devel=5.8~focal wine-devel-i386=5.8~focal"
                                        break
                                        ;;
                                "5.9")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.9~focal wine-devel=5.9~focal wine-devel-i386=5.9~focal"
                                        break
                                        ;;
                                "5.10")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.10~focal wine-devel=5.10~focal wine-devel-i386=5.10~focal"
                                        break
                                        ;;
                                "5.11")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.11~focal wine-devel=5.11~focal wine-devel-i386=5.11~focal"
                                        break
                                        ;;
                                "5.12")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.12~focal wine-devel=5.12~focal wine-devel-i386=5.12~focal"
                                        break
                                        ;;
                                "5.13")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.13~focal wine-devel=5.13~focal wine-devel-i386=5.13~focal"
                                        break
                                        ;;
                                "5.14")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.14~focal wine-devel=5.14~focal wine-devel-i386=5.14~focal"
                                        break
                                        ;;
                                "5.15")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.15~focal wine-devel=5.15~focal wine-devel-i386=5.15~focal"
                                        break
                                        ;;
                                "5.16")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.16~focal wine-devel=5.16~focal wine-devel-i386=5.16~focal"
                                        break
                                        ;;
                                "5.17")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.17~focal wine-devel=5.17~focal wine-devel-i386=5.17~focal"
                                        break
                                        ;;
                                "5.18")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.18~focal wine-devel=5.18~focal wine-devel-i386=5.18~focal"
                                        break
                                        ;;
                                "5.19")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.19~focal wine-devel=5.19~focal wine-devel-i386=5.19~focal"
                                        break
                                        ;;
                                "5.20")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.20~focal wine-devel=5.20~focal wine-devel-i386=5.20~focal"
                                        break
                                        ;;
                                "5.21")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.21~focal wine-devel=5.21~focal wine-devel-i386=5.21~focal"
                                        break
                                        ;;
                                "5.22")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=5.22~focal wine-devel=5.22~focal wine-devel-i386=5.22~focal"
                                        break
                                        ;;
                                "6.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.0.0~focal-1 wine-devel=6.0.0~focal-1 wine-devel-i386=6.0.0~focal-1"
                                        break
                                        ;;
                                "6.1")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.1~focal-1 wine-devel=6.1~focal-1 wine-devel-i386=6.1~focal-1"
                                        break
                                        ;;
                                "6.2")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.2~focal-1 wine-devel=6.2~focal-1 wine-devel-i386=6.2~focal-1"
                                        break
                                        ;;
                                "6.3")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.3~focal-1 wine-devel=6.3~focal-1 wine-devel-i386=6.3~focal-1"
                                        break
                                        ;;
                                "6.4")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.4~focal-1 wine-devel=6.4~focal-1 wine-devel-i386=6.4~focal-1"
                                        break
                                        ;;
                                "6.5")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.5~focal-1 wine-devel=6.5~focal-1 wine-devel-i386=6.5~focal-1"
                                        break
                                        ;;
                                "6.6")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=6.6~focal-1 wine-devel=6.6~focal-1 wine-devel-i386=6.6~focal-1"
                                        break
                                        ;;
                                "8.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=8.0.0~focal-1 wine-devel=8.0.0~focal-1 wine-devel-i386=8.0.0~focal-1"
                                        break
                                        ;;
                                "8.1")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=8.1~focal-1 wine-devel=8.1~focal-1 wine-devel-i386=8.1~focal-1"
                                        break
                                        ;;
                                "8.2")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-devel=8.2~focal-1 wine-devel=8.2~focal-1 wine-devel-i386=8.2~focal-1"
                                        break
                                        ;;
                                *)              echo "Invalid option $REPLY";;
                        esac
                done
	fi

elif [ $SELECTED_OS == "xenial" ]
then
        if [ $WINE_VER == "winehq-stable" ]
                then
                echo 'Please select which Wine stable version you want to install:'
                export WINE_OPT=("3.0" "4.0" "5.0")
                select OPT3 in "${WINE_OPT[@]}"
                do
                        case $OPT3 in
                                "3.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-stable=3.0.5~xenial wine-stable=3.0.5~xenial wine-stable-i386=3.0.5~xenial"
                                        break
                                        ;;
                                "4.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-stable=4.0.4~xenial wine-stable=4.0.4~xenial wine-stable-i386=4.0.4~xenial"
                                        break
                                        ;;
                                "5.0")
                                        echo "Using Wine $OPT3 to create the cache..."
                                        export WINE_VER="winehq-stable=5.0.3~xenial wine-stable=5.0.3~xenial wine-stable-i386=5.0.3~xenial"
                                        break
                                        ;;
                                *)              echo "Invalid option $REPLY";;
                        esac
                done
        fi
fi

apt update
apt install -y $WINE_VER

apt install -y fakeroot
apt install -y locales

locale-gen --no-archive en_US.utf8

apt clean

exit
