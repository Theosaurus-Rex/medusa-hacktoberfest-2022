---
layout: default
title: Products
permalink: /products/
---

<div class="flex">
{% for product in site.data.products.products %}

<div class="flex flex-col">
<h1>{{ product.title }}</h1>
<p>{{ product.description }}</p>

{% for variant in product.variants %}

  <h4>{{ variant.title }}</h4>
{% for price in variant.prices %}
  <p>{{ price.amount }} {{ price.currency_code }}</p>
{% endfor %}
{% endfor %}
</div>
{% endfor %}
</div>
