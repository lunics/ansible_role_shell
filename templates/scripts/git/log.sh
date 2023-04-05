#!/bin/sh

list_repo=$(find . -maxdepth 2 -name .git)

    # --pretty=tformat:'  %C(magenta)%h%Creset ['$repo_name'] %s %C(yellow)%D %C(green)%cr%Creset' \
for repo_path in $list_repo; do
  repo_name=$(basename $(dirname ${repo_path}))
  repo_absolute_path=$(readlink -f ${repo_path})

  ## voir ce que ça donne
  # ––pretty=format:'%Cred%h%Creset -%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'

  git -C $repo_absolute_path log \
    --pretty=tformat:'  %C(magenta)%h%Creset ['$repo_name'] %s %C(green)%cr%Creset' \
    --abbrev-commit \
    --reverse -n 20 \
    --all
done
