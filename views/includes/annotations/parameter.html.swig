<h5 class="sb-item__sub-heading">Parameters</h5>

{% if item.parameter.length > 0 %}

  <table class="sb-item__parameters">
    <thead>
      <tr>
        <th scope="col"><span class="sb-visually-hidden">{{ item.type }} parameter </span>Name</th>
        <th scope="col"><span class="sb-visually-hidden">{{ item.type }} parameter </span>Type</th>
        <th scope="col"><span class="sb-visually-hidden">{{ item.type }} parameter </span>Default value</th>
        <th scope="col"><span class="sb-visually-hidden">{{ item.type }} parameter </span>Description</th>
      </tr>
    </thead>
    <tbody>
      {% for parameter in item.parameter %}
        <tr class="sb-item__parameter">
          <th scope="row" data-label="name"><code>${{ parameter.name }}</code></th>
          <td data-label="type">
            <code>{% if parameter.type == '*' %}Any{% else %}{{ parameter.type | display_as_type }}{% endif %}</code>
          </td>
          <td data-label="default">
          {% if not parameter.default %}
            <code>&mdash;<span class="sb-visually-hidden"> none</span></code>
          {% else %}
            {% if (parameter.type|lower).indexOf('color') > -1 and parameter.resolvedValue|is_color == true %}
              <code class="sb-color-preview--inline" style="background:{{ parameter.resolvedValue }}; color: {{ parameter.resolvedValue | yiq }}">{{ parameter.default }}</code>
            {% else %}
              <code>{{ parameter.default }}</code>
            {% endif %}
          {% endif %}
          </td>
          <td data-label="desc">{{ parameter.description|default('&mdash;<span class="sb-visually-hidden"> none</span>')|safe }}</td>
        </tr>
      {% endfor %}
    </tbody>
  </table>

{% else %}

  <p>None.</p>

{% endif %}
