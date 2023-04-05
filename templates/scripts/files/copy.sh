#!/usr/bin/env bash

rsync \
  -r \
  -l \
  -p \
  -t \
  -g \
  -o \
  -D \
  -v \
  -z \
  -h \
  --progress \
  $1 $2

  ## ajouter un slash à la source $1/ ?
