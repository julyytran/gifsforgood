class CartGif < SimpleDelegator
  attr_reader :quantity

  def initialize(gif_id, quantity)
    @gif = Gif.find(gif_id)
    @quantity = quantity
    super(@gif)
  end

  def subtotal
    "$#{quantity * price / 100}"
  end
end
