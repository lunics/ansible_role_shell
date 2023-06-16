# Ansible role: SHELL

Configure Bash, ZSH, exports, aliases

Use atuin as a replacement for the history
Use starship as the shell prompt

## Usage
Define the variables you want in your host_vars or group_vars.
```yaml
shell_aliases:
  - owner: "{{ default_user }}"
    list:
      - "{{ list_aliases_1 }}"
      - "{{ list_aliases_2 }}"
  - owner: root
    list:
      - "{{ list_aliases }}"

# example for list_aliases.yml:
list_aliases_1:
  l: exa -l --group-directories-first
  g: git
  q: exit
  r: trash
  s: sudo
  v: $EDITOR

  la: exa -lag --group-directories-first
  ip: ip --color=auto
  ra: ranger
  py: python
  c-: c -
  md: /usr/bin/mkdir -pv

  size:  du -sh
  mkdir: md
  move:  mv
  grpe:  grep
  pgrpe: pgrep
  ezsh:  exec zsh
  vim:   nvim
  vimdiff: nvim -d
  hist:    history

list_aliases_2: []
```

```yaml
# examples present in shell/defaults/main/exports/*
shell_exports: []
  - owner: "{{ default_user }}"
    list:
      - "{{ exports_path }}"
      - "{{ exports_xdg  }}"

  - owner: root
    list:
      - "{{ exports_path }}"
      - "{{ exports_xdg  }}"
```
```yaml
shell_scripts: []
  - owner: "{{ default_user }}"
    src:
      - "{{ path_files }}/scripts/files"
      - "{{ path_files }}/scripts/packages"
      - "{{ path_files }}/scripts/others"
      - "{{ path_files }}/scripts/network"
      - "{{ path_files }}/scripts/git"
    dest: "{{ path_bin }}"
  - owner: root
    src:
      - "{{ path_files }}/scripts/files"
    dest:  "{{ path_bin }}"

shell_functions: []
  - owner: "{{ default_user }}"
    src:
      - "{{ path_files }}/scripts/functions"
  - owner: root
    src:
      - "{{ path_files }}/scripts/functions"
```
