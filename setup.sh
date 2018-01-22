#/usr/bin/sh
CWD=$(pwd)

# Create symlinks
ln -is $CWD/dev-tmux.sh ~/.dev-tmux.sh
ln -is $CWD/bashrc ~/.bashrc
ln -is $CWD/vimrc ~/.vimrc
ln -is $CWD/workrc ~/.workrc
ln -is $CWD/git-prompt.sh ~/.git-prompt.sh
ln -is $CWD/sleeplock.sh ~/.sleeplock.sh
ln -is $CWD/tmux.conf ~/.tmux.conf

if [ -d ~/.config/i3  ] ; then
  ln -is $CWD/i3config ~/.config/i3/config 
fi


# Set up vundle
if [ -d ~/.vim/bundle ] && [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Finished setup of dotfiles"
