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
      assert page.has_content?("$2")
    end
    assert page.has_content?("Total: $2")

    select(1)
    click_on "Update Quantity"

    assert_equal "/cart", current_path

    within page.all("tr")[1] do
      assert page.has_content?("1")
      assert page.has_content?("$1")
    end
    assert page.has_content?("Total: $1")
    # assert page.has_content? ("Quantity: 1")
    ##########
    # Then I should see my item with a quantity of 1

    # And when I increase the quantity
    # Then my current page should be '/cart'
    # And that item's quantity should reflect the increase
    # And the subtotal for that item should increase
    # And the total for the cart should match that increase
    # And when I decrease the quantity
    # Then my current page should be '/cart'
    # And that item's quantity should reflect the decrease
    # And the subtotal for that item should decrease
    # And the total for the cart should match that decrease
  end
end
