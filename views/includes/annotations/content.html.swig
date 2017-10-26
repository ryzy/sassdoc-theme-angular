{% if 'content'|in(item) %}
  <p><b>NOTE</b>: This mixin allows extra content to be passed (through the <code>@content</code> directive).{% if item.content !== "" %} Role: {{ item.content }}</p>
{% endif %}
