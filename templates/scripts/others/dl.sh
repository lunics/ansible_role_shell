#!/bin/sh

if [ $# -eq 0 ]; then
  cd $DOWNLOADS
  exa -l --group-directories-first $DOWNLOADS
  echo "shell process refreshed from $PPID to $$"
  exec zsh -l
elif [ "$1" == "l" ]; then
  exa -l --group-directories-first $DOWNLOADS
elif [[ $(echo "$1" | grep "\.git$|github\.com") ]]; then
  git clone --depth 1 $1
elif [[ $(echo "$1" | grep ".tar.gz$") ]]; then
  wget $1
else
  curl -O $1
    ## when .tar.xz
      # curl -L -o linux https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.11.22.tar.xz
        # or
      # wget url.tar.xz
fi
