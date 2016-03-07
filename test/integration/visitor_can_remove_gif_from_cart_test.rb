require "test_helper"

class VisitorCanRemoveGifFromCartTest < ActionDispatch::IntegrationTest
  test "visitor no longer sees removed item in cart" do
    gif = create(:gif)
    gif2 = create(:gif)
    visit gif_path(gif)
    click_link "Add to cart"
    visit gif_path(gif2)
    click_link "Add to cart"

    click_link "Cart(2)"

    within first("#gif-info", minimum: 1) do
      click_link("Remove")
    end

    assert_equal "/cart", current_path
    assert page.has_content?(gif2.title)
    refute page.has_content?(gif.description)

    assert page.has_content?("Successfully removed license for #{gif.title}")
    assert page.has_link?(gif.title)
  end
end
