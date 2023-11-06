_fzf_change_dirstack (){
  local dir
  print -rNC1 -- $dirstack |
    fzf --read0 --print0 |
    IFS= read -rd '' dir &&
    cd -- $dir &&
    zle -I
}
