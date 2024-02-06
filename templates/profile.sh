#!/usr/bin/env bash

{# if a $PATH/bin is broken, xorg can fail to boot  #}
{# needed it to load xprofile startup programs + i3 volume and light shortcut #}
source {{ path_exports }}
{# remove duplicate PATH entries #}
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

{%- if gui_enable %}
{%   if display_server == "xorg" %}
if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  ! pidof -s Xorg >/dev/null 2>&1 && \
    exec startx {{ exports_gui.XINITRC }}
fi
{%   elif compositor == "wayland" -%}
{# XDG_VNTR is only avalaible on systemd #}

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
{%     if window_manager == "sway" %}
  exec sway --debug &> {{ path_logs }}/sway.log
{%     elif window_manager == "hyprland" %}
  exec Hyprland --config {{ path_config}}/hypr/hyprland.conf &> {{ path_logs }}/hyprland.log
{%     else %}
  exec $WM
{%     endif %}
fi
{%   endif %}
{% endif -%}
source {{ path_shell }}/sources.sh
