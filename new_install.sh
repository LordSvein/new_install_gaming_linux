#!/bin/bash

distro=$(lsb_release -ds | tr -d '"')
graphiqueCards=$(glxinfo|egrep "OpenGL vendor")


declare -a arch=( 'Manjaro Linux' "EndeavourOS Linux" "Arch Linux" )
declare -a ubuntu=( "Ubuntu 22.04 LTS" "Ubuntu 20.04 LTS" )
declare -a zorin=( "Zorin OS 16.1" "Zorin OS 15.1" )

function kernelTKG()
{
##Frogging-Familly // CPU
cd .tmp
    git clone https://github.com/Frogging-Family/linux-tkg.git
	cd linux-tkg
	makepkg -si
cd ..
}

function nvidiaALL()
{
##Frogging-Familly // NVIDIA
cd .tmp
git clone https://github.com/Frogging-Family/nvidia-all.git
	cd nvidia-all
	makepkg -si
cd ..
}

function gamingFlatpak()
{
##Flatpak
cd .tmp
    git clone https://github.com/Chevek/Gaming-Flatpak.git
    cd Gaming-Flatpak
    sudo chmod+X gaming-flatpak.sh
    ./gaming-flatpak.sh
cd ..
}

function snap(){
##Snap
sudo snap install deckboard
}

for i in ${!arch[@]}
do

    if [ "$distro" = "${arch[i]}"  ] ;
    then
        ####Software Installer
        ##Natif
        sudo pacman -Syyuu --noconfirm  base-devel flatpak snapd keepassxc steam latte-dock nextcloud-client kvantum zenity
        snap
        gamingFlatpak
        kernelTKG
         if [ "$graphiqueCards" = "NVIDIA Corporation" ] ;
        then
            nvidiaALL
        fi
    fi

done

for i in ${!ubuntu[@]}
do
    if [ "$distro" = "${ubuntu[0]}"  ] ;
    then
        ####Software Installer
        ##Natif
        sudo apt install --noconfirm  build-essential git flatpak snapd keepassxc steam latte-dock nextcloud-client kvantum zenity
        snap
        gamingFlatpak
        kernelTKG
    fi
done

for i in ${!zorin[@]}
do
    if [ "$distro" = "${zorin[0]}"  ] ;
    then
        ####Software Installer
        ##Natif
        sudo apt install --noconfirm  build-essential git flatpak snapd keepassxc steam nextcloud-client zenity
        snap
        gamingFlatpak
        kernelTKG
    fi
done

# automatic installation - use this with care and only if you know what you're doing
# this question will answer every question pacman asks with the default answer - it may break your system
option_noconfirm="true"

##### end configuration #####
