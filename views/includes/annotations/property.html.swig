{% if item.property.length > 0 %}

<table class="sb-item__parameters">
  <thead>
    <tr>
      <th scope="col"><span class="sb-visually-hidden">{{ item.type }} key </span>Name</th>
      <th scope="col"><span class="sb-visually-hidden">{{ item.type }} key </span>Type</th>
      <th scope="col"><span class="sb-visually-hidden">{{ item.type }} key </span>Value</th>
      <th scope="col"><span class="sb-visually-hidden">{{ item.type }} key </span>Description</th>
    </tr>
  </thead>

  <tbody>
    {% for prop in item.property %}
      <tr class="sb-item__parameter">
        <th scope="row" data-label="name"><code>{{ prop.name }}</code></th>
        <td data-label="type">
          <code>{{ prop.type | display_as_type }}</code>
        </td>
        <td data-label="default">
        {% if not prop.default %}
          &mdash;<span class="sb-visually-hidden"> none</span>
        {% else %}
          {% if (prop.type|lower).indexOf('color') > -1 and prop.resolvedValue|is_color == true %}
            <code class="sb-color-preview--inline" style="background: {{ prop.resolvedValue }}; color: {{ prop.resolvedValue | yiq }};">{{ prop.default }}</code>
          {% else %}
            <code>{{ prop.default }}</code>
          {% endif %}
        {% endif %}
        </td>
        <td data-label="desc">{{ prop.description | default('&mdash;<span class="sb-visually-hidden"> none</span>') | safe }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>

{% endif %}
