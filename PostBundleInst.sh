#!/bin/bash


ROOTPATH="$HOME/.vim"
RCPATH="$HOME/.vimrc"

#update solarized
ln -sf $ROOTPATH"/bundle/vim-colors-solarized/colors/solarized.vim" \
	$ROOTPATH"/colors/solarized.vim"

#update Pathogen
ln -sf  $ROOTPATH"/bundle/vim-pathogen/autoload/pathogen.vim" \
	 $ROOTPATH"/autoload/pathogen.vim"

#config Powerline fonts
cp -r FZSXSLKJW-Powerline.TTF ~/.fonts
sudo fc-cache -vf
