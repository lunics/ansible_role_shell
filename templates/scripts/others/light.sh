#!/bin/sh

sub_fct () {
  xrandr --output $(xrandr | grep " connected" | cut -f1 -d " ") --brightness $1
}

if [ $# -eq 0 ]; then
  sub_fct 1
else
  sub_fct $1
  # sub_fct $(echo $(xrandr --current --verbose | grep Brightness | cut -d " " -f 2) $1 | bc)
fi
