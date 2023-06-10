#!/bin/env bash

unset TMUX
exec /usr/bin/tmux -L plain -f $HOME/.config/tmux/tmux_out.conf -u "$@"
