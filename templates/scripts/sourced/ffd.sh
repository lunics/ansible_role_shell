#!/bin/env bash

# cd into the directory of the selected file

ffd (){
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"; l
}
