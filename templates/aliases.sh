{% for item in shell_aliases | dict2items(key_name="alias", value_name="command") %}
alias {{ item.alias }}=" {{ item.command }} "
{% endfor %}
