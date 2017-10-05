#!/bin/bash

ssh-add -K
eval $(gpg-agent)
emacs -nw --no-desktop --daemon=ws
