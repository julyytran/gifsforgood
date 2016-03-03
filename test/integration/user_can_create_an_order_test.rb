require "test_helper"

class UserCanCreateAnOrderTest < ActionDispatch::IntegrationTest
  test "usern can can checkout of cart to create an order" do
    user = User.create(username: "Dom", password: "password")
    # as an authenticated user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    # when i have items in my cart
    gif = create(:gif)
    visit gif_path(gif)
    click_on "Add to cart"
    # and I click checkout
    click_on "checkout"

    assert_equal "/checkout", current_path
    # I expect to be taken to order summary

    assert page.has_content?(gif.title)
    # then if I click accept order
    click_on "Accept Order"    # I expect to see order show with order details

    assert_equal "/order", current_path
  end
end
