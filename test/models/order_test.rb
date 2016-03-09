require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  should validate_presence_of(:status)
  should validate_presence_of(:total_price)
  should validate_numericality_of(:total_price).
    is_greater_than(0)
  should belong_to(:user)
  should have_many(:order_gifs)
  should have_many(:gifs)

  test "order status returns correct order status" do
    user = User.create(username: "Jade", password: "passsword")
    order1 = user.orders.create(status: "completed")
    order2 = user.orders.create(status: "cancelled")
    order3 = user.orders.create(status: "pending")

    assert_equal "Order Complete on #{order1.updated_at}", order1.order_status
    assert_equal "Order cancelled on #{order2.updated_at}", order2.order_status
    assert_equal "In progress", order3.order_status
  end
end
