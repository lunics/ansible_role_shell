#!/bin/sh

export LF_ICONS="\
{% for item in icons_part1 | dict2items(key_name="extension", value_name="icon") %}
{{ item.extension }}={{ item.icon }} :\
{% endfor %}
{% for item in icons_part2 | dict2items(key_name="extension", value_name="icon") %}
*.{{ item.extension }}={{ item.icon }} :\
{% endfor %}
"
