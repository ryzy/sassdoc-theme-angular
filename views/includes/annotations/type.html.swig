{% if item.type %}
<p>
  <strong class="sb-item__sub-heading">Type:</strong>
  {% if item.type == "*" %}
    Any
  {% else %}
    <code>{{ item.type | display_as_type }}</code>
  {% endif %}
</p>
{% endif %}
