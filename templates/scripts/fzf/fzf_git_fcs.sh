#!/bin/sh

# fcs - get git commit sha
# example usage: git rebase -i `fcs`

local commits commit
commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
echo -n $(echo "$commit" | sed "s/ .*//")
