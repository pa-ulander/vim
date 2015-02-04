#!/usr/bin/env bash
REPO=`pwd`
VIM_PATH=$HOME/.vim
VIM_CACHE=$VIM_PATH/cache

git submodule init
git submodule update --remote

#clear files
rm -r $VIM_PATH $HOME/.viminfo $HOME/.vimrc $HOME/.jshintrc

#create dirs
mkdir -p $VIM_CACHE/backupdir $VIM_CACHE/swapdir $VIM_CACHE/undodir $VIM_CACHE/unite $VIM_PATH/config $VIM_PATH/colors

#bundle
cp -r $REPO/bundle $VIM_PATH/bundle

#pathogen
cp -r $REPO/misc/vim-pathogen/autoload $VIM_PATH

#themes
cp -r $REPO/misc/tomorrow-theme/vim/colors/* $VIM_PATH/colors

#rcfiles
cp $REPO/vimrc $HOME/.vimrc
cp $REPO/jshintrc $HOME/.jshintrc

#build stuff
cd $VIM_PATH/bundle/vimproc.vim
make

#add outline source for unite
cp -r $REPO/misc/unite-outline/autoload $VIM_PATH
