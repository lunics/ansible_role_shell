#!/bin/zsh

if [ -x "$(command -v "atuin")" ]; then
  eval "$(atuin init zsh)"          # atuin history, override entire zsh history
else
  size_hist=10000000                # = 10M lines

  HISTSIZE=$size_hist
  SAVEHIST=$size_hist

  HISTFILE=~/.cache/zsh/history

  setopt SHARE_HISTORY              # share history between all sessions
  setopt EXTENDED_HISTORY           # write history file in ":start:elapsed;command" format = index + duration + command
  setopt INC_APPEND_HISTORY         # save every command before it is executed
  setopt BANG_HIST                  # treat the '!' character specially during expansion
  setopt HIST_EXPIRE_DUPS_FIRST     # expire duplicate entries first when trimming history
  setopt HIST_IGNORE_DUPS           # don't record an entry that was just recorded again
  setopt HIST_IGNORE_ALL_DUPS       # delete old recorded entry if new entry is a duplicate
  setopt HIST_FIND_NO_DUPS          # do not display a line previously found
  setopt HIST_IGNORE_SPACE          # don't record an entry starting with a space
  setopt HIST_SAVE_NO_DUPS          # don't write duplicate entries in the history file
  setopt HIST_REDUCE_BLANKS         # remove superfluous blanks before recording entry
  setopt HIST_VERIFY                # don't execute immediately upon history expansion
  setopt HIST_BEEP                  # beep when accessing nonexistent history
fi
