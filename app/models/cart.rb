class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_gif(gif_id)
    contents[gif_id.to_s] ||= 0
    contents[gif_id.to_s] += 1
  end

  def remove_gif(gif_id)
    contents.reject! { |id| id == gif_id.to_s }
  end

  def total_items
    contents.values.sum
  end

  def total_price
    prices = cart_gifs.map do |cart_gif|
      (cart_gif.quantity * cart_gif.gif.price).to_f / 100
    end
    "$#{prices.reduce(:+)}0"
  end

  def cart_gifs
    contents.map do |gif_id, quantity|
      CartGif.new(gif_id, quantity)
    end
  end
end
