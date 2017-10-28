{# No item documented #}
{% if data.length == 0 %}
  <!--<p class="sb-sidebar__item  sidebar__item&#45;&#45;heading">No documented item.</p>-->
{# Some items documented #}
{% else %}
  <div class="sb-sidebar__body">

    {# Loop over the groups #}
    {% for group_name, group in data.byGroupAndType %}
      <p class="sb-sidebar__item sb-sidebar__item--heading" data-slug="{{ group_name }}"><a routerLink="./">{{ groups[group_name] }}</a></p>

      {# Loop over the types #}
      {% for type, items in group %}
        {% if loop.first %}<div class="sb-sidebar__group-items">{% endif %}

        {# If items to be displayed in type #}
        {% if items.length > 0 %}
        <div class="sb-sidebar__item-list">
          <p class="sb-sidebar__item sb-sidebar__item--sub-heading" data-slug="{{ group_name + '-' + type }}"><a href="{{ basePath }}/{{ group_name }}#{{ type }}">{{ (type + 's') }}</a></p>

          {# Loop over the items #}
          {% for item in items %}
            {% if loop.first %}<ul class="sb-list-unstyled">{% endif %}
            <li class="sb-sidebar__item  sassdoc__item" data-group="{{ group_name }}" data-name="{{ item.context.name }}" data-type="{{ item.context.type }}">
              <a href="{{ basePath }}/{{ group_name }}#{{ item.context.type }}-{{ item.context.name }}">{{ item.context.name }}
              {% if item.access[0] == "private" %}<span class="sb-sidebar__annotation  sidebar__annotation--private">private</span>{% endif %}
              {% if item.alias != false %}<span class="sb-sidebar__annotation  sidebar__annotation--alias">alias</span>{% endif %}
              </a>
            </li>
            {% if loop.last %}</ul>{% endif %}
          {% endfor %}
        </div>
        {% endif %}
        {% if loop.last %}</div>{% endif %}
      {% endfor %}

    {% endfor %}
  </div>
{% endif %}
