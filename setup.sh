#!/usr/bin/env sh

# backticks are the platform-agnostic way to run commands
CWD=`pwd`

# Create symlinks
ln -is $CWD/dev-tmux.sh $HOME/.dev-tmux.sh
ln -is $CWD/bashrc $HOME/.bashrc
ln -is $CWD/aliases $HOME/.aliases
ln -is $CWD/zshrc $HOME/.zshrc
ln -is $CWD/vimrc $HOME/.vimrc
ln -is $CWD/xinitrc $HOME/.xinitrc
ln -is $CWD/git-prompt.sh $HOME/.git-prompt.sh
ln -is $CWD/sleeplock.sh $HOME/.sleeplock.sh
ln -is $CWD/tmux.conf $HOME/.tmux.conf
ln -is $CWD/fehbg $HOME/.fehgb
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
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    echo "Cloning Vundle into "$HOME"/.vim/bundle/"
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  fi
fi

if [ ! -d $HOME/.vim/swapfiles ] ; then
  read -r -p "Set up swapfiles in "$HOME"/.vim/swapfiles? [y/n] " response
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/swapfiles
  fi
fi
if [ ! -d $HOME/.vim/undodir ] ; then
  read -r -p "Set up undodir in "$HOME"/.vim/undodir? [y/n] " response
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/undodir
  fi
fi
if [ ! -d $HOME/.vim/backupdir ] ; then
  read -r -p "Set up backupdir in "$HOME"/.vim/backupdir? [y/n] " response
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    mkdir -p $HOME/.vim/backupdir
  fi
fi

if [ ! -e $HOME/.oh-my-zsh/oh-my-zsh.sh ] ; then
  read -r -p "Install oh-my-zsh? [y/n] " response
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
	  # For some reason this only works if I use $(), not sure why
	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi
fi

OS=`uname -s`
OS=`echo $OS | awk '{print tolower($0)}'`  #toLower
if [ -z `command -v go` ]; then
  read -r -p "Install golang and tools? [y/n] " response
  response=`echo $response | awk '{print tolower($0)}'`  #toLower
  if [[ "$response" =~ ^(yes|y)$ ]] ; then
    read -r -p "What version of go? (maj.min.patch) [y/n] " GOVERSION
    curl -fsSL "https://dl.google.com/go/go$GOVERSION.$OS-amd64.tar.gz" | sudo tar -C /usr/local -xz
  fi
else
	echo "Go is installed"
fi

if [ "$OS" == "darwin" ]; then
  if [ -z `command -v brew` ]; then
    read -r -p "Install homebrew? [y/n] " response
    response=`echo $response | awk '{print tolower($0)}'`  #toLower
    if [[ "$response" =~ ^(yes|y)$ ]] ; then
      /usr/bin/ruby -e `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)`
    fi
  else 
	  echo "Homebrew is installed"
  fi

  if [ -z `command -v ag` ]; then
    read -r -p "Install ag (the_silver_searcher) (requires homebrew)? [y/n] " response
    response=`echo $response | awk '{print tolower($0)}'`  #toLower
    if [[ "$response" =~ ^(yes|y)$ ]] ; then
  	  brew install the_silver_searcher
    fi
  else 
	  echo "ag is installed"
  fi

  # focus follows mouse. See https://stackoverflow.com/questions/98310/focus-follows-mouse-plus-auto-raise-on-mac-os-x
  defaults write com.apple.x11 wm_ffm -bool true



fi

echo "Finished setup"
