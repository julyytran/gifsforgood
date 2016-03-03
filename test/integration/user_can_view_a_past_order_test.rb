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
    #make join table order gifs

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit "/orders"

    assert page.has_link?("Order: #{order.id}")

    click_on "Order: 1"

    assert_equal "/order/1", current_path

    #       Then I should see each item that was ordered with the quantity and line-item subtotals
    order.gifs.each do |gif|
      assert page.has_link?("#{gif.title}")
      assert page.has_css?("img[src='#{gif.image}']")
    end

    #       And I should see links to each item's show page
    #gif title is link to gif show

    assert page.has_content?("#{order.status}")
    assert page.has_content?("#{order.price}")
    assert page.has_content?("#{order.created_at}")


    #       If the order was completed or cancelled
    #       Then I should see a timestamp when the action took place
    #assert can see updated at time and whether it was completed or cancelled

    #       And if any of the items in the order were retired from the menu
    # "retire" = sold out. Retire a gif that was in the order

    #       Then they should still be able to access the item page
    # assert can go to show for retired gif

    #       But they should not be able to add the item to their cart
    # refute that there is the button "add to cart"
  end
end
