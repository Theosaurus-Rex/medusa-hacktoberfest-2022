<!-- identify featured collection -->
{% for collection in site.data.generated.collections.collections %}
{% if collection.title == "featured" %}
{% assign featured_collection = collection %}
{% endif %}
{% endfor %}

<!-- get all products in featured collection -->
{% for product in site.data.generated.products.products %}
{% if product.collection.id == featured_collection.id %}

<!-- get lowest price of all variants -->
{% for variant in product.variants %}
{% assign currency_to_compare = variant.prices[0].currency_code %}
{% assign lowest_price = variant.prices[0].amount %}
{% for price in variant.prices %}
{% if price.currency_code == currency_to_compare %}
{% if price.amount < lowest_price %}
{% assign lowest_price = price.amount %}
{% endif %}
{% endif %}
{% endfor %}
{% endfor %}

<div class="grid grid-cols-12 gap-4"> <!-- TODO: create two columns -->
<div class="flex font-sans">
  <div class="flex-none w-48 relative">
    <img src="{{ product.thumbnail }}" alt="{{ product.title }}" class="absolute inset-0 w-full h-full object-cover" loading="lazy" />
  </div>
  <form class="flex-auto p-6">
    <div class="flex flex-wrap">
      <h1 class="flex-auto text-lg font-semibold text-slate-900">
        {{ product.title }}
      </h1>
      <div class="w-full flex-none text-sm font-medium text-slate-700 mt-2">
        {{ product.description }}
      </div>
    </div>
    <div class="text-lg font-semibold text-slate-500 items-baseline mt-4 mb-4 pb-6 border-b border-slate-200">
      From ${{ lowest_price }} {{ currency_to_compare }}
    </div>
    <div class="flex space-x-4 mb-6 text-sm font-medium">
      <div class="flex-auto flex space-x-4">
        <a href="/products/{{ product.handle }}" target="_blank"><button class="h-10 px-6 font-semibold rounded-md bg-purple-500 hover:bg-purple-700 text-white" type="button">
          View
        </button></a>
      </div>
    </div>
  </form>
</div>
</div>

{% endif %}
{% endfor %}
