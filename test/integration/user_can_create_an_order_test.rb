require "test_helper"

class UserCanCreateAnOrderTest < ActionDispatch::IntegrationTest
  test "logged_in user sees Stripe checkout process after checking out from cart" do

    user = create(:user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    gif = create(:gif)

    visit gif_path(gif)
    click_link "Add to cart"
    visit "/cart"

    within "table" do
      click_on "Checkout"
    end

    assert_equal new_charge_path, current_path
    assert page.has_content?("Please provide a payment method to continue with your purchase.")
  end

  test "logged out user prompted to log in before checkout" do
    user = create(:user)
    gif = create(:gif)
    visit gif_path(gif)
    click_link "Add to cart"
    visit "/cart"
    within "table" do
      click_on "Checkout"
    end

    assert_equal "/login", current_path
    assert page.has_content? "Please login or create a new account before checking out."

    fill_in "Username", with: "#{user.username}"
    fill_in "Password", with: "#{user.password}"

    within ".login" do
      click_on "Login"
    end

    assert_equal "/dashboard", current_path
    assert page.has_content?("logged_in_as_#{user.username}")

    visit "/cart"
    within "table" do
      click_on "Checkout"
    end
  end

  test "user can create multiple orders and view them" do
    user = create(:user)
    gif = create(:gif)
    gif2 = create(:gif)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit gif_path(gif)
    click_link "Add to cart"

    visit "/cart"

    within "table" do
      click_on "Checkout"
    end

    assert page.has_content? "Please provide a payment method to continue with your purchase."

    visit gif_path(gif2)
    click_link "Add to cart"

    visit "/cart"

    within "table" do
      click_on "Checkout"
    end

    visit orders_path

    assert page.has_content? "order_#{user.orders.first.id}"
    assert page.has_content? "order_#{user.orders.last.id}"
  end
end
