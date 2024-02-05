#!/usr/bin/env bash

source $HOME/{{ path_shell }}/exports.sh
source $HOME/{{ path_shell }}/aliases.sh
{# % if item.shell is defined and (item.shell == "zsh" or item.shell.type == "zsh") %#}
{% if item.shell is defined %}
{%   if item.shell.type == "zsh" %}
source $HOME/{{ path_zsh  }}/zshrc
{#% elif item.shell is not defined or item.shell == "bash" or item.shell.type == "zsh" %#}
{%   elif item.shell.type == "bash" %}
source $HOME/{{ path_bash }}/bashrc
{%   endif %}
{% endif %}

for file in $HOME/{{ path_shell }}/functions/*; do
  source $file
done
