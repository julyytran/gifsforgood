class CartGif < SimpleDelegator
  attr_reader :quantity

  def initialize(gif)
    super
  end

  def quantity
    10
  end

  def subtotal
    "$#{quantity * self.price / 100}"
  end
end

# class LazyEmployee < SimpleDelegator
#   def initialize(sandwich_maker)
#     super
#   end
# end
