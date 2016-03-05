require "test_helper"

class UserCanViewAPastOrderTest < ActionDispatch::IntegrationTest
  test "user sees details about their order" do
    user = User.create(username: "Jade", password: "passsword")
    gif = create(:gif)
    order = user.orders.create(total_price: 100, status: "Pending")
    order_gif = order.order_gifs.create(
      gif_id: gif.id, quantity: 1, subtotal: 100
    )

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/orders"

    assert page.has_link?("Order: #{order.id}")

    click_on "Order: #{order.id}"

    assert_equal "/orders/#{order.id}", current_path

    order.order_gifs.each do |order_gif|
      assert page.has_link?(order_gif.gif.title)
      assert page.has_css?("img[src='#{order_gif.gif.image}']")
      assert page.has_content?(order_gif.quantity)
      assert page.has_content?(order_gif.subtotal)
    end

    assert page.has_content? order.status
    assert page.has_content? order.total_price
    assert page.has_content? order.created_at
    assert page.has_content? order.order_status
    assert page.has_content? order.updated_at
  end
end
