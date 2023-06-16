# Ansible role: SHELL

Configure Bash, ZSH, exports, aliases

Use atuin as a replacement for the history
Use starship as the shell prompt

## Usage
```yaml
shell_aliases:
  - owner: "{{ default_user }}"
    list:
      - "{{ list_aliases }}"
  - owner: root
    list:
      - "{{ list_aliases }}"

shell_exports: []
  - owner: "{{ default_user }}"
    list:
      - "{{ exports_path }}"
      - "{{ exports_xdg  }}"

  - owner: root
    list:
      - "{{ exports_path }}"
      - "{{ exports_xdg  }}"

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