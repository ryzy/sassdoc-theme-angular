{% if 'deprecated'|in(item) %}
  <div class="sb-item__deprecated"><strong>Deprecated!</strong> {{ item.deprecated|safe }}</div>
{% endif %}
