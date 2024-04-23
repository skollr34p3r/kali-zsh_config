#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    #kali user zsh config
    echo ""
    echo "Running install for standard user account. If root ZSH config setup is desired, run this script as root or using sudo."
    echo ""
    echo "------------------------------------------------------------------"
    echo ""
    #sudo apt install zsh -y
    #zsh --version
    #chsh -s /usr/bin/zsh 
    echo "The default shell is listed in box below. If you don't see ZSH here, you may need to uncomment lines 10-12 in this script to install ZSH and set it as the default shell."
    echo ""
    echo "######################"
    echo "#    $SHELL    #"
    echo "######################"
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    echo ""
    #Import custom .zshrc file for kali user
    echo "Backing up previous /home/kali/.zshrc file as /home/kali/.zshrc.bak"
    echo ""
    cp /home/kali/.zshrc /home/kali/.zshrc.bak
    echo "Installing custom zsh config file for kali user"
    echo ""
    curl -o /home/kali/.zshrc https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.zshrc
    echo ""
    echo "------------------------------------------------------------------"

    echo ""
    #Install oh-my-zsh while keeping original .zshrc file
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    echo ""
    echo "Installing oh-my-zsh plugins for kali user"
    echo ""
    #Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo ""
    #Install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo ""
    echo "------------------------------------------------------------------"

    echo ""
    #Install powerlevel10k theme for kali user
    echo "Installing powerlevel10k for kali user"
    echo ""
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    echo ""
    #Import custom .p10k.zsh file for kali user
    echo "Installing p10k configuration file for kali user"
    echo ""
    curl -o /home/kali/.p10k.zsh https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.p10k.zsh
    echo ""
    echo "------------------------------------------------------------------"

    echo ""
    #Import other configuration files for kali user
    echo "Installing other config files for kali user"
    echo ""
    curl -o /home/kali/.aliases https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.aliases
    echo ""    
    curl -o /home/kali/.xinitrc https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.xinitrc
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    echo ""
    #Install nerd font
    echo "Installing MesloLGS Nerd Font"
    echo ""
    mkdir -p /home/kali/.local/share/fonts
    curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output /home/kali/.local/share/fonts/'MesloLGS NF Regular.ttf'
    echo ""
    curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output /home/kali/.local/share/fonts/'MesloLGS NF Bold.ttf'
    echo ""
    curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output /home/kali/.local/share/fonts/'MesloLGS NF Italic.ttf'
    echo ""
    curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output /home/kali/.local/share/fonts/'MesloLGS NF Bold Italic.ttf'
    echo ""
    fc-cache -f
    echo "------------------------------------------------------------------"

    echo ""
    #Source the new .zshrc file
    echo "kali user onfig done. ZSH will reload now."
    echo ""
    echo "If all went well, you should see a new prompt at the bottom of the screen!"
    echo ""
    echo "Now run the script as root or with sudo permissions to configure ZSH for root."
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo ""
    exec zsh
fi

#root user zsh config
echo ""
echo "Double checking root premissions with whoami:"
echo "================================="
echo "  my username is: $(whoami)"
echo "================================="
echo ""
echo "------------------------------------------------------------------"
echo ""
#sudo apt install zsh -y
#zsh --version
#chsh -s /usr/bin/zsh 
echo "The default shell for the root user listed in the box below. If you don't see ZSH, you may need to uncomment lines 113-115 in this script to install ZSH and set it as the default shell."
echo ""
echo "######################"
echo "#    $SHELL    #"
echo "######################"
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo ""
#Import custom .zshrc file for root user
echo "Backing up previous /root/.zshrc file as /root/.zshrc.bak"
echo ""
cp /root/.zshrc /root/.zshrc.bak
echo "Installing custom zsh config file for root user"
echo ""
curl -o /root/.zshrc https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/root/root.zshrc
echo ""
echo "------------------------------------------------------------------"

echo ""
#Install oh-my-zsh while keeping original .zshrc file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo ""
echo "Installing oh-my-zsh plugins for root user"
echo ""
#Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo ""
#Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo ""
echo "------------------------------------------------------------------"

echo ""
#Install powerlevel10k for root user
echo "Installing powerlevel10k theme for root user"
echo ""
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo ""
#Import custom .p10k.zsh file for root user
echo "Installing p10k configuration file for root user"
echo ""
curl -o /root/.p10k.zsh https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/root/root.p10k.zsh
echo ""
echo "------------------------------------------------------------------"

echo ""
#Import other custom config files for root user
echo "Installing other configuration files for root user"
echo ""
curl -o /root/.aliases https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.aliases
curl -o /root/.xinitrc https://raw.githubusercontent.com/skollr34p3r/kali-zsh_config/main/kali/kali.xinitrc
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


echo ""
#Install nerd fonts
echo "Installing MesloLGS Nerd Fonts for root user"
echo ""
mkdir -p /root/.local/share/fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output /root/.local/share/fonts/'MesloLGS NF Regular.ttf'
echo ""
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output /root/.local/share/fonts/'MesloLGS NF Bold.ttf'
echo ""
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output /root/.local/share/fonts/'MesloLGS NF Italic.ttf'
echo ""
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output /root/.local/share/fonts/'MesloLGS NF Bold Italic.ttf'
echo ""
fc-cache -f
echo "------------------------------------------------------------------"

echo ""
#Source the new .zshrc file
echo "root ZSH config done. ZSH will reload now."
echo ""
echo "If all went well with the root configuration script, you should see a new root prompt at the bottom of thee screen! A logging script should also start and tell you where the script logs are stored!"
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
exec zsh
