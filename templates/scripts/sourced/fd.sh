#!/usr/bin/env bash

fd () {
  local dir=
  dir=$(/usr/bin/find ~/ -path '*/\.*' -prune -o \( -type d -o -type l \) -print 2> /dev/null | fzf +m) && \
  ranger ${dir}
  # c $dir
}
