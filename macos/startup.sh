#!/usr/bin/env bash

echo "Running ./macos/new_comp.sh..."
~/dotfilesv2/macos/new_comp.sh

echo "Running ./macos/brew.sh..."
~/dotfilesv2/macos/brew.sh

echo "Running ./macos/asdf_setup.sh..."
~/dotfilesv2/macos/asdf_setup.sh

echo "Running mkdir ~/Library/KeyBindings/..."
mkdir ~/Library/KeyBindings

pushd ~/Library/KeyBindings || exit
pwd
ln -s ~/dotfilesv2/macos/DefaultKeyBinding.dict .

pushd ~/dotfilesv2 || return
pwd

echo "Running stow -R config..."
stow -R config
echo "Running stow -R ctags..."
stow -R ctags
echo "Running stow -R git..."
stow -R git
echo "Running stow -R scripts..."
stow -R scripts
echo "Running stow -R tmux..."
stow -R tmux
echo "Running stow -R vim..."
stow -R vim
echo "Running stow -R zsh..."
stow -R zsh
