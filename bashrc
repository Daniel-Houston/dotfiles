# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.workrc ]; then
  . ~/.workrc
fi

if [ -f ~/.privaterc ]; then
  . ~/.privaterc
fi

if [ -f ~/.dots_location ]; then
  . ~/.dots_location
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Git-Prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1="\u@\h \W\$(__git_ps1 \" (%s)\") \$ "

# Maven
export PATH=$PATH:/usr/local/apache-maven-3.5.2/bin

# Go
#export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
# I have been told it is a bad idea to change your GOPATH
# export GOPATH=/home/dhouston/Development/go

# Intellij Idea
export IDEA_HOME=$HOME/Util/idea-IU-173.3727.127
export IDEA_BIN=$IDEA_HOME/bin
export PATH=$PATH:$IDEA_BIN

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
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gp='git push'
alias gd='git diff --color'
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

# Tell bash to use vi editing mode
set -o vi
