#!/bin/zsh

# must be before source $ZSH/oh-my-zsh.sh
# ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"   # Case-sensitive completion must be off. _ and - will be interchangeable
# DISABLE_AUTO_TITLE="true"   # auto-setting terminal title
# ENABLE_CORRECTION="true"    # command auto-correction
WORDCHARS='*?_[]~=&;!#$%^(){}<>'      # to define words separation for the cursor

#old: export KEYTIMEOUT=0.1
## tester sans l'export
KEYTIMEOUT=0.1                    # time to activate vim mode and others mode
ZPLUG_HOME=$ZSHRC/zplug           # zplug home dir
ZSH_FZF_HISTORY_SEARCH_BIND="^r"  # set keybinding for zsh-fzf-history-search plugin
