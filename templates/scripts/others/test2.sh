#!/bin/sh

if [ -d /mnt/test2 ]; then
  pass -c test2

  veracrypt \
    --text \
    --pim 2 \
    --keyfiles "" \
    --protect-hidden no \
    ~/.local/share/test2 /mnt/test2

else
  echo "/mnt/test2 doesn't exist"
fi
