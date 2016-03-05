require "test_helper"

class UserCanCreateAnOrderTest < ActionDispatch::IntegrationTest
  test "user can can checkout of cart to create an order" do
    skip
    user = User.create(username: "Dom", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    gif = create(:gif)
    visit gif_path(gif)
    click_on "Add to cart"

    click_on "Checkout"
    assert_equal "/checkout", current_path

    assert page.has_content?(gif.title)
    assert page.has_content?(gif.description)
    assert page.has_content?("1")

    click_on "Accept Order"
    assert page.has_content?("Order Created")
  end
end
