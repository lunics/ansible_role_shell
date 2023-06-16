#!/usr/bin/env bash

{# if a $PATH/bin is broken, xorg can fail to boot  #}
{# needed it to load xprofile startup programs + i3 volume and light shortcut #}
source {{ path_exports }}
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')  # remove duplicate PATH entries

{% if gui_enable %}
{% if display_server == "xorg" %}
# $(pacman -Qs libxft-bgra-git >/dev/null 2>&1) && \      ## parfois libxft-bgra-git doit être remplacé par libxft-bgra
# $(pacman -Qs libxft-bgra >/dev/null 2>&1) && \
if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  ! pidof -s Xorg >/dev/null 2>&1 && \
    exec startx {{ exports_gui.XINITRC }}
fi
{% elif compositor == "wayland" %}
if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then    # XDG_VNTR only avalaible with systemd os
{% if window_manager == "sway" %}
  exec sway --debug &> {{ path_logs }}/sway.log
{% elif window_manager == "hyprland" %}
  exec Hyprland &> {{ path_logs }}/hyprland.log
{% else %}
  exec $WM
{% endif %}
fi
{% endif %}
{% endif %}