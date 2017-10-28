{% set title_displayed = false %}

{% for usedBy in item.usedBy %}

  {% if (display.access.indexOf(usedBy.access) != -1) and not (not display.alias and usedBy.alias) %}

    {% if not title_displayed %}
      {% set title_displayed = true %}
      <h5 class="sb-item__sub-heading">Used by</h5>
      <ul class="sb-list-unstyled">
    {% endif %}

    <li>
      <a href="{{basePath}}/{{ usedBy.group }}#{{ usedBy.context.type }}-{{ usedBy.context.name }}"><code>{{ usedBy.context.name }}</code></a>
      <mat-chip-list class="sb-item__cross-type"><mat-chip>{{ usedBy.context.type }}</mat-chip></mat-chip-list>
    </li>
  {% endif %}

{% endfor %}

{% if title_displayed %}
</ul>
{% endif %}
