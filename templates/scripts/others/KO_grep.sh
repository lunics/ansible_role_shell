#!/bin/sh

# alias grep = rg ne fonctionne pas
#   ex: battery = cat /dev/bat (as alias) -> grep battery /path/ = grep cat /path/

rg "$1" $2
