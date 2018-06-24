#!/usr/bin/env sh
CWD=$(pwd)

# Create symlinks
ln -is $CWD/dev-tmux.sh $HOME/.dev-tmux.sh
ln -is $CWD/bashrc $HOME/.bashrc
ln -is $CWD/zshrc $HOME/.zshrc
ln -is $CWD/vimrc $HOME/.vimrc
ln -is $CWD/git-prompt.sh $HOME/.git-prompt.sh
ln -is $CWD/sleeplock.sh $HOME/.sleeplock.sh
ln -is $CWD/tmux.conf $HOME/.tmux.conf
if [ -f $CWD/privaterc ] ; then
	ln -is $CWD/privaterc $HOME/.privaterc
fi

if [ -d $HOME/.config/i3  ] ; then
  ln -is $CWD/i3config $HOME/.config/i3/config 
fi
# Setup dots alias
if [ ! -f $CWD/dots_location ] ; then
	touch dots_location
	
fi
echo "alias dots='cd "$CWD"'" > dots_location 
ln -is $CWD/dots_location $HOME/.dots_location

# Set up vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ] ; then
  read -r -p "Download Vundle for vim? [y/n]" response
  response=${response,,}  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    echo "Cloning Vundle into "$HOME"/.vim/bundle/"
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  fi
fi

if [ ! -d $HOME/.vim/swapfiles ] ; then
  read -r -p "Set up swapfiles in "$HOME"/.vim/swapfiles? [y/n] " response
  response=${response,,}  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/swapfiles
  fi
fi
if [ ! -d $HOME/.vim/undodir ] ; then
  read -r -p "Set up undodir in "$HOME"/.vim/undodir? [y/n] " response
  response=${response,,}  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/undodir
  fi
fi
if [ ! -d $HOME/.vim/backupdir ] ; then
  read -r -p "Set up backupdir in "$HOME"/.vim/backupdir? [y/n] " response
  response=${response,,}  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/backupdir
  fi
fi
echo "Finished setup of dotfiles"
