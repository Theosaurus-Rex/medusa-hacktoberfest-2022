---
layout: default
title: Products
permalink: /products/
---

<script src="/assets/js/medusa-process-products.js"></script>

{% include navbar.html %}

<div class="flex" x-data="{ products: processProducts(medusaAPI.products.list()) }">
{% for product in site.data.generated.products.products %}

<div x-data="{
    selectedVariantId: '{{product.variants[0].id}}',
    variants: [
        {% for variant in product.variants %}
        ['{{variant.id}}', '{{variant.title}}'],
        {% endfor %}
    ],
  }">
<a href="/products/{{ product.handle }}">
  <h1>{{ product.title }}</h1>
  <img src="{{ product.thumbnail }}" alt="{{ product.title }}" style="width: 100px">
</a>
<p>{{ product.description }}</p>

<p>Select an option:</p>
<select name="variants" x-model="selectedVariantId" class="">
  <template x-for="variant in variants" x-key="variant[0]">
    <option x-bind:value="variant[0]" x-text="variant[1]"></option>
  </template>
</select>

<!-- TODO: add variant prices here -->

<button type="button"
  x-on:click="
    medusaAPI.carts.lineItems.create(localStorage.getItem('cart_id'), {
      variant_id: `${selectedVariantId}`,
      quantity: 1
    })
  "
  class="btn px-4 py-2 rounded-md bg-purple-500 text-white hover:bg-purple-700 w-fit active"
>
  Add to cart
</button>

<button class="bg-black-500" onclick="/products/{{ product.handle }}">Read more</button>
</div>
{% endfor %}
</div>
<script defer src="https://unpkg.com/alpinejs@3.10.3/dist/cdn.min.js"></script>
