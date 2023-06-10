#!/bin/env bash

## if cat <url.com> then
##   curl -s https://<url> | /usr/bin/bat
## autoindentation ne fonctionne pas pour les noms de commandes

which_1=$(which $1)

do_which (){
  [[ ! $(echo $which_1 | grep built-in) ]] && echo "shell function\n"
  which $1
  type -a $1      # give all locations of the command
}

catt () {
  if [ -f $1 ]; then                  # IF $1 is a file THEN
    /usr/bin/bat $1
  else
    if [[ $(alias $1) ]]; then
      echo "alias $(alias $1)"
    elif [[ -f $which_1 ]]; then      # IF $1 is a valid path THEN
      if [ $(dirname $which_1 | grep $HOME) ]; then  # IF path is in $HOME THEN
        /usr/bin/bat $which_1
      else
        do_which
      fi
    else
      do_which
    fi
  fi
}
