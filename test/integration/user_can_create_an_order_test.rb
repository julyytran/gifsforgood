require "test_helper"

class UserCanCreateAnOrderTest < ActionDispatch::IntegrationTest
  test "logged_in user can checkout of cart to create an order" do
    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    gif = create(:gif)
    visit gif_path(gif)
    click_on "Add to cart"
    visit "/cart"
    within "table" do
      click_on "Checkout"
    end

    assert_equal "/checkout", current_path
    assert page.has_content?(gif.title)
    assert page.has_content?(gif.description)
    assert page.has_content?("1")

    click_on "Accept Order"
    assert page.has_content?("Order was successfully placed.")
    assert_equal "/orders", current_path

    within "table" do
      assert page.has_content? user.orders.last.id
    end
  end

  test "logged out user prompted to log in before checkout" do

  end
end
