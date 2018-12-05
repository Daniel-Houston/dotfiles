# oh-my-zsh junk
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/dhouston/.oh-my-zsh"

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
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
  archlinux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
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
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# My Own added lines
if [ -f ~/.workrc ]; then
  . ~/.workrc
fi

if [ -f ~/.privaterc ]; then
  . ~/.privaterc
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


# PATH fun!
export PATH=$PATH:$HOME/.local/bin

# Maven
export PATH=$PATH:/usr/local/apache-maven-3.5.2/bin

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin


# Intellij Idea
#export IDEA_HOME=$HOME/Util/idea-IU-173.3727.127
#export IDEA_BIN=$IDEA_HOME/bin
#export PATH=$PATH:$IDEA_BIN

# Reverse Search
bindkey '^R' history-incremental-search-backward

# https://wiki.archlinux.org/index.php/zsh#History_search
# Need to figure out what $key is
# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# [[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
# [[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

alias ls="ls -G"
alias ll="ls -laG"
alias cd..="cd .."

# Easy way to travel up a directory
alias ..='cd ..' 
alias ...='cd ../../../' 
alias ....='cd ../../../../' 
alias .....='cd ../../../../' 
alias .4='cd ../../../../' 
alias .5='cd ../../../../..'

# tmux kill session
alias tkill='tmux kill-session -t'
alias tgo='~/.dev-tmux.sh golang'
alias tjava='~/.dev-tmux.sh java'

# Grep
alias grep='grep --color=auto'

# Safety Nets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i' 
alias cp='cp -i' 
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gp='git push'
alias gd='git diff --color'
alias gdc='git diff --cached --color'
alias gds='git diff --color staged'
alias glo='git log --pretty=oneline'
alias glp='git log -p -1'
alias gio='git checkout'
alias gnew='git checkout -b'

# Idea keyboard
alias keyfix="ibus-daemon -rd"

# Common Directories
alias dev='cd ~/Development'


gitStatusDots() {
  pushd $DOTFILES
  git status
  popd
}
gitDiffDots() {
  pushd $DOTFILES
  git diff $1
  popd
}
gitAddDots() {
  pushd $DOTFILES
  git add $@
  git status
  popd
}
gitCommitDots() {
  pushd $DOTFILES
  git commit -m "$@"
  popd
}
gitPushDots() {
  pushd $DOTFILES
  git push
  popd
}
alias sdots=gitStatusDots
alias diffdots=gitDiffDots
alias adots=gitAddDots
alias cdots=gitCommitDots
alias pdots=gitPushDots

# Clipboard
clipStdin() {
  echo $1 | xclip -sel c;
}
alias clip=clipStdin
alias fclip='xclip -sel c'

# Search for text
searchForText() {
  find . -name "*.$1" | xargs grep $2;
}
alias src-grep=searchForText

# Turn off ctrl+s ctrl+q for terminal. This helps vim stuff
stty -ixon

# Clean up dep's cache
alias cdep="pushd ~/go/pkg/dep/sources"

# Changing behavior of cd
function cd
{
    # This will pass all the arguments on the
    # command line (the "$@") to the 'cd' builtin,
    # and then execute an 'ls' on the current directory
    builtin cd "$@" && ls
}

# Vault
export VAULT_ADDR="https://vault.dev.srdev.io"

[ -f ~/Development/fubectl.source  ] && source ~/Development/fubectl.source

volume() {
	if [ -z "$1" ]; then
		pamixer --get-volume
	else
		pamixer --set-volume $1
		pamixer --get-volume
	fi
}
