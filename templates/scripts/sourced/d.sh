#!/bin/env bash
# to cd the selected directory

d (){
  local dir=
  #dir=$(find ${1:-.} -path '*/\.*' -prune -o \( -type d -o -type l \) -print 2> /dev/null | fzf +m) &&
  dir=$(/usr/bin/find ~/ -path '*/\.*' -prune -o \( -type d -o -type l \) -print 2> /dev/null | fzf +m) && \
    c $dir
}
