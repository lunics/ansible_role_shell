#!/bin/sh

current_brightness=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')

screen_id=$(xrandr --current | grep "connected primary" | cut -d " " -f 1)

# concatenate $current_value with $1 like 0.5 +0.1 or O.5 -0.1
new_brightness=$(echo "$current_brightness $1" | bc)

xrandr --output $screen_id --brightness "$new_brightness"

