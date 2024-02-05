{% for f_item in item.1 | dict2items(key_name="alias", value_name="command") %}
alias {{ f_item.alias }}=" {{ f_item.command }} "
{% endfor %}
