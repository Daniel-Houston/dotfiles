#/usr/bin/sh
CWD=$(pwd)

# Create symlinks
ln -is $CWD/dev-tmux.sh $HOME/.dev-tmux.sh
ln -is $CWD/bashrc $HOME/.bashrc
ln -is $CWD/vimrc $HOME/.vimrc
ln -is $CWD/git-prompt.sh $HOME/.git-prompt.sh
ln -is $CWD/sleeplock.sh $HOME/.sleeplock.sh
ln -is $CWD/tmux.conf $HOME/.tmux.conf

if [ -d $HOME/.config/i3  ] ; then
  ln -is $CWD/i3config $HOME/.config/i3/config 
fi

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

read -r -p "Set up swapfiles in "$HOME"/.vim/swapfiles? [y/n]" response
response=${response,,}  #toLower
if [[ "$response" =~ ^(yes|y)$ ]] ; then
  mkdir -p $HOME/.vim/swapfiles
fi
read -r -p "Set up undodir in "$HOME"/.vim/undodir? [y/n]" response
response=${response,,}  #toLower
if [[ "$response" =~ ^(yes|y)$ ]] ; then
  mkdir -p $HOME/.vim/undodir
fi
read -r -p "Set up swapfiles in "$HOME"/.vim/backupdir? [y/n]" response
response=${response,,}  #toLower
if [[ "$response" =~ ^(yes|y)$ ]] ; then
  mkdir -p $HOME/.vim/backupdir
fi
echo "Finished setup of dotfiles"
