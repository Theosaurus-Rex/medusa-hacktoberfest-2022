---
layout: default
title: Products
permalink: /products/
---

<script src="/assets/js/medusajs.js"></script>
<script>
  async function processProducts(products) {
    const productsById = {};
    for (const product of (await products).products) {
      productsById[product.id] = product;

      product.variantsById = {};
      for (const variant of product.variants) {
        product.variantsById[variant.id] = variant;
      }
    }
    return productsById;
  }
</script>

<div class="flex" x-data="{ products: processProducts(medusaAPI.products.list()) }">
{% for product in site.data.products.products %}

<div class="flex flex-col">
<h1>{{ product.title }}</h1>
<p>{{ product.description }}</p>

{% for variant in product.variants %}

  <h4>{{ variant.title }}</h4>
  <template x-if="await products">
    <p>Stock: <span x-html="(await products)['{{ product.id }}'].variantsById['{{ variant.id }}'].inventory_quantity"></span></p>
  </template>

{% for price in variant.prices %}
  <p>{{ price.amount }} {{ price.currency_code }}</p>
{% endfor %}
{% endfor %}
</div>
{% endfor %}
</div>
<script defer src="https://unpkg.com/alpinejs@3.10.3/dist/cdn.min.js"></script>
