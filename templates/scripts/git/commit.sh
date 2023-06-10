#!/bin/env bash

git fetch && {
  git add .
  git commit -m "$*"
  git push
}
