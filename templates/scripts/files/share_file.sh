#!/usr/bin/env bash

if [ -f $1 ]; then
  cat $1 | curl -F 'f:1=<-' ix.io | xclip -selection c
elif
  echo "$*" | curl -F 'f:1=<-' ix.io | xclip -selection c
fi
