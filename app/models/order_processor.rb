class OrderProcessor
  attr_reader :cart,
              :cart_gifs,
              :user

  def initialize(cart, user)
    @cart = cart
    @cart_gifs = cart.cart_gifs
    @user = user
  end

  def process_order
    order = Order.create(total_price: cart.total_price, status: "Pending")
    user.orders << order
    cart_gifs.each do | cart_gif |
      order.order_gifs.create(gif_id: cart_gif.id, quantity: cart_gif.quantity, subtotal: cart_gif.subtotal)
    end
    order
  end

end
