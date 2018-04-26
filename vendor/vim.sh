#!/usr/bin/env zsh

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle

git clone git@github.com:mileszs/ack.vim.git
git clone git@github.com:ctrlpvim/ctrlp.vim.git
git clone git@github.com:Shougo/unite.vim.git
git clone git://github.com/tommcdo/vim-lion.git
git clone git@github.com:jpalardy/vim-slime.git
git clone git@github.com:tpope/vim-surround.git
git clone git@github.com:Shougo/vimfiler.vim.git
git clone https://github.com/Shougo/vimproc.vim.git

mkdir -p $HOME/.vim/colors/src
cd $HOME/.vim/colors/src

git clone git@github.com:morhetz/gruvbox.git

cd $HOME/.vim/colors
ln -s $HOME/.vim/colors/src/gruvbox/colors/gruvbox.vim


