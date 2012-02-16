#!/bin/sh

if [ -d ~/dotfiles ]
then
    echo "\033[0;34mUpdating dotfiles...\033[0m"
    cd ~/dotfiles ; /usr/bin/env git pull origin master ; cd -
else
    echo "\033[0;34mCloning dotfiles...\033[0m"
	/usr/bin/env git clone git://github.com/jaysoo/dotfiles.git ~/dotfiles
fi

mkdir -p $HOME/lib

# Install Exuberant Ctags
pushd ~
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz -o ctags-5.8.tar.gz
tar zxvf ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix=$HOME/lib
make ; make install
popd

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
fi

# Install solarized

if [ ! -d ~/.vim/bundle/vim-colors-solarized ]
then
	cd ~/.vim/bundle
	git clone git://github.com/altercation/vim-colors-solarized.git
	cd -
fi

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32]Backing up to ~/.vimrc.bak\033[0m";
  cp ~/.vimrc ~/.vimrc.bak;
  rm ~/.vimrc;
fi

if [ -f ~/.vim ] || [ -h ~/.vim ]
then
  echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32]Backing up to ~/.vim.bak\033[0m";
  cp ~/.vim ~/.vim.bak;
  rm ~/.vim;
fi

if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]
then
  echo "\033[0;33mFound ~/.bashrc.\033[0m \033[0;32]Backing up to ~/.bashrc.bak\033[0m";
  cp ~/.bashrc ~/.bashrc.bak;
  rm ~/.bashrc;
fi

echo "\033[0;34mCreating symlinks...\033[0m"
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim

echo "\n\n \033[0;32m... finished setup.\033[0m"

# Install OH MY ZSHELL
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
