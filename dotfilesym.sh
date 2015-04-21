#!/bin/bash

# A script to make sym links from my cloned github dotfiles directory
# to the actual appropriate location on the system.

# ASSUMES: ~/dotfiles contains your cloud copy of dotfiles (probably cloned from github)

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="zshrc bashrc"    		  # list of files/folders to symlink in homedir
##########

# create dotfiles_old in homedir, backup of existing dotfiles in home dir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv ~/.$file ~/dotfiles_old/ 2>/dev/null
    ln -s $dir/$file ~/.$file
done