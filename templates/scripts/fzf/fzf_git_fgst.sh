#!/bin/sh

# fgst - pick files from `git status -s`

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# "Nothing to see here, move along"
is_in_git_repo || return

local cmd="${FZF_CTRL_T_COMMAND:-"command git status -s"}"

eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
  echo "$item" | awk '{print $2}'
done
echo