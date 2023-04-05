#!/bin/sh

# fbr - checkout git branch

local branches branch
branches=$(git --no-pager branch -vv) &&
branch=$(echo "$branches" | fzf +m) &&
git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
