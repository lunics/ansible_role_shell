#!/bin/env bash

git rev-parse HEAD > /dev/null 2>&1 &&
git branch -a -vv --color=always | grep -v '/HEAD\s' |
fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
sed 's#^remotes/[^/]*/##'
