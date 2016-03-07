class CartGif < SimpleDelegator
  attr_reader :quantity

  def initialize(gif_id, quantity)
    @gif = Gif.find(gif_id)
    @quantity = quantity
    super(@gif)
  end

  def subtotal
    quantity * price.to_f / 100
  end

  def format_price
    price.to_f / 100
  end
end
