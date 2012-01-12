if [ -d ~/dotfiles ]
then
  echo "\033[0;33mAlready installed"
  exit
fi

echo "\033[0;34mCloning dotfiles...\033[0m"
/usr/bin/env git clone https://jaysoo@github.com/jaysoo/dotfiles.git ~/dotfiles

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
