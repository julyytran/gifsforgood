class CartGif < SimpleDelegator
  attr_reader :gif, :quantity

  def initialize(gif_id, quantity)
    @gif = Gif.find(gif_id)
    @quantity = quantity
  end

  def subtotal
    "$#{quantity * gif.price / 100}"
  end
end
