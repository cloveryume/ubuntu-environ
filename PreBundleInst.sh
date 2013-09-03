#!/bin/bash


ROOTPATH="$HOME/.vim"
RCPATH="$HOME/.vimrc"

#copy .vimrc
cp -r vimrc $RCPATH 

#copy pathogen
mkdir -p "$ROOTPATH""/autoload"
cp -r vimfiles/autoload/pathogen.vim $ROOTPATH"/autoload/pathogen.vim"

#colors
mkdir -p "$ROOTPATH""/colors"
cp -r vimfiles/colors/solarized.vim $ROOTPATH"/colors"

#install vundle
rm -rf "$ROOTPATH""/bundle/vundle"
mkdir -p "$ROOTPATH""/bundle/vundle"
git clone https://github.com/gmarik/vundle.git "$ROOTPATH""/bundle/vundle"




