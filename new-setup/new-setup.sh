#!/bin/bash

sudo $1 update -y
wait

sudo $1 upgrade -y
wait

sudo $1 autoremove -y
wait

if cat /etc/*release | grep ^NAME | grep Fedora; then
    #Update dnf.conf file
    echo "#Added for speed:" | sudo tee -a/etc/dnf/dnf.conf
    echo "fastestmirror=True" | sudo tee -a/etc/dnf/dnf.conf
    echo "max_parallel_downloads=10" | sudo tee -a/etc/dnf/dnf.conf
    echo "defaultyes=True" | sudo tee -a/etc/dnf/dnf.conf
    echo "keepcache=True" | sudo tee -a/etc/dnf/dnf.conf
else
    echo "OS NOT Fedora based, skipping this step"
    exit 1
fi
wait

if cat /etc/*release | grep ^NAME | grep Fedora; then
    #Install free/non-free repos and media packages
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
    sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
    sudo dnf groupupdate sound-and-video
else
    echo "OS NOT Fedora based, skipping this step"
    exit 1
fi
wait

sudo $1 install ansible -y
wait

sudo $1 install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo $1 install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
wait

mkdir -p ~/Projects/Code/

sudo $1 install i3 -y
cp ../i3/config ~/.config/i3

sudo $1 install curl -y

sudo $1 install ripgrep

sudo $1 install fd-find

#For Debian installs uncomment if OS is Debian based 
#sudo $1 install silversearcher-ag -y

#For Fedora install uncomment if OS is Fedora based
sudo $1 install the-silver-searcher -y

sudo $1 install gimp -y

#For Debian installs uncomment if OS is Debian based 
   # sudo $1 install v4l2loopback-dkms -y
   # sudo $1 install ffmpeg -y
   # sudo $1 install obs-studio -y

#For Fedora install uncomment if OS is Fedora based
    sudo $1 install obs-studio -y

sudo $1 install vlc -y

sudo $1 install emacs
mv ~/.emacs.d/ ~/.emacs.d-old
cp ~/dotfiles/.emacs.d/ ~/.emacs.d/

#Neovim config is no long maintained!
#However, feel free to use it if you want a starting point

# Packer is used in this config to manage nvim plug-ins
# git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# if cat /etc/*release | grep ^NAME | grep Debian; then
#   sudo apt-get install neovim -y
#   cp -r ../nvim ~/.config/
# elif cat /etc/*release | grep ^NAME | grep Debian ; then
#   sudo apt-get install neovim - y
#   cp -r ../nvim ~/.config/
# elif cat /etc/*release | grep ^NAME | grep Fedora; then
#   sudo dnf install neovim -y
#   cp -r ../nvim ~/.config/
# else
#   echo "OS NOT DETECTED, couldn't install package $PACKAGE"
#   exit 1
# fi

#mkdir -p ~/.local/share/fonts
### Option 1 ###
#cd  ~/.local/share/fonts
#git clone https://github.com/ryanoasis/nerd-fonts.git
#wait
#./install.sh Hack #This installs only the "Hack" Fonts
#or use ./install.sh to install all fonts
#cd ~/dotfiles/new-setup/

### Option 2 ###
#cd ~/.local/share/fonts 
#curl -fLo "Hack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf ~/.local/share/fonts
#curl -fLo "Hack BoldItalic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf ~/.local/share/fonts
#curl -fLo "Hack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf ~/.local/share/fonts 
#curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf ~/.local/share/fonts

ssh-keygen -t ed25519 -C "{place your email here}"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub > ~/GithubSSH.txt #sends key to file for easy copying

#After adding key to GitHub - Test connection
#ssh -T git@github.com

#Add passphrase to GitHub key with below command
#ssh-keygen -p -f ~/.ssh/id_ed25519

#For Debian installs uncomment if OS is Debian based 
   # sudo $1 install clangd -y
   # sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-15 100

#For Fedora install uncomment if OS is Fedora based
    sudo $1 install clang -y

sudo $1 install golang -y

### VERSIONS OF RUNTIMES AND PACKAGES MAY NEED TO BE UPDATED AT TIME OF USING SCRIPT! ###

sudo $1 update && sudo $1 install -y dotnet7
sudo $1 update && sudo $1 install -y aspnetcore-runtime-7.0
sudo $1 install -y dotnet-runtime-7.0

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
wait
