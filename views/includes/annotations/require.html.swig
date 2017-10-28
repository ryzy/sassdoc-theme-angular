{% set title_displayed = false %}
{% for require in item.require %}

  {% if (display.access.indexOf(require.item.access) != -1) and not (not display.alias and require.item.alias) or require.external %}
    {% if not title_displayed %}
      {% set title_displayed = true %}
      <h5 class="sb-item__sub-heading">Requires</h5>
      <ul class="sb-list-unstyled">
    {% endif %}

    {% if require.external %}
      <li class="sb-item__description  item__description--inline">
        {% if require.url %}
          <a href="{{ require.url }}"><code>{{ require.name }}</code></a>  {{ require.description }}</li>
        {% else %}
          <code>{{ require.name }}</code>
        {% endif %}

        <mat-chip-list class="sb-item__cross-type"><mat-chip>external</mat-chip></mat-chip-list>

        {% if require.description %}
          &mdash; {{ require.description }}
        {% endif %}
      </li>
    {% else %}
      <li class="sb-item__description  item__description--inline">
        <a href="{{basePath}}/{{ require.item.group }}#{{ require.item.context.type }}-{{ require.item.context.name }}">{{ require.item.context.name }}</a>
        <mat-chip-list class="sb-item__cross-type"><mat-chip>{{ require.item.context.type }}</mat-chip></mat-chip-list>

        {% if require.description %}
          &mdash; {{ require.description }}
        {% endif %}
      </li>
    {% endif %}
  {% endif %}

{% endfor %}

{% if title_displayed %}
</ul>
{% endif %}
