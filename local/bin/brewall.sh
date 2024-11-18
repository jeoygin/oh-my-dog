#!/usr/bin/env bash

# GNU command line tools
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew install coreutils
brew install binutils
brew install diffutils
brew install gawk

# Tmux
brew install tmux

# Emacs dev
brew install emacs --with-cocoa --with-imagemagick@6 --with-gnutls --with-dbus --HEAD

# A code-searching tool similar to ack, but faster.
# https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher

# A simple, fast and user-friendly alternative to find.
# https://github.com/sharkdp/fd
brew install fd

# Send User Notifications on macOS from the command-line.
# https://github.com/julienXX/terminal-notifier
brew install terminal-notifier

# Record and share your terminal sessions, the right way
# https://asciinema.org/
brew install asciinema

# https://www.tug.org/mactex/
brew cask install mactex

# https://github.com/zplug/zplug
brew install zplug

# A cd command that learns - easily navigate directories from the command line
# https://github.com/wting/autojump
brew install autojump

# fzy is a fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm.
# https://github.com/jhawthorn/fzy
brew install fzy

# fzf is a general-purpose command-line fuzzy finder.
# https://github.com/junegunn/fzf
brew install fzf

# Command-line productivity booster, offers quick access to files and directories
# https://github.com/clvv/fasd
brew install fasd
eval "$(fasd --init auto)"

# Convert terminal recordings to animated gifs
# https://github.com/icholy/ttygif
brew install ttygif

# Simplified and community-driven man pages
# http://tldr-pages.github.io/
brew install tldr

# Magnificent app which corrects your previous console command
# https://github.com/nvbn/thefuck
brew install thefuck

# NeoMutt is a command line mail reader (or MUA). It's a fork of Mutt with added features.
# https://github.com/neomutt/neomutt
brew install neomutt/homebrew-neomutt/neomutt

# Extracts URLs from text
brew install urlview

# PathPicker accepts a wide range of input -- output from git commands, grep results, searches
# https://github.com/facebook/PathPicker
brew install fpp

# OS X menubar status indicator
# https://github.com/tonsky/AnyBar
brew cask install anybar

brew install calcurse

# Namazu: a Full-Text Search Engine
# http://www.namazu.org/
brew install namazu

# mairix is a program for indexing and searching email messages stored in Maildir, MH or mbox folders
# https://github.com/rc0/mairix
brew install mairix

# Python version management
brew install pyenv

# 7-Zip is a file archiver with a high compression ratio
brew install 7-zip

# GNU Emacs text editor
brew install emacs

# Alternative to top/htop
# https://nicolargo.github.io/glances/
brew install glances

# Official Amazon AWS command-line interface
# https://aws.amazon.com/cli/
brew install awscli

# Swiss-army knife of markup format conversion
# https://pandoc.org/
brew install pandoc
