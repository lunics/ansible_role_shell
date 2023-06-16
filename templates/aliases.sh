#!/usr/bin/env bash

{% for item in aliases | dict2items(key_name="alias", value_name="command") %}
alias {{ item.alias }}=" {{ item.command }} "
{% endfor %}