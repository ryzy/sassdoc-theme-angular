{% if item.throw.length > 0 %}
  <h5 class="sb-item__sub-heading">Throws</h5>

  <ul class="sb-list-unstyled">
    {% for _throw in item.throw %}
      <li>{{ _throw|safe|ngSafe }}</li>
    {% endfor %}
  </ul>
{% endif %}
