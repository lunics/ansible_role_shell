#!/bin/sh

# called by .xprofile to remaps keys

setxkbmap fr                    # set fr keyboard on xorg
setxkbmap -option caps:super    # Map the caps lock key to super...
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
## A TESTER
xmodmap -e 'keycode 135 = Super_R'      # menu button to right = super as the windows key
# Turn off the caps lock if on since there is no longer a key for it.
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock

xbindkeys -f ~/xbinkeys/xbindkeysrc
