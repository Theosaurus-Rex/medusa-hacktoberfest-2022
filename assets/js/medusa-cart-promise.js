const cartPromise = medusaAPI.carts.retrieve(localStorage.getItem('cart_id'))
  .then(({ cart }) => {
    const lineItems = [];
    cart.items.forEach(item => {
      lineItems.push(item);
    });
    return lineItems;
  });
