#!/usr/bin/bash
# Installs dotfiles by replacing existing dotfiles
# and creating a symlink to ~/.dotfiles.

dotfilePath=~/.dotfiles
backupDir=$dotfilePath/backup
dotfiles=()

# Populate dotfiles array with files ignoring install.sh
for file in *; do
    if [[ ! $file == 'install.sh' ]]; then
        dotfiles+=( $(echo $file) )
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
