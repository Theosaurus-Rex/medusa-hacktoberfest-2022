{% for collection in site.data.generated.collections.collections %}
{% if collection.title == "featured" %}
{% assign featured_collection = collection %}
{% endif %}
{% endfor %}

{% for product in site.data.generated.products.products %}
{% if product.collection.id == featured_collection.id %}

<img src="{{ product.thumbnail }}" alt="{{ product.title }}" width="200" height="200">
<p>{{ product.title }}</p>
<p>{{ product.description }}</p>

{% endif %}
{% endfor %}
