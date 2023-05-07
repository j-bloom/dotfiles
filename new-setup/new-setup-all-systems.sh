#!/bin/bash

ansible-playbook --ask-become-pass sys_setup.yml
wait

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
wait

mkdir -p ~/Projects/Code/

cp ../i3/config ~/.config/i3

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
cat ~/.ssh/id_ed25519.pub > ~/GitHubSSH.txt #sends key to file for easy copying

#After adding key to GitHub - Test connection
#ssh -T git@github.com

#Add passphrase to GitHub key with below command
#ssh-keygen -p -f ~/.ssh/id_ed25519

### VERSIONS OF RUNTIMES AND PACKAGES MAY NEED TO BE UPDATED AT TIME OF USING SCRIPT! ###

  if cat /etc/*release | grep ^NAME | grep Debian; then
    sudo apt-get update && sudo apt-get install -y dotnet7
    sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-7.0
    sudo apt-get install -y dotnet-runtime-7.0

### Currently not available for Ubuntu 23.04 ###
  #elif cat /etc/*release | grep ^NAME | grep Ubuntu ; then

  elif cat /etc/*release | grep ^NAME | grep Fedora; then
    sudo dnf install dotnet-sdk-7.0
    sudo dnf install aspnetcore-runtime-7.0
    sudo dnf install dotnet-runtime-7.0
  else
     echo "OS NOT DETECTED, couldn't install package $PACKAGE"
     exit 1
  fi

###Currently not working in script, needs to be manually entered
nvm install --lts #ensure this is run before npm packages

npm install -g vscode-langservers-extracted
npm install -g eslint
npm install -g typescript-language-server typescript
#npm i -g pyright install dotnet7
