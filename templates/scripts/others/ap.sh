#!/bin/env bash

( cd $HOMELAB/clusters/lunics/ansible
  ansible-playbook -i inventory.yml $*
)
