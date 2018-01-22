#!/bin/sh
tmux new-session -d -s 'dev' -n 'terminal'
tmux new-window -t 'dev':1 -n 'psql'
tmux send-keys -t dev:1 'psqld smilereminder srpostgres' C-m
tmux new-window -t 'dev':2 -n 'smilereminder'
tmux send-keys -t dev:2 'sm3' C-m
tmux new-window -t 'dev':3 -n 'vim'
tmux send-keys -t dev:3 'sm3; vim' C-m
tmux new-window -t dev:4 -n 'docker-dev'
tmux send-keys -t dev:4 'cd ~/docker-dev' C-m
tmux attach-session -t dev
