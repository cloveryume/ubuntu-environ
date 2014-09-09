#!/bin/bash
sudo apt-get install git-core -y

git config --global user.name cloveryume
git config --global user.email cloveryume@gmail.com

git config --global alias.ci commit
git config --global alias.st status

git config --global alias.last "log -1 HEAD"
git config --global alias.co checkout

