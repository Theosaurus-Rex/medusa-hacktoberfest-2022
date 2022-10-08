---
layout: default
title: "Collections"
permalink: /collections/
---

<div class="py-24 max-w-xl mx-auto text-center">
  <h1 class="text-xl mb-12">
    <span class="text-4xl block">
      Collections
    </span>

    <span class="uppercase font-light">
      Product collections will live here.
    </span>
  </h1>

<h2>{{ site.data.generated.collections.count }} collections</h2>

{% for collection in site.data.generated.collections.collections %}

<ul>
  <li>{{ collection.title }}</li>
</ul>

{% endfor %}
</div>
