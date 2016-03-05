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
    order = user.orders.create(total_price: cart.total_price, status: "Pending")
    binding.pry
    cart_gifs.each do | cart_gif |
      order.order_gifs.create(gif_id: cart_gif.id, quantity: cart_gif.quantity, subtotal: cart_gif.subtotal)
    end
    binding.pry
    order
  end

end
