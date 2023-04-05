#!/usr/bin/env bash

c (){
  /usr/bin/cd $1 && exa -l --group-directories-first
}
