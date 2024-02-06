# Ansible role: SHELL

{{ path_config }} et autre fonctionne sans le /home/{{ default_user }} car le role s'exécute en default_user



*Work in progress.*

Configure bash, zsh, exports, aliases, history, prompt.

Intended for only one user:
 - for desktop: never needed multi users on personnal machine
 - for server:  no need multiple shells configurations, they must be managed by IaC

Only tested on Archlinux.

Use [atuin](https://github.com/ellie/atuin) as a replacement for the history.

Use [starship](https://github.com/starship/starship) as a replacement for the shell prompt.

## Usage
Override [defaults](https://github.com/lunics/ansible_role_shell/tree/main/defaults/main)
```yaml
shell_aliases:
  - "{{ list_aliases_1 }}"
  - "{{ list_aliases_2 }}"

# example for list_aliases.yml:
list_aliases_1:
  l: exa -l --group-directories-first
  q: exit
  ip: ip --color=auto
  c-: c -
  md: /usr/bin/mkdir -pv
  size:  du -sh
  grpe:  grep
```

```yaml
# examples present in shell/defaults/main/exports/*
shell_exports: []
  - "{{ exports_path }}"
  - "{{ exports_xdg  }}"
```
```yaml
shell_scripts: []
  - "{{ path_files }}/scripts/files"
  - "{{ path_files }}/scripts/packages"
  - "{{ path_files }}/scripts/others"
  - "{{ path_files }}/scripts/network"
  - "{{ path_files }}/scripts/git"
```
```yaml
shell_functions: []
  - "{{ path_files }}/scripts/functions"
```
### TODO
- supprimer les defaults/*
- home_dirs.yml
- try remove profile.yml for bash and zsh
- templates/zshrc : source $LOCAL/repo/git-subrepo/.rc
- move motd to another role ?
