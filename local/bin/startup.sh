#!/bin/bash

ssh-add -K
gpg-agent --daemon
emacs -nw --no-desktop --daemon=ws
