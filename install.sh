#!/bin/bash
echo "Installing dotfiles..."

DIR=$PWD

# create symlinks
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.gitconfig ~/.gitconfig
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.docker/ ~/.docker
#ln -sf $DIR/mc-solarized.ini ~/mc-solarized.ini
# ln -n (--no-dereference) prevents recursive symlinking of directory symlinks
#ln -nsf $DIR/.bash ~/.bash

# source .bashrc file to existing .bashrc if it's not already included
BSA_INCLUDE=". $DIR/.bash_aliases"
BSF_INCLUDE=". $DIR/.bash_functions"
BSE_INCLUDE=". $DIR/.bash_exports"
BSP_INCLUDE=". $DIR/.bash_prompt"

if grep -Fq "$BSA_INCLUDE" ~/.bashrc;
    then :;
else
    echo -e "\n$BSA_INCLUDE" >> ~/.bashrc
fi

if grep -Fq "$BSF_INCLUDE" ~/.bashrc;
    then :;
else
    echo -e "$BSF_INCLUDE" >> ~/.bashrc
fi

if grep -Fq "$BSE_INCLUDE" ~/.bashrc;
    then :;
else
    echo -e "$BSE_INCLUDE" >> ~/.bashrc
fi

if grep -Fq "$BSP_INCLUDE" ~/.bashrc;
    then :;
else
    echo -e "$BSP_INCLUDE" >> ~/.bashrc
fi

echo "Installation complete! Relogin please"

