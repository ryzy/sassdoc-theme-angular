{% if item.example.length > 0 %}
  <!--<h3 class="sb-item__sub-heading">Example</h3>-->

  {% for example in item.example %}
    <sb-example
      description="{{ example.description }}"
      language="{{ example.type }}"
      code="{{ example.code | escape | ngSafe }}"
    >{{ example.code | ngSafe }}</sb-example>
  {% endfor %}
{% endif %}
