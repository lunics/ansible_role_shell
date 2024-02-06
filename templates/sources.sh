#!/usr/bin/env bash

source {{ path_shell }}/exports.sh
source {{ path_shell }}/aliases.sh
{% if item.shell == "zsh" %}
source {{ path_zsh  }}/zshrc
{% elif item.shell == "bash" %}
source {{ path_bash }}/bashrc
{% endif %}

for file in {{ path_shell }}/functions/*; do
  source $file
done
