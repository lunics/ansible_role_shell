#!/bin/sh

git fetch && {
  git add .
  git commit -m "$*"
  git push
}
