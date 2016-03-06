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

    create_and_login_user

    visit '/cart'
    assert page.has_content?("Cart(2)")
  end
end
