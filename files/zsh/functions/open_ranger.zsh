_open_ranger() {
  if [[ $#BUFFER == 0 ]]; then
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=$(cat $HOME/.rangerdir)
    cd "$LASTDIR"
    zle reset-prompt
  else
    zle expand-or-complete
  fi
}
