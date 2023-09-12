#!/usr/bin/env bash

source {{ path_shell }}/exports.sh
source {{ path_shell }}/aliases.sh
# source {{ path_shell }}/icons.sh

{% if item.shell is defined and item.shell == "zsh" %}
source ~/{{ path_zsh  }}/zshrc
{% elif item.shell is not defined or item.shell == "bash" %}
source ~/{{ path_bash }}/bashrc
{% endif %}

for file in {{ path_shell }}/functions/*; do
  source $file
done
