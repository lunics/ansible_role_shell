#!/bin/sh

unset TMUX
# exec /usr/bin/env tmux -f $HOME/.config/tmux/tmux.conf -u "$@"
exec /usr/bin/tmux -f $HOME/.config/tmux/tmux.conf -u "$@"

