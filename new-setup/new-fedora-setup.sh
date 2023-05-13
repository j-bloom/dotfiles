#!/bin/bash

sudo dnf update
wait

sudo dnf upgrade -y
wait

sudo dnf autoremove -y
wait

#Update dnf.conf file
echo "#Added for speed:" | sudo tee -a/etc/dnf/dnf.conf
echo "fastestmirror=True" | sudo tee -a/etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a/etc/dnf/dnf.conf
echo "defaultyes=True" | sudo tee -a/etc/dnf/dnf.conf
echo "keepcache=True" | sudo tee -a/etc/dnf/dnf.conf

#Install free/non-free repos and media packages
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo dnf install ansible -y
wait

#Flatpak is installed in Fedora by default
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
wait

source new-setup-all-systems.sh
