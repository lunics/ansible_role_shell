#!/bin/zsh

if [ -x "$(command -v "starship")" ]; then
  eval "$(starship init zsh)"
else
  PS1="
%B%{$fg[magenta]%}╭ %~
╰%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$reset_color%}%b    "
#old ╰%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[red]%}]%{$reset_color%}->%b "
fi
