#!/bin/sh

# fcoc_preview - checkout git commit with previews

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'

local commit
commit=$( glNoGraph |
  fzf --no-sort --reverse --tiebreak=index --no-multi \
      --ansi --preview="$_viewGitLogLine" ) &&
git checkout $(echo "$commit" | sed "s/ .*//")
