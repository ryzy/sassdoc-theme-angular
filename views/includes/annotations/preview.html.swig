{% set linkUrl = (codePreviewBaseUrl+'/'+item.file.path+'#L'+item.context.line.start+'-L'+item.context.line.end) %}

{# Placeholders #}
{% if item.context.type == "placeholder" %}

<sb-code-preview
    class="sb-sb-code-preview--{{ item.context.type }}-type"
    codeSourceUrl="{{ linkUrl }}"
    >{{ item.context.code | escape | ngSafe }}</sb-code-preview>

{# Variables #}
{% elseif item.context.type == "variable" %}

<sb-code-preview
    class="sb-sb-code-preview--{{ item.context.type }}-type"
    codeSourceUrl="{{ linkUrl }}"
  >${{ item.context.name }}: {{ item.context.value | escape | ngSafe }}</sb-code-preview>

  {% if (item.type|lower).indexOf('color') > -1 and item.resolvedValue|is_color == true %}
    <span class="sb-color-preview--block" style="background: {{ item.resolvedValue }};"></span>
  {% endif %}

{# Plain CSS #}
{% elseif item.context.type == "css" %}
  <sb-code-preview
    class="sb-sb-code-preview--{{ item.context.type }}-type"
    codeSourceUrl="{{ linkUrl }}"
  >{{ item.context.value | escape | ngSafe }}</sb-code-preview>

{# Functions and mixins #}
{% else %}

  {% set parameters_string = '' %}
  {% for parameter in item.parameter %}
    {% set value = '$' + parameter.name %}

    {% if parameter.default %}
      {% set value = value + ': ' + parameter.default %}
    {% endif %}

    {% if parameter.type|lower === "arglist" %}
      {% set value = value + '...' %}
    {% endif %}

    {% if loop.first %}
      {% set parameters_string = value %}
    {% else %}
      {% set parameters_string = parameters_string + ', ' + value %}
    {% endif %}
  {% endfor %}

  <sb-code-preview
    class="sb-sb-code-preview--{{ item.context.type }}-type"
    codeSourceUrl="{{ linkUrl }}"
    codeTitle="{{ item.context.name }}({{ parameters_string }})"
    >{{ item.context.code | escape | ngSafe }}</sb-code-preview>

{% endif %}
