require "test_helper"

class VisitorCanAdjustGifQuantityTest < ActionDispatch::IntegrationTest
  test "cart total is adjusted based on each gifs quantity" do
    gif = create(:gif)
    visit gif_path(gif)
    click_on "Add to cart"
    click_link "Cart(1)"

    assert_equal "/cart", current_path
    within page.all("tr")[1] do
      assert page.has_content?(gif.title)
      assert page.has_content?("1")
    end

    select(2)
    click_on "Update Quantity"

    assert_equal "/cart", current_path

    within page.all("tr")[1] do
      assert page.has_content?("2")
      assert page.has_content?("$2.00")
    end
    assert page.has_content?("Total: $2.00")

    select(1)
    click_on "Update Quantity"

    assert_equal "/cart", current_path

    within page.all("tr")[1] do
      assert page.has_content?("1")
      assert page.has_content?("$1.00")
    end
    assert page.has_content?("Total: $1.00")
  end
end
