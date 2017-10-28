<h3 class="sb-item__heading">
  <a class="sb-item__name" href="{{ basePath }}/{{ item.group }}#{{ item.context.type }}-{{ item.context.name }}">{{ item.context.name }}</a>

  <mat-chip-list>
    <mat-chip class="sb-item__type" color="accent" selected="true">{{ item.context.type }}</mat-chip>
    {% if item.access != "public" %}
      <mat-chip class="sb-item__access">{{ item.access }}</mat-chip>
    {% endif %}
  </mat-chip-list>

  {% if display.alias and item.aliased.length > 0 %}
    <span class="sb-item__aliased">(aliased as
    {% for alias in item.aliased %}
      <a href="{{ basePath }}/{{ item.group }}#{{ item.context.type }}-{{ alias }}"><code>{{ alias }}</code></a>
    {% endfor %}
    )</span>
  {% endif %}

  {% if item.alias %}
    <span class="sb-item__alias">(alias for <a href="{{ basePath }}/{{ item.group }}#{{ item.context.type }}-{{ item.alias }}"><code>{{ item.alias }}</code></a>)</span>
  {% endif %}
</h3>

{% if item.since.length == 1 %}
  <span class="sb-item__since">Since {{ item.since[0].version }}{% if item.since[0].description %} &mdash; {{ item.since[0].description }}{% endif %}</span>
{% endif %}
