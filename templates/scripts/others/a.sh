#!/bin/sh

homelab_path=$HOMELAB/ansible

(cd $homelab_path && \
  ansible-playbook -i inventory.yml playbooks/controller.yml --diff -t $*) && \
    { echo "shell $$ replaced by $PPID"; exec zsh -l; }
