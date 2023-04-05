#!/bin/bash

## A combiner avec ff

local files
IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))

extension=$(echo "${files[@]}" | rev | cut -d "." -f 1 | rev)

case $extension in
  txt)    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"     ;;
  sh)     [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"     ;;
  pdf)    [[ -n "$files" ]] && zathura "${files[@]}"            ;;
  png)    [[ -n "$files" ]] && firefox "${files[@]}"            ;;
  mkv)    [[ -n "$files" ]] && mpv "${files[@]}"                ;;
  webm)   [[ -n "$files" ]] && mpv "${files[@]}"                ;;
esac
