{% if item.return %}
  <h5 class="sb-item__sub-heading">Returns</h5>

  <div class="sb-item__description  item__description--inline">
  {% if item.return.type == '*' %}
    Any type
  {% else %}
    <code>{{ item.return.type | display_as_type }}</code>
  {% endif %}
  {% if item.return.description %} &mdash; {{ item.return.description|safe }}{% endif %}
  </div>
{% endif %}
