{% for item in item[1] | dict2items(key_name="alias", value_name="command") %}
alias {{ item.alias }}=" {{ item.command }} "
{% endfor %}
