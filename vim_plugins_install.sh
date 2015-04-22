#!/bin/bash

#####################################################################
# Function    : Vim plugins installation script for new installation#
# Author      : Albert Chen                                         #
# Version     : 2.71                                                #
# Last Update : 2015-04-22                                          #
#####################################################################

# Setting Bundle directory in Windows or *nix system
if [ `uname -s | grep 'MINGW32_NT'` ]; then
    VIMFILE='~/vimfiles/'
else
    VIMFILE='~/.vim/'
fi

# Check VIMFILE directory
if [ ! -d "$VIMFILE" ]; then
    mkdir $VIMFILE
    echo '$VIMFILE directory is OK.'
else
    echo '$VIMFILE directory is OK.'
    if [ ! -d "$VIMFILE/autoload/" ]; then
        cd $VIMFILE
        mkdir 'autoload'
        echo 'autoload directory is OK.'
    else
        echo 'autoload directory is OK.'
        if [ ! -d "$VIMFILE/bundle" ]; then
            cd $VIMFILE
            mkdir 'bundle'
            echo 'bundle directory is OK.'
        else
            echo 'bundle directory is OK.'
        fi
    fi
fi

# Generate vimrc
if [ `uname -s | grep 'MINGW32_NT'` ]; then
    cp ./_vimrc ~/_vimrc
else
    cp ./vimrc ~/.vimrc
fi

# Install molokai colorscheme
cp -r ./colors $VIMFILE/

# Check pathogen installation
if [ ! -f "$VIMFLE/autoload/pathogen.vim" ]; then
    cd '$VIMFILE/autoload/'
    wget https://tpo.pe/pathogen.vim
    echo 'Pathogen installation is OK.'
else
    echo 'Pathogen installation is OK'
fi



# Plugins installation
cd '$VIMFILE/bundle'
git clone https://github.com/yonchu/accelerated-smooth-scroll.git
git clone https://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/terryma/vim-multiple-cursors.git

exit
