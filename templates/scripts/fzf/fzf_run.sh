#!/bin/sh

du -a --exclude=$CLOUD/Application/* $HOME/.config/* $HOME/Dropbox/* \
  | awk '{print $2}' \
  | /usr/bin/fzf \
  | xargs -r sh
