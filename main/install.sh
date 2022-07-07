#!/usr/bin/bash
# Contains functions for adding dotfiles and installing zsh

# Variables
dotfilePath=~/.dotfiles
backupDir=$dotfilePath/backup
dotfiles=()

# Back up Dotfiles and create symlinks to dotfilePath
basicInstall () {
    # Populate dotfiles array with files ignoring install.sh
    for file in *; do
        if [[ ! $file == 'install.sh' ]]; then
            dotfiles+=( $file )
        fi
    done

    # Create Directory ~/.dotfiles
    if [[ ! -d $dotfilePath ]]; then
        mkdir $dotfilePath
    fi

    # Loop through dotfile array and make backup
    if [[ ! -d $backupDir ]]; then
        mkdir $backupDir
    fi

    for file in ${dotfiles[@]}; do
        if [[ -e ~/.$file ]]; then
            echo "Backing up $file to $backupDir/$file."
            mv  ~/.$file $backupDir/$file
        fi
    done

    # Create Symoblic link in home directory to dotfiles
    for file in ${dotfiles[@]}; do
        cp -r ./$file $dotfilePath
        echo "Creating link ~/.$file to $dotfilePath/$file."
        ln -s $dotfilePath/$file ~/.$file
    done
}

# Installs Zsh with Oh-My-Zsh as a Zsh framework
zshInstall () {
    # Install Zsh if not installed.
    if ! command -v zsh &> /dev/null ; then
        echo "Please install Zsh"
    fi

    # Install Curl if not installed.
    if ! command -v curl &> /dev/null ; then
        echo "Please install Curl"
    fi

    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Set Zsh as default Shell
    chsh -s $(which zsh) $USER

    # Install p10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # Install Zsh Syntax Highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # If zshrc backup, move back to original
    if [[ -e ~/.zshrc.pre-oh-my-zsh ]]; then
        mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
    fi
}

if [[ $1 == "basic" ]]; then
    basicInstall
elif [[ $1 == "full" ]]; then
    zshInstall
    basicInstall
else
    echo "Usage: ./install.sh [basic|full]"
    exit 1
fi

exit 0
