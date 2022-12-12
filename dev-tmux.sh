#/bin/env bash

# java stuff
tmux new-session -d -s 'java' -n 'local'
tmux send-keys -t java:0 'cd $HOME/a2z/atms/atms/transmem' Enter
#tmux split-window -v -p 20
tmux new-window -t java:1 -n 'devsync'
tmux send-keys -t java:1 'cd $HOME/a2z/atms' Enter
tmux send-keys -t java:1 'devsync' Enter

tmux new-window -t java:1 -n 'caf'
tmux send-keys -t java:1 'caf 8' Enter

# Golang Stuff
#tmux new-session -d -s 'golang' -n 'terminal'
#tmux new-window -t golang:1 -n 'vim'
#tmux send-keys -t golang:vim.0 'gospc;vim' Enter
#tmux split-window -v -p 25
#tmux send-keys -t golang:vim.1 'gospc' Enter

#if [ ! $# -eq 0 ]; then
#	tmux attach-session -t $1	
#else
tmux attach-session -t java
#fi
