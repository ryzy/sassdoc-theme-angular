{% if item.author.length > 0 %}
  <h5 class="sb-item__sub-heading">Author{% if item.author.length > 1 %}s{% endif %}</h5>

  <ul class="sb-list-unstyled">
    {% for author in item.author %}
      <li>{{ author|safe }}</li>
    {% endfor %}
  </ul>
{% endif %}
