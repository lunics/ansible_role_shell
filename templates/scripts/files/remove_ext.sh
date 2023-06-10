#!/usr/bin/env bash

# remove_ext txt                remove extensions .txt of all files from the current directory

for file in ./*.${1}; do
  mv "$file" "${file%.${1}}"
done
