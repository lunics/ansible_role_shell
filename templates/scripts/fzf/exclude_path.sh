#!/bin/sh

du -a \
  --exclude="$CLOUD/Applications/*" \
  --exclude="$CONFIG/google-chrome" \
  --exclude="$CONFIG/BraveSoftware" \
  --exclude="$HOME/Dropbox" \
  --exclude="$CLOUD/linux/ansible/galaxy" \
  --exclude="$HOME/.local/share" \
  --exclude="$HOME/.local/aur" \
  --exclude="$HOME/.local/lib" \
  $CLOUD \
  $SHELLRC \
  $CONFIG \
  $HOME/.local \
  $SCRIPTS | \
awk '{print $2}'
