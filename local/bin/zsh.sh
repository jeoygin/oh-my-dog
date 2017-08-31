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

function link_zsh() {
  test -e "$CUR_DIR"/.zprezto || ln -s "$HOME"/.zprezto "$CUR_DIR"
  for rcfile in "$CUR_DIR"/.zprezto/runcoms/z*; do
    filename=$( basename "$rcfile" )
    if [[ -e "$CUR_DIR/.$filename" ]]; then
      echo -n "$CUR_DIR/.$filename exists. Do you want to overwrite? [y/N] "
      read _overwrite
      if [[ "X$_overwrite" == "Xy" ]]; then
        ln -sf "$rcfile" "$CUR_DIR/.$filename"
      fi
    else
      ln -s "$rcfile" "$CUR_DIR/.$filename"
    fi
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
  link)
    link_zsh
    ;;
  start)
    start_zsh
    ;;
  *)
    echo "Usage: $( basename $0 ) <init|link|start>"
esac
