#!/bin/sh

if [ $# -eq 0 ]; then
  /usr/bin/sshs
else
  /usr/bin/ssh $*
fi
