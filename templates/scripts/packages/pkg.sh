#!/bin/env bash

if [[ "$1" = "-Ss" ]] || [[ "$1" = "search" ]]; then
  $AUR_HELPER -Ss "${@:2}"
elif [[ "$1" = "info" ]]; then
  $AUR_HELPER -Si "${@:2}"
elif [[ "$1" =~ ^(remove|delete|uninstall)$ ]]; then
  sudo pacman -R "${@:2}"
elif [[ "$1" =~ ^(update)$ ]]; then
  sudo pacman -Syu "${@:2}"
elif [[ "$1" =~ ^(upgrade)$ ]]; then
  sudo pacman -Syu --noconfirm
elif [[ "$1" =~ ^(install|add)$ ]]; then
  sudo su - aur -c "$AUR_HELPER -Sy ${*:2}" && { echo "shell $$ replaced by $PPID"; exec zsh -l; }
  # if [[ $(pacman -Ss "${@:2}" > /dev/null) ]]; then
  #   echo "${@:2}"
  #   sudo pacman -Sy "${@:2}" && { echo "shell $$ replaced by $PPID"; exec zsh -l; }
  # else
  #   sudo su - aur -c "$AUR_HELPER -Sy ${@:2}" && { echo "shell $$ replaced by $PPID"; exec zsh -l; }
  # fi
fi
