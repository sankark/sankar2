{% extends "base.tpl" %}

{# Page for TABLET+ #}

{% block main %}
<div {% include "_language_attrs.tpl" id=id %}>
	{% include "_meta.tpl" %}

	{% if m.rsc[id].summary %}
		<p class="summary"><b>{{ m.rsc[id].summary }}</b></p>
	{% endif %}

	{% block depiction %}
	    {% include "_page_depiction.tpl" %}
	{% endblock %}
	{% include "_address.tpl" %}

    <div class="body">
    {% block body %}
	{{ m.rsc[id].body }}
	{% include "_blocks.tpl" %}
	{% endblock %}
	</div>

	{% block below_body %}
	{% endblock %}
	
	{% block seealso %}
        {% include "_content_list.tpl" list=id.o.haspart in_collection=id is_large %}
        {% include "_content_list.tpl" list=id.o.relation is_large %}
	{% endblock %}
	
	{% block thumbnails %}
	    {% include "_page_thumbnails.tpl" %}
	{% endblock %}
</div>
{% endblock %}

{% block subnavbar %}
	{% catinclude "_subnavbar.tpl" id %}
	&nbsp;
{% endblock %}

