  {# Menu aka Sidebar #}
  <aside class="sb-sidebar" role="nav">
    {% block sidebar %}{% endblock %}
  </aside>

  {# Main container #}
  <article class="sb-main" role="main">

    {# Include top navbar #}
    {% include "../includes/partials/header.html.swig" with project_title %}

    {# Include description #}
    {% include "../includes/partials/description.html.swig" %}

    {% block content %}{% endblock %}

    {# Include footer #}
    {% include "../includes/partials/footer.html.swig" with project_title %}
  </article>
