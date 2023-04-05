#!/bin/sh

## A tester
vcopy "$(du -a $HOME/Downloads/* $HOME/.config/* | awk '{print $2}' | /usr/bin/fzf)"
