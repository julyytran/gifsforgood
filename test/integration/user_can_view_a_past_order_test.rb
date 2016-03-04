require "test_helper"

class UserCanViewAPastOrderTest < ActionDispatch::IntegrationTest
  test "user sees details about their order" do
    user = User.create(username: "Jade", password: "passsword")
    order = user.orders.create
    order.gifs.create(
      title: "hotline bling",
      description: "cuz I know when that hotline bling",
      price: 100,
      image: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/orders"

    assert page.has_link?("Order: #{order.id}")

    click_on "Order: #{order.id}"

    assert_equal "/orders/#{order.id}", current_path

    order.gifs.each do |gif|
      assert page.has_link?("#{gif.title}")
      assert page.has_css?("img[src='#{gif.image}']")
    end

    order.order_gifs.each do |order_gif|
      assesrt page.has_content?(order_gif.quantity)
      assesrt page.has_content?(order_gif.subtotal)
    end

    assert page.has_content?("#{order.status}")
    assert page.has_content?("#{order.total_price}")
    assert page.has_content?("#{order.created_at}")

    assert page.has_content?("#{order.updated_at}")
  end

  test "user can see if order is complete" do
    skip
    assert page.has_content?("#{order.complete?}")

    #       If the order was completed or cancelled
    #       Then I should see a timestamp when the action took place
    #assert can see updated at time and whether it was completed or cancelled
  end


  test "" do
  skip
    #       And if any of the items in the order were retired from the menu
    # "retire" = sold out. Retire a gif that was in the order

    #       Then they should still be able to access the item page
    # assert can go to show for retired gif

    #       But they should not be able to add the item to their cart
    # refute that there is the button "add to cart"
  end
end
