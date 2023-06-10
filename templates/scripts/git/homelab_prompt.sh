#!/bin/env bash

if [ $(pwd) = "$HOMELAB" ]; then
  (cd cluster && git branch | head -1 | grep -o "[a-z]*")
fi
