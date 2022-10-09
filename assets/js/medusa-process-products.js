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
