#!/usr/bin/env bash

echo "Running ./macos/new_comp.sh..."
~/dotfilesv2/macos/new_comp.sh

echo "Running ./macos/brew.sh..."
~/dotfilesv2/macos/brew.sh

pushd ~/dotfilesv2 || return
pwd

echo "Running stow -R config..."
stow -R config
echo "Running stow -R tmux..."
stow -R tmux
echo "Running stow -R vim..."
stow -R vim
echo "Running stow -R zsh..."
stow -R zsh
echo "Set up git config manually pls"
