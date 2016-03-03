require "test_helper"

class UserCanViewAllPastOrdersTest < ActionDispatch::IntegrationTest
  test "user sees title for all past orders" do
    user = User.create(username: "Jonas", password: "password")
    order1 = user.orders.create
    order2 = user.orders.create

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/orders"

    assert page.has_content?("Order: #{order1.id}")
    assert page.has_content?("Order: #{order2.id}")
  end
end
