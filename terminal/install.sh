#!/bin/bash
cp dircolors.256dark ~/.dircolors.256dark

cat profile >> ~/.profile

cd gnome-terminal-colors-solarized
./install.sh
