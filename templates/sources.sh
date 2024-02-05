#!/usr/bin/env bash

source $HOME/{{ path_shell }}/exports.sh
source $HOME/{{ path_shell }}/aliases.sh
{% if item.shell == "zsh" %}
source $HOME/{{ path_zsh  }}/zshrc
{% elif item.shell == "bash" %}
source $HOME/{{ path_bash }}/bashrc
{% endif %}

for file in $HOME/{{ path_shell }}/functions/*; do
  source $file
done
