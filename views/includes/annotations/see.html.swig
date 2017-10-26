{% set title_displayed = false %}
{% for see in item.see %}

  {% if (display.access.indexOf(see.access) != -1) and not (not display.alias and see.alias) %}
    {% if not title_displayed %}
      {% set title_displayed = true %}
      <h5 class="sb-item__sub-heading">See</h5>
      <ul class="sb-list-unstyled">
    {% endif %}

    <li>
      <a href="{{basePath}}#{{ see.context.type }}-{{ see.context.name }}"><code>{{ see.context.name }}</code></a>
      <mat-chip-list class="sb-item__cross-type"><mat-chip>{{ see.context.type }}</mat-chip></mat-chip-list>
    </li>
  {% endif %}

{% endfor %}

{% if title_displayed %}
</ul>
{% endif %}
