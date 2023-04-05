#!/bin/sh

if [ $# -eq 2 ]; then
  echo "ln -s <link> <dest>"
else
  ls -s $2 $1
fi
