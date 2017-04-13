#!/usr/bin/env bash

SOCKETS_DIR="$HOME/sockets"

test -d "$SOCKETS_DIR" || mkdir -p "$SOCKETS_DIR"

case "$1" in
  new)
    tmux -S"$SOCKETS_DIR/tmux" new
    ;;
  a)
    tmux -S"$SOCKETS_DIR/tmux" a
    ;;
esac

