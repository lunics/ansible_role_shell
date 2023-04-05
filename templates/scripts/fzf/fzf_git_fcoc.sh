#!/bin/sh

# fcoc - checkout git commit

local commits commit
commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
commit=$(echo "$commits" | fzf --tac +s +m -e) &&
git checkout $(echo "$commit" | sed "s/ .*//")
