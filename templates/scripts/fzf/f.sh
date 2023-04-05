#!/bin/bash

# if file then open it with o
# if directory then cd to it

# source: https://github.com/junegunn/fzf/wiki/examples
# source: https://github.com/junegunn/fzf/wiki/Related-projects

# IF folder then cd to
# IF .mp3 then listen to
# IF .video then listen to
# ELSE edit it with vi
# old: f () { du -a --exclude="$CLOUD/Applications/*" $CLOUD/* $SHELLRC/* | awk '{print $2}' | /usr/bin/fzf | xargs -r $EDITOR ;}

## remplacer "du -a" par ripgrep: https://github.com/BurntSushi/ripgrep

fzfile=$(
  du -a \
    --exclude="$CLOUD/Applications/*" \
    --exclude="$CONFIG/google-chrome" \
    --exclude="$CONFIG/BraveSoftware" \
    --exclude="/home/unics/Dropbox/Linux/ansible/galaxy" \
    --exclude="$HOME/.local/share" \
    --exclude="$HOME/.local/aur" \
    --exclude="$HOME/.local/lib" \
    $CLOUD \
    $SHELLRC \
    $CONFIG \
    $HOME/.local \
    $SCRIPTS | \
  awk '{print $2}' | \
  /usr/bin/fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')

[[ $fzfile == "" ]] || {
  [ -d $fzfile ] && cd $fzfile && exa -l --group-directories-first
  [ -f $fzfile ] && {
    o $fzfile
  }
}

