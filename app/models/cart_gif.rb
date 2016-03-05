class CartGif < SimpleDelegator
  attr_reader :quantity

  def initialize(gif_id, quantity)
    @gif = Gif.find(gif_id)
    @quantity = quantity
    super(@gif)
  end

  # def quantity
  #   10
  # end

  def subtotal
    "$#{quantity * self.price / 100}"
  end
end

# class LazyEmployee < SimpleDelegator
#   def initialize(sandwich_maker)
#     super
#   end
# end
