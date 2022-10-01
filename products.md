---
layout: page
title: Products
permalink: /products/
---

{% for product in site.data.products.products %}

<h1>{{ product.title }}</h1>
<p>{{ product.description }}</p>

{% for variant in product.variants %}
  <h4>{{ variant.title }}</h4>
{% for price in variant.prices %}
  <p>{{ price.amount }} {{ price.currency_code }}</p>
{% endfor %}
{% endfor %}
{% endfor %}
