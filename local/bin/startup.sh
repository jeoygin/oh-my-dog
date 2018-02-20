#!/bin/bash

ssh-add -K
gpg-agent --daemon
emacs -nw --no-desktop --daemon=ws

tmux.sh new-session -s zombie -d
sleep 3
tmux.sh send-keys -t zombie ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh C-m
sleep 5
tmux.sh kill-session -t zombie
tmux.sh a
