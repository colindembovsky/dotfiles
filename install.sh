#!/bin/sh

zshrc() {
    # clone
    echo "==========================================================="
    echo "             install powerline fonts                       "
    echo "-----------------------------------------------------------"
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
    echo "==========================================================="
    echo "             install fonts-powerline                       "
    echo "-----------------------------------------------------------"
    apt install fonts-powerline
    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "==========================================================="
    echo "             cloning zsh-syntax-highlighting               "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "             import zshrc                                  "
    echo "-----------------------------------------------------------"
    cat .zshrc > $HOME/.zshrc
}

zshrc

# these need to be after zshrc
echo "" >> ~/.zshrc
echo "# remove ls highlight color" >> ~/.zshrc
echo "LS_COLORS+=':ow=01;33'" >> ~/.zshrc

echo "" >> ~/.zshrc
echo "# set time zone" >> ~/.zshrc
echo "export TZ=America/Chicago" >> ~/.zshrc

# git config
git config pull.ff only