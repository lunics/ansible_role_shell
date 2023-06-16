#!/bin/zsh

# src
#   https://github.com/ohmyzsh/ohmyzsh
#   https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

plugins=(
  kubectl   # available in bash as well
  git
  # sudo    # KO - complètement buggé (needs 2 esc to insert sudo)
)
#   helm
#   zsh-interactive-cd
#   command-not-found
#   web-search
#     # ddg ma recherch ou google ma recher
#   taskwarrior
#   history
#     # h = history, hs = history | grep , hsi = hs case-insensitive
#   extract
#   emoji
#   emoji-clock
#   # battery
#   # autojump      aur/autojump
#   # colorize      aur/go-chroma
#   # zsh-navigation-tools
#   # terraform
# )

source $ZSH/oh-my-zsh.sh      # enable om-my-zsh, must be after plugins()
