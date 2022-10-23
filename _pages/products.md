---
layout: default
title: Products
permalink: /products/
---

<script src="/assets/js/medusa-process-products.js"></script>

<div class="flex flex-row flex-wrap max-w-screen" x-data="{ products: processProducts(medusaAPI.products.list()) }">
{% for product in site.data.generated.products.products %}

<div x-data="{
    selectedVariantId: '{{product.variants[0].id}}',
    variants: [
        {% for variant in product.variants %}
        ['{{variant.id}}', '{{variant.title}}'],
        {% endfor %}
    ],
  }"
class="">
<div class="flex justify-center">
<a href="/products/{{ product.handle }}">
  <img src="{{ product.thumbnail }}" alt="{{ product.title }}" style="width: 15em">
</a>
</div>

<div class="flex-auto p-6">
<div class="flex flex-col justify-between" style="width: 15em">
<h1 class="flex-auto text-lg font-semibold text-slate-900">{{ product.title }}</h1>
<p>{{ product.description }}</p>

<div class="flex items-baseline mt-4 mb-6 pb-3 border-b border-slate-200 block">
<div class="space-x-2 flex text-sm">
<select name="variants" x-model="selectedVariantId" class="">
  <template x-for="variant in variants" x-key="variant[0]">
    <option x-bind:value="variant[0]" x-text="variant[1]"></option>
  </template>
</select>
</div>
</div>

<!-- TODO: add variant prices here -->

<div class="flex space-x-4 mb-6 text-sm font-medium">
<div class="flex-auto flex space-x-4 block">
<button type="button"
  x-on:click="
    medusaAPI.carts.lineItems.create(localStorage.getItem('cart_id'), {
      variant_id: `${selectedVariantId}`,
      quantity: 1
    })
  "
  class="btn px-4 py-2 block rounded-md bg-purple-500 text-white hover:bg-purple-700 w-fit active"
>
  Add to cart
</button>
</div>
</div>
</div>
</div>

<!-- <button class="bg-black-500" onclick="/products/{{ product.handle }}">Read more</button> -->
</div>
{% endfor %}
</div>
<script defer src="https://unpkg.com/alpinejs@3.10.3/dist/cdn.min.js"></script>
