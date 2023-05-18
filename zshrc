# oh-my-zsh junk
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
starttime=$(date +%d.%m.%y-%H:%M:%S)
echo "Starting zshrc $starttime"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  #kubectl
  #archlinux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## END oh-my-zsh junk

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '/Users/danielhouston/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

setopt COMPLETE_ALIASES

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# This needs to be set before sourcing the other files
setopt auto_cd
export CDPATH=$HOME

# My Own added lines
if [ -f ~/.workrc ]; then
  . ~/.workrc
fi

if [ -f ~/.privaterc ]; then
  . ~/.privaterc
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.dots_location ]; then
  . ~/.dots_location
fi

#export LAMBDA=λ
#export SKULL=☠

# User specific aliases and functions
# Git-Prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWSTASHSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWCOLORHINTS=true

#setopt PROMPT_SUBST ; PS1='${SKULL} > '
#precmd () { __git_ps1 "%c" ":${SKULL} > " "|%s" }

# Setting this to screen-256color causes duplicate
# commands to be printed on newline (see https://github.com/ohmyzsh/ohmyzsh/issues/9282)
#
# However, this doesn't always play well with tmux.
export TERM="xterm-256color"

# PATH fun!
export PATH=$PATH:$HOME/.local/bin

# Go
export GOPATH="$HOME/go"
if [ -d $GOPATH ] ; then
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$(go env GOPATH)/bin
  export GO111MODULE=on
fi

# npm installs
export PATH=$PATH:$HOME/.npm-global/bin

# Add python executables from default python on mac
# export PATH=$PATH:/Users/dmhous/Library/Python/3.9/bin
# export PATH=$PATH:/Users/dmhous/Library/Python/3.8/bin


# Intellij Idea
#export IDEA_HOME=$HOME/Util/idea-IU-173.3727.127
#export IDEA_BIN=$IDEA_HOME/bin
#export PATH=$PATH:$IDEA_BIN

# ISTIO
# export PATH="$PATH:$HOME/Util/istio-1.1.1/bin"


# Reverse Search
bindkey '^R' history-incremental-search-backward

# https://wiki.archlinux.org/index.php/zsh#History_search
# Need to figure out what $key is
# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# [[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
# [[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# Turn off ctrl+s ctrl+q for terminal. This helps vim stuff
stty -ixon

[ -f $HOME/Util/fubectl.source  ] && source $HOME/Util/fubectl.source
[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh

volume() {
	if [ -z "$1" ]; then
		pamixer --get-volume
	else
		pamixer --set-volume $1
		pamixer --get-volume
	fi
}

getOS() {
	OS=`uname -s`
	OS=`echo $OS | awk '{print tolower($0)}'`  #toLower
	echo $OS
}

if [ "$(getOS)" = "darwin" ]; then
	ulimit -n 1024
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

if [ -d '/home/linuxbrew/.linuxbrew/bin' ] ; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

#fzf
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
#direnv
eval "$(direnv hook zsh)"

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

endtime=$(date +%d.%m.%y-%H:%M:%S)
echo "Finished zshrc $endtime"
