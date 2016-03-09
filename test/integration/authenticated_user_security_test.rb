require 'test_helper'

class AuthenticatedUserSecuirtyTest < ActionDispatch::IntegrationTest
  test "user cannot view other user's info" do
    user1 = create(:user)
    gif1 = create(:gif)
    order1 = user1.orders.create(total_price: 100, status: "Pending")
    order_gif1 = order1.order_gifs.create(
      gif_id: gif1.id, quantity: 1, subtotal: 100
    )

    user2 = create(:user)
    gif2 = create(:gif)
    order2 = user2.orders.create(total_price: 100, status: "Pending")
    order_gif2 = order2.order_gifs.create(
      gif_id: gif2.id, quantity: 1, subtotal: 100
    )
    ApplicationController.any_instance.stubs(:current_user).returns(user1)

    visit "/dashboard"

    assert page.has_content? "#{user1.username}"
    refute page.has_content? "#{user2.username}"

    visit "/orders"

     assert page.has_content? "order_#{order1.id}"
     refute page.has_content? "order_#{order2.id}"
  end

  test "user cannot view admin paths" do
    create_and_login_user

    visit "/admin/dashboard"

    refute page.has_content? "Admin Dashboard"
    assert page.has_content? "The page you were looking for doesn't exist"
  end

  test "user cannot make self admin" do
    create_and_login_user

    visit "/users/new"

    refute page.has_content? "Role"
  end
end
