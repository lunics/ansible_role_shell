# Ansible role: SHELL

*Work in progress.*

Configure bash, zsh, exports, aliases.

Only tested on Archlinux.

Use [atuin](https://github.com/ellie/atuin) as a replacement for the history.

Use [starship](https://github.com/starship/starship) as a replacement for the shell prompt.

## Usage
Override [defaults](https://github.com/lunics/ansible_role_shell/tree/main/defaults/main)
```yaml
user:               # shell managing based on the user list
  - name:   root
    group:  root
    shell:  bash
  - name:   bar
    group:  wheel
    shell:  zsh

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
  q: exit
  ip: ip --color=auto
  c-: c -
  md: /usr/bin/mkdir -pv
  size:  du -sh
  grpe:  grep

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
```
```yaml
shell_functions: []
  - owner: "{{ default_user }}"
    src:
      - "{{ path_files }}/scripts/functions"
  - owner: root
    src:
      - "{{ path_files }}/scripts/functions"
```
### TODO
- essayer de supprimer profile.yml en le détournant
- templates/zshrc : source $LOCAL/repo/git-subrepo/.rc
- remove motd
