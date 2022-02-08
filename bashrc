# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
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
export LAMBDA=λ
export SKULL=☠

# User specific aliases and functions
# Git-Prompt
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
# export PS1="\u@\h \W\$(__git_ps1 \" (%s)\") \$ "
# export PS1="\W\$(__git_ps1 \" (%s)\") ${SKULL} > "
export PS1="\W > "

# PATH fun!
export PATH=$PATH:$HOME/.local/bin

# Maven
export PATH=$PATH:/usr/local/apache-maven-3.5.2/bin

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin


# Intellij Idea
export IDEA_HOME=$HOME/Util/idea-IU-173.3727.127
export IDEA_BIN=$IDEA_HOME/bin
export PATH=$PATH:$IDEA_BIN

# Istio
# export PATH="$PATH:$HOME/Util/istio-1.1.1/bin"

export PAGER=cat

# Turn off ctrl+s ctrl+q for terminal. This helps vim stuff
stty -ixon

[ -f ~/Development/fubectl.source  ] && source ~/Development/fubectl.source

volume() {
	if [ -z "$1" ]; then
		pamixer --get-volume
	else
		pamixer --set-volume $1
		pamixer --get-volume
	fi
}

export PATH=$PATH:/Users/dmhous/.toolbox/bin
