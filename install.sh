#!/usr/bin/bash
REPO=`pwd`
VIM=~/.vim
VIMRC=~/.vimrc
JSHINTRC=~/.jshintrc
BUNDLE=$VIM/bundle
AUTOLOAD=$VIM/autoload

git submodule init
git submodule update

rm -rf $VIM
rm -f $VIMINFO
rm -f $VIMRC
rm -rf $BUNDLE
cp $REPO/.vimrc $VIMRC

#pathogen
mkdir -p $AUTOLOAD $VIM/backupdir $VIM/swapdir $VIM/undodir $VIM/config
curl -so $AUTOLOAD/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

cp -r $REPO/bundle $BUNDLE


#rust
cd $BUNDLE
mv ./rust ./rust-repo
mkdir ./rust
mv ./rust-repo/src/etc/vim/* ./rust
rm -rf ./rust-repo

#jshint
cd $BUNDLE
if type "npm" > /dev/null
then
   cp $REPO/.jshintrc $JSHINTRC
   cd $BUNDLE/jshint.vim/ftplugin/javascript/jshint/
   npm remove jshint
   npm install jshint
else
    rm -rf $BUNDLE/jshint.vim
fi
