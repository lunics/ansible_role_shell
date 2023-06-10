#!/bin/env bash

if [[ $(tldr $1 &> /dev/null) ]]; then
  tldr $1
else
  echo tldr is updating...
  tldr --update
  tldr $1
fi
