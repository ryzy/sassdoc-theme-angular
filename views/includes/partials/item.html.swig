<a name="{{ group_name }}-{{ item.context.type }}-{{ item.context.name }}"></a>

<section class="sb-main__item sb-container sb-item{% if item.alias %} sb-item--alias{% endif %}{% if 'deprecated'|in(item) %} sb-item--deprecated{% endif %}">

{% include '../annotations/name.html.swig' %}

{% include '../annotations/deprecated.html.swig' %}

{% if not item.alias %}

  {% for annotation in display.annotations[item.context.type] %}
    {% set path = '../annotations/' + annotation + '.html.swig' %}
    {% include path %}
  {% endfor %}

  {% include '../annotations/preview.html.swig' %}

{% else %}

  <p>Refer to <a href="#{{ item.context.type }}-{{ item.alias }}">{{ item.alias }}</a>.</p>

{% endif %}

  <hr />
</section>
