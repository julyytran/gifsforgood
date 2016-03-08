require "test_helper"

class UserCanViewAllPastOrdersTest < ActionDispatch::IntegrationTest
  test "user sees title for all past orders" do
    user = User.create(username: "Jonas", password: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    order1 = user.orders.create(total_price: 10000)
    order2 = user.orders.create(total_price: 10000)

    visit "/orders"

    assert page.has_link?("order_#{order1.id}")
    assert page.has_link?("order_#{order2.id}")
  end
end
