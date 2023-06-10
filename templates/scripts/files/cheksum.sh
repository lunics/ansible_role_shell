#!/usr/bin/env bash
    choice1=$(bluetoothctl devices | fzf \
    --preview 'bluetoothctl info {2} | head -$FZF_PREVIEW_LINES' \
    --preview-window right,65%,noborder \
    --no-scrollbar \
    --bind='enter:execute(echo {2})+abort'
    ); \
    [ -n "$choice1" ] || exit 0
    choice2=$(echo -e "connect\ndisconnect\npair\nunpair\ntrust\nuntrust" | fzf \
    --preview "bluetoothctl info $choice1 | head -$FZF_PREVIEW_LINES" \
    --preview-window right,65%,noborder \
    --no-scrollbar \
    --bind='enter:execute(echo {1})+abort'
    ); \
    [ -n "$choice2" ] && [ -n "$choice1" ] && bluetoothctl $choice2 $choice1
    '';
    # bl = ''
    # bluetoothctl devices | fzf \
    # --preview 'bluetoothctl info {2} | head -$FZF_PREVIEW_LINES' \
    # --preview-window right,65%,noborder \
    # --no-scrollbar \
    # --header-first \
    # --header='C-p pair  C-c connect  C-t trust' \
    # --bind='ctrl-p:preview:bluetoothctl info {2} | grep "Paired: yes" -q && bluetoothctl remove {2} || bluetoothctl pair {2}' \
    # --bind='ctrl-c:preview:bluetoothctl info {2} | grep "Connected: yes" -q && bluetoothctl disconnect {2} || bluetoothctl connect {2}' \
    # --bind='ctrl-t:preview:bluetoothctl info {2} | grep "Trusted: yes" -q && bluetoothctl untrust {2} || bluetoothctl trust {2}'
    # ''
bluetoothctl devices \
    | fzf \
    --preview 'bluetoothctl info {2} | head -$FZF_PREVIEW_LINES' \
    --preview-window right,65%,noborder \
    --no-scrollbar \
    --header='C-p pair C-c connect C-t trust C-r remove' \
    --bind='ctrl-p:preview:bluetoothctl pair {2}' \
    --bind='ctrl-r:preview:bluetoothctl remove {2}' \
    --bind='ctrl-c:preview:bluetoothctl connect {2}' \
    --bind='ctrl-t:preview:bluetoothctl trust {2}'

if [ "$1" = "md5" ]; then
  md5sum $2
elif [ "$1" = "sha256" ]; then
