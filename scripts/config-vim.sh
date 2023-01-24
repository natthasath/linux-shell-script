#!/bin/bash

# Create the .vimrc file if it does not exist
touch ~/.vimrc

# Add custom settings to .vimrc
echo "set number" >> ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc
echo "set cursorline" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc

# Install a plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Append Plugins to .vimrc
echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
echo "Plug 'scrooloose/nerdtree'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc

# Install plugins
vim +PlugInstall +qall

# Download the desert color scheme
curl -o ~/.vim/colors/desert.vim https://raw.githubusercontent.com/fugalh/desert-vim/master/colors/desert.vim

# Add the following line to .vimrc to set the color scheme
echo "colorscheme desert" >> ~/.vimrc