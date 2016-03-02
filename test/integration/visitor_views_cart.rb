require "test_helper"

class VisitorViewsCartTest < ActionDispatch::IntegrationTest
  test "visitor views their cart" do
    gif_1 = create(:gif)
    gif_2 = create(:gif)

    visit gif_path(gif_1)
    click_button "Purchase"
    click_link "Cart(1)"

    assert_equal cart_gifs_path(), current_path
    assert page.has_css?(gif_1.image)
    refute page.has_css?(gif_2.image)

    assert page.has_content(gif_1.title)
    assert page.has_content(gif_1.description)
    assert page.has_content(gif_1.price)
    assert page.has_content(gif_1.price)
    assert page.has_content("Total: $#{Cart.total}")
  end
end
