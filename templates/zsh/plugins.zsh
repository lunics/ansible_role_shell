#!/bin/zsh

## zinit load ellie/atuin    # supprimer atuin de zsh/history si c'est mieux en plugins (pas sûr)

zsh_plugin_manager="zplug"    # zplug, antidote, antigen, zgen

zplug_fct (){
  # src - https://github.com/zplug/zplug
  # zplug install           # to install new plugins

  source $ZSHRC/zplug/init.zsh

  zplug "plugins/git", from:oh-my-zsh
  zplug "plugins/kubectl", from:oh-my-zsh
  zplug "joshskidmore/zsh-fzf-history-search"
  zplug "maximux13/zsh-auto-source-file"        # autosource .zshrc ## a tester

  zplug load       # source plugins and add commands to $PATH
}
# zinit light zdharma/fast-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
# zinit light agkozak/zsh-z

antidote_fct (){ # new antibody (1.7k * GH)
  if ! [[ -e ${ZDOTDIR:-~}/.antidote ]]; then   # clone antidote if necessary
    git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
  fi

  # source antidote and load plugins from `${ZDOTDIR:-~}/.zsh_plugins.txt`
  source ${ZDOTDIR:-~}/.antidote/antidote.zsh
  antidote load
}

zgen_fct (){ # 1.4k * GH
}

antigen_fct (){   # 7.2k * GH
}

eval "$zsh_plugin_manager + _fct"
