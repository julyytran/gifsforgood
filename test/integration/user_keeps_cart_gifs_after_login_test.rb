require "test_helper"

class UserKeepsCartGifsAfterLoginTest < ActionDispatch::IntegrationTest
  test "user sees cart quantity remain after login" do
    gif = create(:gif)
    gif2 = create(:gif)

    visit gif_path(gif)
    click_on "Add to cart"

    visit gif_path(gif2)
    click_on "Add to cart"

    assert page.has_content?("Cart(2)")

    user = User.create(username: "July", password: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit '/cart'
    assert page.has_content?("Cart(2)")
    ############ add login/logout to navbar ###############
    # click_on("Logout")
    # assert page.has_content?("Login")
    # refute page.has_content?("Logout")
  end
end
