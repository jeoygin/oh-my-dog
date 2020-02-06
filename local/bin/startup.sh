#!/bin/bash

ssh-add -K
gpg-agent --daemon
sed -i '/smart-mode-line-respectful/d' ~/.emacs.d/custom.el
emacs -nw --no-desktop --daemon=ws

tmux.sh new-session -s zombie -d
echo "Restoring TMUX..."
while [ "$( tmux.sh list-sessions 2>/dev/null | grep zombie | wc -l )" -eq 0 ]; do
  sleep 1
done
tmux.sh send-keys -t zombie ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh C-m
#retries=0
#while [ "$( tmux.sh list-sessions 2>/dev/null | wc -l )" -lt 2 ] && [ $retries -lt 5 ]; do
#  sleep 1
#  retries=$(( retries+1 ))
#done
#tmux.sh kill-session -t zombie
tmux.sh a
