#!/usr/bin/env bash

{% for item in exports | dict2items(key_name="export", value_name="value") %}
  {% if item.value | regex_search("\$\(") %}    {# when item.value start by $(command) then don't add quotes #}
export {{ item.export }}={{ item.value }}
  {% else %}
export {{ item.export }}="{{ item.value }}"
  {% endif %}
{% endfor %}