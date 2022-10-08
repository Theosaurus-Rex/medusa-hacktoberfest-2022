// if there isn't a cart_id in local storage, create one
// and store it in local storage
if (localStorage.getItem('cart_id') === null) {
  medusaAPI.carts.create()
  .then(({ cart }) => {
    localStorage.setItem('cart_id', cart.id);
  });
}
