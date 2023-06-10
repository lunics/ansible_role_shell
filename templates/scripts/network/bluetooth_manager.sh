#!/usr/bin/env bash

choice1=$( \
  bluetoothctl devices | fzf \
  --preview 'bluetoothctl info {2} | head -$FZF_PREVIEW_LINES' \
  --preview-window right,65%,noborder \
  --no-scrollbar \
  --bind='enter:execute(echo {2})+abort'
); \
[ -n "$choice1" ] || exit 0

choice2=$( \
  echo -e "connect\ndisconnect\npair\nunpair\ntrust\nuntrust" | fzf \
  --preview "bluetoothctl info $choice1 | head -$FZF_PREVIEW_LINES" \
  --preview-window right,65%,noborder \
  --no-scrollbar \
  --bind='enter:execute(echo {1})+abort'
); \
[ -n "$choice2" ] && [ -n "$choice1" ] && bluetoothctl $choice2 $choice1
