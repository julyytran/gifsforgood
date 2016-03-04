require "test_helper"

class VisitorAddsGifToCartTest < ActionDispatch::IntegrationTest
  test "displays message about putting gif in cart and shows cart content" do
    gif = create(:gif)

    visit gif_path(gif)

    refute page.has_content?("Cart")

    click_button "Add to cart"

    assert page.has_content?("You added 1 license for #{gif.title}")
    assert page.has_content?("Cart(1)")
  end

  test "after purchase visitor views cart and sees gif" do
    gif = create(:gif)
    visit gif_path(gif)
    click_button "Add to cart"

    click_link "Cart(1)"

    assert_equal "/cart", current_path
    assert page.has_content?(gif.title)
    assert page.has_content?(gif.description)
    assert page.has_content?("$1")
    assert page.has_content?(gif.description)
    assert page.has_content?("Total: $1")
  end
end
