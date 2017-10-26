{% if item.todo.length > 0 %}
  <h5 class="sb-item__sub-heading">TODO's</h5>

  <ul class="sb-list-unstyled">
    {% for todo in item.todo %}
      <li>{{ todo|safe }}</li>
    {% endfor %}
  </ul>
{% endif %}
