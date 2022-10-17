---
layout: default
title: Products
permalink: /products/
---

<script src="/assets/js/medusa-process-products.js"></script>

<div class="flex" x-data="{ products: processProducts(medusaAPI.products.list()) }">
{% for product in site.data.generated.products.products %}

<div>
<a href="/products/{{ product.handle }}">
  <h1>{{ product.title }}</h1>
  <img src="{{ product.thumbnail }}" alt="{{ product.title }}" style="width: 100px">
</a>
<p>{{ product.description }}</p>

{% for variant in product.variants %}

  <h4>{{ variant.title }}</h4>
  <template x-if="await products">
    <p>Stock: <span x-html="(await products)['{{ product.id }}'].variantsById['{{ variant.id }}'].inventory_quantity"></span></p>
  </template>

  {%
    include add_to_cart_button.html button_name="Add to cart"

    button_classes="px-4 py-2 rounded-md bg-purple-500 text-white hover:bg-purple-700 w-fit"

    variant_id=variant.id
  %}

{% for price in variant.prices %}
  <p>{{ price.amount }} {{ price.currency_code }}</p>
{% endfor %}
{% endfor %}
<button class="bg-black-500" onclick="/products/{{ product.handle }}">Read more</button>
</div>
{% endfor %}
</div>
<script defer src="https://unpkg.com/alpinejs@3.10.3/dist/cdn.min.js"></script>
