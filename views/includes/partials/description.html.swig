{% if description %}
<section class="sb-main__section">
  <div class="sb-container">
    {{ description | raw | ngSafe }}
  </div>
</section>
{% endif %}
