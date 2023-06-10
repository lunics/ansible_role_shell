#!/bin/env bash

NUM="${2:-5}"

# PULSE=false     # true to use pulseaudio

if [ "$PULSE" ]; then
	toggle() { pulsemixer --toggle-mute ;}
	mute() { pulsemixer --mute ;}
	up() { pulsemixer --change-volume +"$NUM" ;}
	down() { pulsemixer --change-volume -"$NUM" ;}
	control() { pulsemixer ;}
else
	toggle() { amixer sset Master toggle ;}
	mute() { amixer sset Master mute ;}
	up() { amixer sset Master "$NUM"%+ ;}
	down() { amixer sset Master "$NUM"%- ;}
	control() { alsamixer ;}
fi

case "$1" in
	toggle) toggle ;;
	mute) mute ;;
	up) up ;;
	down) down ;;
	control) control ;;
esac

pkill -RTMIN+10 "${STATUSBAR:?}" &

