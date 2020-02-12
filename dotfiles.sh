#!/bin/bash

cp ../.bash_profile dotfiles/.bash_profile
cp ../.git-prompt.sh dotfiles/.git-prompt.sh
cp ../.vimrc dotfiles/.vimrc
cp ../.tmux.conf dotfiles/.tmux.conf
git add .
git commit -m "Update dotfiles"
git push
