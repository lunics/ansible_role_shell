## run: showkey -a to get the right code
bindkey -v                              # -v = enable vim mode; -e = disable vim mode
bindkey "^[[1;5D" backward-word         # enable ctrl left arrow
bindkey "^[[1;5C" forward-word          # enable ctrl right arrow
# bindkey "^H" backward-kill-word         # ctrl backspace = delete word before
bindkey "^[^?" backward-kill-word       # alt backspace = delete word before
# bindkey "^[[M" kill-word              # ctrl suppr   = delete word after    ## KO, passe en VI mode
bindkey -s '^o' 'lfcd\n'                # ctrl o = file explorer with lf
bindkey -s '^w' 'exit\n'
## ctrl f  = broot                             # find dir or file

#old bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^f' 'fd\n'                  # ctrl f = fd + ranger

bindkey '^[[P'  delete-char             ## a tester
bindkey -v '^?' backward-delete-char    ## a tester

## a remplacer par fzf
# enable vim navigation dans la liste des arguments possible de l'autocompletion
# dépend de zmodload zsh/complist
bindkey -M menuselect "^h" backward-char
bindkey -M menuselect "^k" up-line-or-history
bindkey -M menuselect "^l" forward-char
bindkey -M menuselect "^j" down-line-or-history
#                     "^I" complete-word
#                     "^J" accept-line
#                     "^M" accept-line
#                     "^[[A" up-line-or-history
#                     "^[[B" down-line-or-history
#                     "^[[C" forward-char
#                     "^[[D" backward-char

# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line          # ctrl e = edit current command line in vim

# Execute the current suggestion (using zsh-autosuggestions)
# Alt+Enter = '^[^M' on recent VTE and '^[^J' for older (Lxterminal)
# bindkey '^[^M' autosuggest-execute
# bindkey '^[^J' autosuggest-execute

stty stop undef		                      # disable ctrl-s to avoid freeze terminal

fzf-change-dirstack () {
  local dir
  print -rNC1 -- $dirstack |
    fzf --read0 --print0 |
    IFS= read -rd '' dir &&
    cd -- $dir &&
    zle -I
}
zle -N fzf-change-dirstack
bindkey '^[d' fzf-change-dirstack         # ALT+P = fzf + dirs -v
bindkey '^[f' fd                          # alt f = fd
