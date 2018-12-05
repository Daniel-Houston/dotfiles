#/bin/env bash

# java stuff
#tmux new-session -d -s 'java' -n 'terminal'
#tmux new-window -t java:1 -n 'psql'
#tmux send-keys -t java:1 'psqld smilereminder srpostgres' Enter
#tmux split-window -v -p 20
#tmux new-window -t java:2 -n 'sm3'
#tmux send-keys -t java:2 'sm3;vim' Enter
#tmux split-window -v -p 20
#tmux send-keys -t java:sm3.1 'sm3' Enter
#tmux new-window -t java:3 -n 'docker-dev'
#tmux send-keys -t java:3 'cd ~/docker-dev' Enter

# Golang Stuff
tmux new-session -d -s 'golang' -n 'terminal'
tmux new-window -t golang:1 -n 'vim'
tmux send-keys -t golang:vim.0 'gospc;vim' Enter
tmux split-window -v -p 25
tmux send-keys -t golang:vim.1 'gospc' Enter

#if [ ! $# -eq 0 ]; then
#	tmux attach-session -t $1	
#else
tmux attach-session -t golang
#fi
