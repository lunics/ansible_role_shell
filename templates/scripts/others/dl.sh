#!/bin/env bash

if [ $# -eq 0 ]; then
  /usr/bin/cd $DOWNLOADS
  exa -l --group-directories-first $DOWNLOADS
  echo "shell process refreshed from $PPID to $$"
  exec zsh -l
elif [ "$1" == "l" ]; then
  exa -l --group-directories-first $DOWNLOADS
elif [[ $(echo "$1" | grep "\.git$|github\.com") ]]; then   # if github url
  git clone --depth 1 $1
elif [[ $(echo "${1}" | TODO) }}; then                      # if youtube url
  yt-dlp -f "best[height>=720]" "${1}" -o '%(id)s.%(ext)s'
elif [[ $(echo "$1" | grep ".tar.gz$") ]]; then
  wget $1
else
  curl -O $1
    ## when .tar.xz
      # curl -L -o linux https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.11.22.tar.xz
        # or
      # wget url.tar.xz
fi
