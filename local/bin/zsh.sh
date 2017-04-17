#!/bin/bash

CUR_DIR=$(pwd)
SCRIPT_DIR=$( cd "`dirname "$0"`"; pwd )

function init_zsh() {
  test -e "$CUR_DIR"/.zprezto || ln -s "$HOME"/.zprezto "$CUR_DIR"
  for rcfile in "$CUR_DIR"/.zprezto/runcoms/z*; do
    filename=$( basename "$rcfile" )
    test -e "$CUR_DIR/.$filename" || cp "$rcfile" "$CUR_DIR/.$filename"
  done
}

function start_zsh() {
  export HOME="$CUR_DIR"
  export PATH="$HOME/local/bin:$HOME/bin:$PATH"
  zsh
}

case "$1" in
  init)
    init_zsh
    ;;
  start)
    start_zsh
    ;;
esac
