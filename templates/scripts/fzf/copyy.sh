#!/bin/bash

# Copy le fichier mit en entrée vers la destination choisit avec fuzzy finder
cp -v "$1" "$(awk '{print $2}' $HOME/.config/bmdirs | grep -vi memes | /usr/bin/fzf | sed "s|~|$HOME|")"
