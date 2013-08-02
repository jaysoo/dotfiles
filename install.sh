if [ -d ~/dotfiles ]
then
    echo "\033[0;34mUpdating dotfiles...\033[0m"
    cd ~/dotfiles ; /usr/bin/env git pull origin master ; cd -
else
    echo "\033[0;34mCloning dotfiles...\033[0m"
	/usr/bin/env git clone git://github.com/jaysoo/dotfiles.git ~/dotfiles
fi


echo

mkdir -p $HOME/local
touch $HOME/zshrc.sh


# Install jsctags
echo
echo "\033[0;34mInstalling jsctags...\033[0m"
pushd ~
git clone git://github.com/mozilla/doctorjs.git doctorjs
cd doctorjs
git submodule init ; git submodule update
make install PREFIX="$HOME/local" > /dev/null
popd


# Install pathogen
echo
echo "\033[0;34mInstalling pathogen...\033[0m"
mkdir -p ~/.vim/autoload ~/.vim/bundle
if [ ! -f ~/.vim/autoload/pathogen.vim ]
then
    curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
fi


# Install solarized
echo
echo "\033[0;34mInstalling solarized...\033[0m"
if [ ! -d ~/.vim/bundle/vim-colors-solarized ]
then
	cd ~/.vim/bundle
	git clone git://github.com/altercation/vim-colors-solarized.git
	cd -
fi

echo

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32m Backing up to ~/.vimrc.bak\033[0m";
  cp ~/.vimrc ~/.vimrc.bak;
  rm ~/.vimrc;
fi

if [ -f ~/.vim ] || [ -h ~/.vim ]
then
  echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32m Backing up to ~/.vim.bak\033[0m";
  cp ~/.vim ~/.vim.bak;
  rm ~/.vim;
fi

if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]
then
  echo "\033[0;33mFound ~/.bashrc.\033[0m \033[0;32mBacking up to ~/.bashrc.bak\033[0m";
  cp ~/.bashrc ~/.bashrc.bak;
  rm ~/.bashrc;
fi


echo
echo "\033[0;34mCreating symlinks...\033[0m"
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.jshintrc ~/.jshintrc
ln -s ~/dotfiles/.rubocop.yml ~/.rubocop.yml

# Install OH MY ZSHELL
echo
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


# Setup git alias

echo
echo "\033[0;34mSetting up git aliases...\033[0m"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


echo
echo "\n\n \033[0;32m... finished setup.\033[0m"
