#!/bin/sh

case "$#" in
  0) lsmod ;;
  *) lsmod | grep -i $1 ;;
esac
