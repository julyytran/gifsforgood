require "test_helper"

class VisitorCanAdjustGifQuantityTest < ActionDispatch::IntegrationTest
  test "cart total is adjusted based on each gifs quantity" do
  # Background: My cart has an item in it
    gif = create(:gif)
    #     As a visitor

    visit gif_path(gif)
    click_on "Add to cart"

    #     When I visit "/cart"
    click_link "Cart(1)"
    # save_and_open_page
    assert_equal "/cart", current_path
    ######## arange page layout so that quantity is displayed like this #########
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
