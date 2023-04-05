#!/bin/sh

termdown --no-figlet --time-format "%H:%M:%S" -a $* && cvlc ~/.local/share/sound_bell/mixkit-phone-ring-bell-593.wav vlc://quit 2> /dev/null
